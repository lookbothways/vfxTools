import maya.cmds as cmds
import json
import os
from mtoa.core import createOptions
createOptions()

# for getProject:
from LONshelf import ssync
reload(ssync)

AAsamples = ''
GIDiffuseSamples = ''
GISpecularSamples = ''
GITransmissionSamples = ''
GISssSamples = ''
GIVolumeSamples = ''
GIDiffuseDepth = ''
GISpecularDepth = ''
GITransmissionDepth = ''
lowLightThreshold = ''
project = ''
output = ''
    
    
def setSamples(samples):

    cmds.setAttr('defaultArnoldRenderOptions.AASamples', samples[0])
    cmds.setAttr('defaultArnoldRenderOptions.GIDiffuseSamples', samples[1])
    cmds.setAttr('defaultArnoldRenderOptions.GISpecularSamples', samples[2])
    cmds.setAttr('defaultArnoldRenderOptions.GITransmissionSamples', samples[3])
    cmds.setAttr('defaultArnoldRenderOptions.GISssSamples', samples[4])
    cmds.setAttr('defaultArnoldRenderOptions.GIVolumeSamples', samples[5])
    cmds.setAttr('defaultArnoldRenderOptions.GIDiffuseDepth', samples[6])
    cmds.setAttr('defaultArnoldRenderOptions.GISpecularDepth', samples[7])
    cmds.setAttr('defaultArnoldRenderOptions.GITransmissionDepth', samples[8])
    
    #Low light threshold
    cmds.setAttr('defaultArnoldRenderOptions.lowLightThreshold', samples[9])
 
    
def getHQsamples(project,AAsamples,GIDiffuseSamples,GISpecularSamples,GITransmissionSamples,GISssSamples,GIVolumeSamples,GIDiffuseDepth,GISpecularDepth,GITransmissionDepth,lowLightThreshold):
    print project
    with open("/mnt/projects/library/arnoldSettings/presets/samples_{}.json".format(project)) as json_file:
        data = json.load(json_file)
        for p in data['HQsamples']:
            AAsamples = int((p['AASamples']))
            GIDiffuseSamples = int((p['GIDiffuseSamples']))
            GISpecularSamples = int((p['GISpecularSamples']))
            GITransmissionSamples = int((p['GITransmissionSamples']))
            GIVolumeSamples = int((p['GIVolumeSamples']))
            GIDiffuseDepth = int((p['GIDiffuseDepth']))
            GISpecularDepth = int((p['GISpecularDepth']))
            GITransmissionDepth = int((p['GITransmissionDepth']))
            GISssSamples = int((p['GISssSamples']))
            lowLightThreshold = float((p['lowLightThreshold']))
            output = project+ ' HQ Samples: '+ str(AAsamples)+ str(GIDiffuseSamples)+ str(GISpecularSamples)+ str(GITransmissionSamples)+ str(GIVolumeSamples)+ ' Diffuse depth: '+ str(GIDiffuseDepth)+ ' Spec Depth: '+ str(GISpecularDepth)+ ' Light threshold: '+ str(lowLightThreshold)
            print json_file
            return(AAsamples,GIDiffuseSamples,GISpecularSamples,GITransmissionSamples,GISssSamples,GIVolumeSamples,GIDiffuseDepth,GISpecularDepth,GITransmissionDepth,lowLightThreshold,output)


def getLQsamples(project,AAsamples,GIDiffuseSamples,GISpecularSamples,GITransmissionSamples,GISssSamples,GIVolumeSamples,GIDiffuseDepth,GISpecularDepth,GITransmissionDepth,lowLightThreshold):
    print project
    with open("/mnt/projects/library/arnoldSettings/presets/samples_{}.json".format(project)) as json_file:
        data = json.load(json_file)
        for p in data['LQsamples']:
            AAsamples = int((p['AASamples']))
            GIDiffuseSamples = int((p['GIDiffuseSamples']))
            GISpecularSamples = int((p['GISpecularSamples']))
            GITransmissionSamples = int((p['GITransmissionSamples']))
            GIVolumeSamples = int((p['GIVolumeSamples']))
            GIDiffuseDepth = int((p['GIDiffuseDepth']))
            GISpecularDepth = int((p['GISpecularDepth']))
            GITransmissionDepth = int((p['GITransmissionDepth']))
            GISssSamples = int((p['GISssSamples']))
            lowLightThreshold = float((p['lowLightThreshold']))
            output =project+ ' LQ Samples: '+ str(AAsamples)+ str(GIDiffuseSamples)+ str(GISpecularSamples)+ str(GITransmissionSamples)+ str(GIVolumeSamples)+ ' Diffuse depth: '+ str(GIDiffuseDepth)+ ' Spec Depth: '+ str(GISpecularDepth)+ ' Light threshold: '+ str(lowLightThreshold)
            print json_file
            return(AAsamples,GIDiffuseSamples,GISpecularSamples,GITransmissionSamples,GISssSamples,GIVolumeSamples,GIDiffuseDepth,GISpecularDepth,GITransmissionDepth,lowLightThreshold,output)
              

