#Pigeons all the way down
""" 
To Do:
Clean up the clumsy string construction
    
"""
import maya.cmds as cmds
import pymel.core as pm
import subprocess
global items 

def search_and_replace_btn_clicked(items, refDict,filePath, window):
    #Gets called when the "Change refs to these versions?" Button is clicked.
    doit = cmds.confirmDialog(m="Search and replace versions on current scene?\n\nDid you include the version as three digits?\ni.e: 015\n\nThis is not undoable.", b=["OK","Cancel"], icn="warning", ma="center", t="autoSED")
    if doit == 'OK':
        somethingWrong = False
        changes = False
        refPath = ""
        searchFor = ""
        replaceWith = ""
        command1 = ""
        finalCommand = []
        newValue = ""
        for key in refDict:
            
            refPath = str(refDict.get(key))
            searchFor = refPath.split("_v")[2][:3]
            newValue = str(cmds.textFieldGrp( key, query = True, text = True))
            replaceWith = refPath.replace(searchFor,newValue)
            
            print "\n"
            print "Reference name: "+ key.split("|")[-1] 
            print "Searching for: "+ searchFor+ "\nReplacing with: "+ str(newValue)
            print "Old reference "+ refPath
            print "New reference "+ replaceWith

            if str(refPath) == str(replaceWith):
                print "Value unchanged, skipping"
            elif os.path.exists(replaceWith) == True:
                changes = True
                # This is a clumsy string reconstrut, to improve.                  
                splitPath = filePath.split("/")
                fileName = splitPath[-1]
                splitDirectory = filePath.split("/")
                justFilePath = splitDirectory[:-1]
                fileDirectory = "/".join(map(str,justFilePath))
                command2 = "(Get-Content "+ filePath+ ").replace('"+ refPath+ "', '"+ replaceWith+ "') | Set-Content "+ filePath
                finalCommand = '(["C:\\WINDOWS\\system32\\WindowsPowerShell\\v1.0\\powershell.exe", ". \"./SamplePowershell\";", "{}"])'.format(command2)
                print "Command being passed to the terminal: \n", command2
                
                # Send to powerShell
                #cmd = ['powershell', '-noprofile', '-noexit', command2] # Keeps the cmd window open for troubleshooting
                cmd = ['powershell', '-noprofile', command2]
                print cmd
                prompt = subprocess.call ( cmd )                
            else:
                somethingWrong = True
                print replaceWith+ "\nThis file does not exist!"
                
        # Reopen the updated scene if anything has been done
        if changes == True:
            cmds.file( filePath, o=True )
            print "\nUpdated reference in:\n %s\n" % filePath
        else:
            print "No changes made."
                
        if somethingWrong == True:
            print "There was an error, see script editor for details."
   
    else:
        print "\nCancelled operation."             
    cmds.deleteUI(window, window=True)

def autoSED(filePath):
    # safety on:
    if "islay" and ".ma" in filePath:
        print "Saving scene...",
        cmds.file( save=True, type='mayaAscii' )      
        wordIn = "RiggingRN"
        sel = cmds.ls("*" + wordIn, r=True)
        for each in sel:
            fullPath = cmds.referenceQuery(each, filename = True)   
            refs.append(fullPath) 
            
        windowID = 'autoSED'
        if cmds.window(windowID, exists = True):
            cmds.deleteUI('autoSED')
            
        window = cmds.window(windowID, resizeToFitChildren=True, w=200)
        cmds.rowColumnLayout()
        
        for path in refs:           
            assetName = path.split("/")[-1]
            currentVersion = path.split("_v")[2][:3]
            fullPath = path       
            item = cmds.textFieldGrp(assetName, label = assetName, text=currentVersion)
            items.append(item)
            refDict[item] = path

        cmds.button('search_and_replace_btn', label='Change refs to these versions?', command=pm.Callback(search_and_replace_btn_clicked,items, refDict, filePath, window))
        cmds.showWindow( window )
        return refDict, items, filePath
    else:
        print "File not on islay or is not a Maya ASCII, aborting for safety.",    

# Clears variables and runs autoSED on all references
print "Running autoSED \n",

items = []
refDict = {}
searchFor = ""
replaceWith = ""
asset = []
refs = []
referencePath = []   

filePath = cmds.file(q=1,sn=1)
autoSED(filePath) 
