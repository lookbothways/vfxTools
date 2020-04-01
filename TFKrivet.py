# Free from here
# https://www.highend3d.com/maya/script/tfk-rivet-for-maya

import maya.cmds as cmd
import re

def bRivet():

    input = cmd.filterExpand(sm = 32)
    if not (cmds.pluginInfo('matrixNodes', q=True, l=True)):
        cmds.loadPlugin( 'matrixNodes' )
    if input and len(input) >=2:  
        ob = input[0].split('.')[0]
        edgeMax = cmd.polyEvaluate(ob, e=True)
        shape = cmds.listRelatives(ob, shapes=True)
        count = len(input)
        cmds.undoInfo( state=False )  
        try:
            bRivet_Build(input,ob,edgeMax,shape, count)
        except:
            cmd.warning('Something is not right')
        cmds.undoInfo( state=True ) 
    else:
        cmd.warning('bRivet requires at least 2 edges to be selected')

def bRivet_Build(input, ob, edgeMax, shape, count):
    
    cA = cmd.connectAttr
    sA = cmd.setAttr
    aA = cmd.addAttr
    cN = cmd.createNode
    var = [['pointOnSurfaceInfo','pos'],['loft','loft'],['fourByFourMatrix','mat'],['decomposeMatrix','dcp']]
    pnt = ['normal', 'tangentU.tangentU', 'tangentV.tangentV', 'position.position']
    xyz = ['X','Y','Z']
    io = ['input', 'output']
    uv = 'UV'        
    doublet = zip(range(count-1),range(1, count))
    locs = []
    node = 1
    
    for pair in doublet:
        for n in range(4):
            var[n][1] = cN(var[n][0], name = var[n][1])
        gp = cmd.group(em = True, name = 'rivet%s_GP' % node )
        loc = cmd.spaceLocator(name = 'rivet%s' % node)   
        sA('%s.turnOnPercentage' % var[0][1], 1)
        sA('%s.degree' % var[1][1], 1)
        aA(loc[0], at = 'float2', ln= uv) 
        cmd.parent(loc, gp)
        node+=1 
                 
        for one in [0,1]:    
            num = int(re.findall("\[(.*?)\]", input[pair[one]])[0])
            aA(loc[0], at = 'short' , ln = 'edgeIndex%d' % one, min = 0, max = edgeMax, k = True, dv = num)
            ed = cN('curveFromMeshEdge', name = 'cFM')
            sA('%s.edgeIndex[0]' % ed, num)   
            cA('%s.edgeIndex%d' % (loc[0],one), '%s.edgeIndex[0]' % ed)   
            cA('%s.worldMesh[0]' % shape[0] , '%s.%sMesh' % (ed,io[0]))
            cA('%s.outputCurve' % ed, '%s.%sCurve[%s]' % (var[1][1],io[0],one))
            aA(loc[0], at = 'float' , ln = uv[one], k = True, p= uv, min = 0, max = 1)   
        print 'ok%s'%node
    
        for UV in uv:
            cA('%s.UV.%s' % (loc[0], UV), '%s.parameter%s' % (var[0][1], UV))
            sA('%s.UV.%s' % (loc[0], UV), 0.5)        
                
        for i in range(4):
            for j in range(3):
                o =  xyz[j]
                if i in [1,2]: o = o.lower()
                cA('%s.%s%s' %(var[0][1], pnt[i], o), '%s.in%s%s' % (var[2][1], i, j))
                
        cA('%s.%sSurface' % (var[1][1],io[1]), '%s.%sSurface' % (var[0][1],io[0]))
        cA('%s.%s' %  (var[2][1],io[1]), '%s.%sMatrix' % (var[3][1],io[0]))
        cA('%s.%sTranslate' % (var[3][1],io[1]), '%s.t' % gp)
        cA('%s.%sRotate' % (var[3][1],io[1]), '%s.r' % gp)

        locs.append(loc[0])
    
    cmd.select(locs)
       
bRivet()