def start():
    # LQ / HQ sets the following values - Update the PRChqOnly funciton below also!!


    # get project and check for custom .json file
    project = ssync.getProject()
    defaultJsonPresetsPath = "/mnt/projects/library/arnoldSettings/presets/samples_defaultSettings.json"
    pathExists = "/mnt/projects/library/arnoldSettings/presets/samples_{}.json".format(project)
    if os.path.exists(pathExists) == False:
        print "Project level presets {}.json does not exist, using default: /mnt/projects/library/arnoldSettings/presets/samples_defaultSettings.json".format(project) 
        project = "defaultSettings"

    outputQuality = cmds.confirmDialog( title='Set render quality', message='Choose settings for a HQ or LQ render...', button=['HQ','LQ','Cancel'], defaultButton='HQ', cancelButton='Cancel', dismissString='Cancel' )


    if outputQuality == "HQ":
        samples = getHQsamples(project,AAsamples,GIDiffuseSamples,GISpecularSamples,GITransmissionSamples,GISssSamples,GIVolumeSamples,GIDiffuseDepth,GISpecularDepth,GITransmissionDepth,lowLightThreshold)
        setSamples(samples)
        print samples[10],
        
    if outputQuality == "LQ":
        samples = getLQsamples(project,AAsamples,GIDiffuseSamples,GISpecularSamples,GITransmissionSamples,GISssSamples,GIVolumeSamples,GIDiffuseDepth,GISpecularDepth,GITransmissionDepth,lowLightThreshold)
        setSamples(samples)
        print samples[10],
        
    if outputQuality == "Cancel":
        print "No settings changed.",


def PRChqOnly():

    # get project and check for custom .json file
    project = ssync.getProject()
    defaultJsonPresetsPath = "/mnt/projects/library/arnoldSettings/presets/samples_defaultSettings.json"
    pathExists = "/mnt/projects/library/arnoldSettings/presets/samples_{}.json".format(project)
    if os.path.exists(pathExists) == False:
        print "Project level presets {}.json does not exist, using default: /mnt/projects/library/arnoldSettings/presets/samples_defaultSettings.json".format(project) 
        project = "defaultSettings"

    samples = getHQsamples(project,AAsamples,GIDiffuseSamples,GISpecularSamples,GITransmissionSamples,GISssSamples,GIVolumeSamples,GIDiffuseDepth,GISpecularDepth,GITransmissionDepth,lowLightThreshold)
    setSamples(samples)
        
"""
# Use this format to write the project file:

data = {}  
data['projectName'] = [] 
data['projectName'].append({  
    'projectName': 'wb', 
})

data['arnoldSettingsRenderGlobals'] = [] 
data['arnoldSettingsRenderGlobals'].append({  
    'arnoldSettingsRenderGlobals': '/mnt/projects/library/arnoldSettings/presets/atk_arnoldSettings_v004.json', 
})


data['HQsamples'] = []  
data['HQsamples'].append({  
    'AASamples': '8',
    'GIDiffuseSamples': '4',
    'GISpecularSamples': '4',
    'GITransmissionSamples': '4',
    'GISssSamples': '0',
    'GIVolumeSamples': '0',
    'GIDiffuseDepth': '0',
    'GISpecularDepth': '1',
    'GITransmissionDepth': '4',
    'lowLightThreshold': '0.015',
})

data['LQsamples'] = []  
data['LQsamples'].append({  
    'AASamples': '2',
    'GIDiffuseSamples': '2',
    'GISpecularSamples': '2',
    'GITransmissionSamples': '2',
    'GISssSamples': '0',
    'GIVolumeSamples': '0',
    'GIDiffuseDepth': '0',
    'GISpecularDepth': '1',
    'GITransmissionDepth': '2',
    'lowLightThreshold': '0.015',
})

data['defaultLightRigPath'] = [] 
data['defaultLightRigPath'].append({  
    'lightRigPath': '/mnt/projects/library/arnoldSettings/scenes/atk_defaultLights_v001.ma', 
})
# CHANGE THIS PATH WHEN WRITING OUT PROJECT-LEVEL SETTINGS:
with open('/mnt/projects/library/arnoldSettings/presets/samples_defaultSettings.json', 'w') as outfile:  
    json.dump(data, outfile)
    
"""
    

              
