//Maya ASCII 2017ff05 scene
//Name: arnoldSettings_LGT_base_v032.ma
//Last modified: Wed, Apr 11, 2018 03:54:19 PM
//Codeset: ANSI_X3.4-1968
file -rdi 1 -ns "default_lightrig" -rfn "default_lightrigRN" -typ "mayaAscii"
		 "/mnt/projects/shr/assets/Light-Rig/default/LGT/publish/maya/default_LGT_lightrig_v005.ma";
file -rdi 1 -ns "creature_adult_shaderkeeper" -rfn "creature_adult_shaderkeeperRN"
		 -typ "mayaAscii" "/mnt/projects/shr/assets/Character/creature_adult/SHD/publish/maya/creature_adult_SHD_shaderkeeper_v018.ma";
file -r -ns "default_lightrig" -dr 1 -rfn "default_lightrigRN" -typ "mayaAscii" "/mnt/projects/shr/assets/Light-Rig/default/LGT/publish/maya/default_LGT_lightrig_v005.ma";
file -r -ns "creature_adult_shaderkeeper" -dr 1 -rfn "creature_adult_shaderkeeperRN"
		 -typ "mayaAscii" "/mnt/projects/shr/assets/Character/creature_adult/SHD/publish/maya/creature_adult_SHD_shaderkeeper_v018.ma";
requires maya "2017ff05";
requires -nodeType "aiOptions" -nodeType "aiAOV" -nodeType "aiAOVDriver" -nodeType "aiAOVFilter"
		 -nodeType "aiShadowMatte" -nodeType "aiAmbientOcclusion" -nodeType "aiStandardSurface"
		 -nodeType "cryptomatte" "mtoa" "2.1.0.2";
requires -nodeType "simpleSelector" -nodeType "renderSetupLayer" -nodeType "renderSetup"
		 -nodeType "collection" -nodeType "renderSettingsCollection" -nodeType "absOverride"
		 -nodeType "absUniqueOverride" "renderSetup.py" "1.0";
requires "stereoCamera" "10.0";
requires "stereoCamera" "10.0";
currentUnit -l centimeter -a degree -t film;
fileInfo "application" "maya";
fileInfo "product" "Maya 2017";
fileInfo "version" "2017";
fileInfo "cutIdentifier" "201706020738-1017329";
fileInfo "osv" "Linux 3.10.0-693.5.2.el7.x86_64 #1 SMP Fri Oct 20 20:32:50 UTC 2017 x86_64";
createNode transform -s -n "persp";
	rename -uid "6024F900-0000-03C3-5A9D-3C5200000230";
	setAttr ".v" no;
	setAttr -s 2 ".rlio[0:1]" 2 yes 0 1 yes 0;
	setAttr ".t" -type "double3" -797.19202903666496 254.53854239313279 930.09989951150806 ;
	setAttr ".r" -type "double3" -11.73835272960382 -40.599999999998758 0 ;
createNode camera -s -n "perspShape" -p "persp";
	rename -uid "6024F900-0000-03C3-5A9D-3C5200000231";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999993;
	setAttr ".coi" 1251.1557951727827;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".hc" -type "string" "viewSet -p %camera";
	setAttr ".ai_translator" -type "string" "perspective";
createNode transform -s -n "top";
	rename -uid "6024F900-0000-03C3-5A9D-3C5200000232";
	setAttr ".v" no;
	setAttr -s 2 ".rlio[0:1]" 2 yes 0 1 yes 0;
	setAttr ".t" -type "double3" 0 1000.1 0 ;
	setAttr ".r" -type "double3" -89.999999999999986 0 0 ;
createNode camera -s -n "topShape" -p "top";
	rename -uid "6024F900-0000-03C3-5A9D-3C5200000233";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "top";
	setAttr ".den" -type "string" "top_depth";
	setAttr ".man" -type "string" "top_mask";
	setAttr ".hc" -type "string" "viewSet -t %camera";
	setAttr ".o" yes;
	setAttr ".ai_translator" -type "string" "orthographic";
createNode transform -s -n "front";
	rename -uid "6024F900-0000-03C3-5A9D-3C5200000234";
	setAttr ".v" no;
	setAttr -s 2 ".rlio[0:1]" 2 yes 0 1 yes 0;
	setAttr ".t" -type "double3" 0 0 1000.1 ;
createNode camera -s -n "frontShape" -p "front";
	rename -uid "6024F900-0000-03C3-5A9D-3C5200000235";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "front";
	setAttr ".den" -type "string" "front_depth";
	setAttr ".man" -type "string" "front_mask";
	setAttr ".hc" -type "string" "viewSet -f %camera";
	setAttr ".o" yes;
	setAttr ".ai_translator" -type "string" "orthographic";
createNode transform -s -n "side";
	rename -uid "6024F900-0000-03C3-5A9D-3C5200000236";
	setAttr ".v" no;
	setAttr -s 2 ".rlio[0:1]" 2 yes 0 1 yes 0;
	setAttr ".t" -type "double3" 1000.1 0 0 ;
	setAttr ".r" -type "double3" 0 89.999999999999986 0 ;
createNode camera -s -n "sideShape" -p "side";
	rename -uid "6024F900-0000-03C3-5A9D-3C5200000237";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "side";
	setAttr ".den" -type "string" "side_depth";
	setAttr ".man" -type "string" "side_mask";
	setAttr ".hc" -type "string" "viewSet -s %camera";
	setAttr ".o" yes;
	setAttr ".ai_translator" -type "string" "orthographic";
createNode transform -n "arnoldSettings_base_v32";
	rename -uid "097D8900-0000-6947-5AA0-0F5B0001651F";
	setAttr ".rlio[0]" 1 yes 0;
createNode locator -n "arnoldSettings_base_v32Shape" -p "arnoldSettings_base_v32";
	rename -uid "097D8900-0000-6947-5AA0-0F5B00016520";
	setAttr -k off ".v";
createNode transform -n "shadowCatcher";
	rename -uid "6024F900-0000-03C3-5A9D-3CF5000002B9";
	setAttr -s 2 ".rlio[1]" 1 yes 0;
createNode mesh -n "shadowCatcherShape" -p "shadowCatcher";
	rename -uid "6024F900-0000-03C3-5A9D-3CF5000002B8";
	setAttr -k off ".v";
	setAttr ".rlio[0]" 1 yes 0;
	setAttr ".csh" no;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".ai_self_shadows" no;
	setAttr ".ai_vidr" no;
	setAttr ".ai_visr" no;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode place3dTexture -n "backplateProjection_place3dTexture";
	rename -uid "A8391900-0000-2276-5ACD-FB48000005C0";
	setAttr ".rlio[0]" 2 yes 0;
createNode lightLinker -s -n "lightLinker1";
	rename -uid "E7A8B900-0000-1E4C-5ACE-1A2400000328";
	setAttr -s 21 ".lnk";
	setAttr -s 21 ".slnk";
createNode shapeEditorManager -n "shapeEditorManager";
	rename -uid "E7A8B900-0000-1E4C-5ACE-1A2400000329";
	setAttr ".bsdt[0].bscd" -type "Int32Array" 1 0 ;
createNode poseInterpolatorManager -n "poseInterpolatorManager";
	rename -uid "E7A8B900-0000-1E4C-5ACE-1A240000032A";
createNode displayLayerManager -n "layerManager";
	rename -uid "E7A8B900-0000-1E4C-5ACE-1A240000032B";
createNode displayLayer -n "defaultLayer";
	rename -uid "6024F900-0000-03C3-5A9D-3C5200000250";
createNode renderLayerManager -n "renderLayerManager";
	rename -uid "E7A8B900-0000-1E4C-5ACE-1A240000032D";
	setAttr -s 3 ".rlmi[1:2]"  1 2;
	setAttr -s 3 ".rlmi";
createNode renderLayer -n "defaultRenderLayer";
	rename -uid "6024F900-0000-03C3-5A9D-3C5200000252";
	setAttr ".g" yes;
	setAttr ".rndr" no;
createNode script -n "uiConfigurationScriptNode";
	rename -uid "6024F900-0000-03C3-5A9D-3C9C00000286";
	setAttr ".b" -type "string" (
		"// Maya Mel UI Configuration File.\n//\n//  This script is machine generated.  Edit at your own risk.\n//\n//\n\nglobal string $gMainPane;\nif (`paneLayout -exists $gMainPane`) {\n\n\tglobal int $gUseScenePanelConfig;\n\tint    $useSceneConfig = $gUseScenePanelConfig;\n\tint    $menusOkayInPanels = `optionVar -q allowMenusInPanels`;\tint    $nVisPanes = `paneLayout -q -nvp $gMainPane`;\n\tint    $nPanes = 0;\n\tstring $editorName;\n\tstring $panelName;\n\tstring $itemFilterName;\n\tstring $panelConfig;\n\n\t//\n\t//  get current state of the UI\n\t//\n\tsceneUIReplacement -update $gMainPane;\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Top View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Top View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"top\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n"
		+ "            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n"
		+ "            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n"
		+ "            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 1\n            -height 1\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Side View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Side View\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"side\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n"
		+ "            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n"
		+ "            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 1\n            -height 1\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Front View\")) `;\n"
		+ "\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Front View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"front\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n"
		+ "            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n"
		+ "            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 1\n            -height 1\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n"
		+ "        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Persp View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Persp View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"persp\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n"
		+ "            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n"
		+ "            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n"
		+ "            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 1530\n            -height 1131\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"outlinerPanel\" (localizedPanelLabel(\"ToggledOutliner\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\toutlinerPanel -edit -l (localizedPanelLabel(\"ToggledOutliner\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        outlinerEditor -e \n            -docTag \"isolOutln_fromSeln\" \n            -showShapes 1\n            -showAssignedMaterials 0\n            -showTimeEditor 1\n            -showReferenceNodes 0\n            -showReferenceMembers 0\n            -showAttributes 0\n            -showConnected 0\n"
		+ "            -showAnimCurvesOnly 0\n            -showMuteInfo 0\n            -organizeByLayer 1\n            -showAnimLayerWeight 1\n            -autoExpandLayers 1\n            -autoExpand 0\n            -showDagOnly 1\n            -showAssets 1\n            -showContainedOnly 1\n            -showPublishedAsConnected 0\n            -showContainerContents 1\n            -ignoreDagHierarchy 0\n            -expandConnections 0\n            -showUpstreamCurves 1\n            -showUnitlessCurves 1\n            -showCompounds 1\n            -showLeafs 1\n            -showNumericAttrsOnly 0\n            -highlightActive 1\n            -autoSelectNewObjects 0\n            -doNotSelectNewObjects 0\n            -dropIsParent 1\n            -transmitFilters 0\n            -setFilter \"defaultSetFilter\" \n            -showSetMembers 1\n            -allowMultiSelection 1\n            -alwaysToggleSelect 0\n            -directSelect 0\n            -isSet 0\n            -isSetMember 0\n            -displayMode \"DAG\" \n            -expandObjects 0\n            -setsIgnoreFilters 1\n"
		+ "            -containersIgnoreFilters 0\n            -editAttrName 0\n            -showAttrValues 0\n            -highlightSecondary 0\n            -showUVAttrsOnly 0\n            -showTextureNodesOnly 0\n            -attrAlphaOrder \"default\" \n            -animLayerFilterOptions \"allAffecting\" \n            -sortOrder \"none\" \n            -longNames 0\n            -niceNames 1\n            -showNamespace 1\n            -showPinIcons 0\n            -mapMotionTrails 0\n            -ignoreHiddenAttribute 0\n            -ignoreOutlinerColor 0\n            -renderFilterVisible 0\n            -renderFilterIndex 0\n            -selectionOrder \"chronological\" \n            -expandAttribute 0\n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"outlinerPanel\" (localizedPanelLabel(\"Outliner\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\toutlinerPanel -edit -l (localizedPanelLabel(\"Outliner\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t$editorName = $panelName;\n        outlinerEditor -e \n            -docTag \"isolOutln_fromSeln\" \n            -showShapes 1\n            -showAssignedMaterials 0\n            -showTimeEditor 1\n            -showReferenceNodes 0\n            -showReferenceMembers 0\n            -showAttributes 0\n            -showConnected 0\n            -showAnimCurvesOnly 0\n            -showMuteInfo 0\n            -organizeByLayer 1\n            -showAnimLayerWeight 1\n            -autoExpandLayers 1\n            -autoExpand 0\n            -showDagOnly 1\n            -showAssets 1\n            -showContainedOnly 1\n            -showPublishedAsConnected 0\n            -showContainerContents 1\n            -ignoreDagHierarchy 0\n            -expandConnections 0\n            -showUpstreamCurves 1\n            -showUnitlessCurves 1\n            -showCompounds 1\n            -showLeafs 1\n            -showNumericAttrsOnly 0\n            -highlightActive 1\n            -autoSelectNewObjects 0\n            -doNotSelectNewObjects 0\n            -dropIsParent 1\n"
		+ "            -transmitFilters 0\n            -setFilter \"defaultSetFilter\" \n            -showSetMembers 1\n            -allowMultiSelection 1\n            -alwaysToggleSelect 0\n            -directSelect 0\n            -displayMode \"DAG\" \n            -expandObjects 0\n            -setsIgnoreFilters 1\n            -containersIgnoreFilters 0\n            -editAttrName 0\n            -showAttrValues 0\n            -highlightSecondary 0\n            -showUVAttrsOnly 0\n            -showTextureNodesOnly 0\n            -attrAlphaOrder \"default\" \n            -animLayerFilterOptions \"allAffecting\" \n            -sortOrder \"none\" \n            -longNames 0\n            -niceNames 1\n            -showNamespace 1\n            -showPinIcons 0\n            -mapMotionTrails 0\n            -ignoreHiddenAttribute 0\n            -ignoreOutlinerColor 0\n            -renderFilterVisible 0\n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"graphEditor\" (localizedPanelLabel(\"Graph Editor\")) `;\n"
		+ "\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Graph Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showAssignedMaterials 0\n                -showTimeEditor 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 1\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 1\n"
		+ "                -showCompounds 0\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 1\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 1\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 1\n"
		+ "                -mapMotionTrails 1\n                -ignoreHiddenAttribute 0\n                -ignoreOutlinerColor 0\n                -renderFilterVisible 0\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"GraphEd\");\n            animCurveEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 1\n                -displayInfinities 0\n                -displayValues 0\n                -autoFit 1\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -showResults \"off\" \n                -showBufferCurves \"off\" \n                -smoothness \"fine\" \n                -resultSamples 1\n                -resultScreenSamples 0\n                -resultUpdate \"delayed\" \n                -showUpstreamCurves 1\n                -showCurveNames 0\n                -showActiveCurveNames 0\n                -stackedCurves 0\n                -stackedCurvesMin -1\n                -stackedCurvesMax 1\n                -stackedCurvesSpace 0.2\n"
		+ "                -displayNormalized 0\n                -preSelectionHighlight 0\n                -constrainDrag 0\n                -classicMode 1\n                -valueLinesToggle 1\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dopeSheetPanel\" (localizedPanelLabel(\"Dope Sheet\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dope Sheet\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showAssignedMaterials 0\n                -showTimeEditor 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n"
		+ "                -autoExpand 0\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 0\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 1\n                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n"
		+ "                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n                -mapMotionTrails 1\n                -ignoreHiddenAttribute 0\n                -ignoreOutlinerColor 0\n                -renderFilterVisible 0\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"DopeSheetEd\");\n            dopeSheetEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -displayValues 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -outliner \"dopeSheetPanel1OutlineEd\" \n                -showSummary 1\n"
		+ "                -showScene 0\n                -hierarchyBelow 0\n                -showTicks 1\n                -selectionWindow 0 0 0 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"timeEditorPanel\" (localizedPanelLabel(\"Time Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Time Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"clipEditorPanel\" (localizedPanelLabel(\"Trax Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Trax Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = clipEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n"
		+ "                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -displayValues 0\n                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -initialized 0\n                -manageSequencer 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"sequenceEditorPanel\" (localizedPanelLabel(\"Camera Sequencer\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Camera Sequencer\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = sequenceEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -displayValues 0\n                -autoFit 0\n                -snapTime \"none\" \n"
		+ "                -snapValue \"none\" \n                -initialized 0\n                -manageSequencer 1 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperGraphPanel\" (localizedPanelLabel(\"Hypergraph Hierarchy\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypergraph Hierarchy\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"HyperGraphEd\");\n            hyperGraph -e \n                -graphLayoutStyle \"hierarchicalLayout\" \n                -orientation \"horiz\" \n                -mergeConnections 0\n                -zoom 1\n                -animateTransition 0\n                -showRelationships 1\n                -showShapes 0\n                -showDeformers 0\n                -showExpressions 0\n                -showConstraints 0\n                -showConnectionFromSelected 0\n                -showConnectionToSelected 0\n                -showConstraintLabels 0\n"
		+ "                -showUnderworld 0\n                -showInvisible 0\n                -transitionFrames 1\n                -opaqueContainers 0\n                -freeform 0\n                -imagePosition 0 0 \n                -imageScale 1\n                -imageEnabled 0\n                -graphType \"DAG\" \n                -heatMapDisplay 0\n                -updateSelection 1\n                -updateNodeAdded 1\n                -useDrawOverrideColor 0\n                -limitGraphTraversal -1\n                -range 0 0 \n                -iconSize \"smallIcons\" \n                -showCachedConnections 0\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"visorPanel\" (localizedPanelLabel(\"Visor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Visor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"createNodePanel\" (localizedPanelLabel(\"Create Node\")) `;\n"
		+ "\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Create Node\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"polyTexturePlacementPanel\" (localizedPanelLabel(\"UV Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"UV Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"renderWindowPanel\" (localizedPanelLabel(\"Render View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Render View\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"shapePanel\" (localizedPanelLabel(\"Shape Editor\")) `;\n"
		+ "\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tshapePanel -edit -l (localizedPanelLabel(\"Shape Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"posePanel\" (localizedPanelLabel(\"Pose Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tposePanel -edit -l (localizedPanelLabel(\"Pose Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynRelEdPanel\" (localizedPanelLabel(\"Dynamic Relationships\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dynamic Relationships\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"relationshipPanel\" (localizedPanelLabel(\"Relationship Editor\")) `;\n"
		+ "\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Relationship Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"referenceEditorPanel\" (localizedPanelLabel(\"Reference Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Reference Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"componentEditorPanel\" (localizedPanelLabel(\"Component Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Component Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynPaintScriptedPanelType\" (localizedPanelLabel(\"Paint Effects\")) `;\n"
		+ "\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Paint Effects\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"scriptEditorPanel\" (localizedPanelLabel(\"Script Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Script Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"profilerPanel\" (localizedPanelLabel(\"Profiler Tool\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Profiler Tool\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"contentBrowserPanel\" (localizedPanelLabel(\"Content Browser\")) `;\n"
		+ "\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Content Browser\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"Stereo\" (localizedPanelLabel(\"Stereo\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Stereo\")) -mbv $menusOkayInPanels  $panelName;\nstring $editorName = ($panelName+\"Editor\");\n            stereoCameraView -e \n                -camera \"persp\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"smoothShaded\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -holdOuts 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 0\n"
		+ "                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 32768\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -depthOfFieldPreview 1\n                -maxConstantTransparency 1\n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 4 4 \n                -bumpResolution 4 4 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n"
		+ "                -lowQualityLighting 0\n                -maximumNumHardwareLights 0\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -particleInstancers 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n"
		+ "                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -greasePencils 1\n                -shadows 0\n                -captureSequenceNumber -1\n                -width 0\n                -height 0\n                -sceneRenderFilter 0\n                -displayMode \"centerEye\" \n                -viewColor 0 0 0 1 \n                -useCustomBackground 1\n                $editorName;\n            stereoCameraView -e -viewSelected 0 $editorName;\n            stereoCameraView -e \n                -pluginObjects \"gpuCacheDisplayFilter\" 1 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperShadePanel\" (localizedPanelLabel(\"Hypershade\")) `;\n"
		+ "\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypershade\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"nodeEditorPanel\" (localizedPanelLabel(\"Node Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Node Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"NodeEditorEd\");\n            nodeEditor -e \n                -allAttributes 0\n                -allNodes 0\n                -autoSizeNodes 1\n                -consistentNameSize 1\n                -createNodeCommand \"nodeEdCreateNodeCommand\" \n                -defaultPinnedState 0\n                -additiveGraphingMode 0\n                -settingsChangedCallback \"nodeEdSyncControls\" \n                -traversalDepthLimit -1\n                -keyPressCommand \"nodeEdKeyPressCommand\" \n                -nodeTitleMode \"name\" \n"
		+ "                -gridSnap 0\n                -gridVisibility 1\n                -popupMenuScript \"nodeEdBuildPanelMenus\" \n                -showNamespace 1\n                -showShapes 1\n                -showSGShapes 0\n                -showTransforms 1\n                -useAssets 1\n                -syncedSelection 1\n                -extendToShapes 1\n                -activeTab -1\n                -editorMode \"default\" \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\tif ($useSceneConfig) {\n        string $configName = `getPanel -cwl (localizedPanelLabel(\"Current Layout\"))`;\n        if (\"\" != $configName) {\n\t\t\tpanelConfiguration -edit -label (localizedPanelLabel(\"Current Layout\")) \n\t\t\t\t-userCreated false\n\t\t\t\t-defaultImage \"vacantCell.xP:/\"\n\t\t\t\t-image \"\"\n\t\t\t\t-sc false\n\t\t\t\t-configString \"global string $gMainPane; paneLayout -e -cn \\\"single\\\" -ps 1 100 100 $gMainPane;\"\n\t\t\t\t-removeAllPanels\n\t\t\t\t-ap false\n\t\t\t\t\t(localizedPanelLabel(\"Persp View\")) \n\t\t\t\t\t\"modelPanel\"\n"
		+ "\t\t\t\t\t\"$panelName = `modelPanel -unParent -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels `;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -holdOuts 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 0\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 32768\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -depthOfFieldPreview 1\\n    -maxConstantTransparency 1\\n    -rendererName \\\"vp2Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -particleInstancers 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -greasePencils 1\\n    -shadows 0\\n    -captureSequenceNumber -1\\n    -width 1530\\n    -height 1131\\n    -sceneRenderFilter 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t\t\"modelPanel -edit -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels  $panelName;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -holdOuts 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 0\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 32768\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -depthOfFieldPreview 1\\n    -maxConstantTransparency 1\\n    -rendererName \\\"vp2Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -particleInstancers 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -greasePencils 1\\n    -shadows 0\\n    -captureSequenceNumber -1\\n    -width 1530\\n    -height 1131\\n    -sceneRenderFilter 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t$configName;\n\n            setNamedPanelLayout (localizedPanelLabel(\"Current Layout\"));\n        }\n\n        panelHistory -e -clear mainPanelHistory;\n        sceneUIReplacement -clear;\n\t}\n\n\ngrid -spacing 5 -size 12 -divisions 5 -displayAxes yes -displayGridLines yes -displayDivisionLines yes -displayPerspectiveLabels no -displayOrthographicLabels no -displayAxesBold yes -perspectiveLabelPosition axis -orthographicLabelPosition edge;\nviewManip -drawCompass 0 -compassAngle 0 -frontParameters \"\" -homeParameters \"\" -selectionLockParameters \"\";\n}\n");
	setAttr ".st" 3;
createNode script -n "sceneConfigurationScriptNode";
	rename -uid "6024F900-0000-03C3-5A9D-3C9C00000287";
	setAttr ".b" -type "string" "playbackOptions -min 1001 -max 1010 -ast 1001 -aet 1010 ";
	setAttr ".st" 6;
createNode script -n "IGPUCS";
	rename -uid "6024F900-0000-03C3-5A9D-3CBE00000292";
	setAttr ".b" -type "string" "try: igpucs_SOuP().scriptJobUpdate()\nexcept: pass";
	setAttr ".st" 7;
	setAttr ".stp" 1;
createNode aiOptions -s -n "defaultArnoldRenderOptions";
	rename -uid "6024F900-0000-03C3-5A9D-3CC600000293";
	addAttr -ci true -sn "ARV_options" -ln "ARV_options" -dt "string";
	setAttr -s 23 ".aovs";
	setAttr ".bktsc" 2;
	setAttr ".bucket_size" 32;
	setAttr ".abort_on_license_fail" yes;
	setAttr ".AA_samples" 2;
	setAttr ".GI_diffuse_samples" 1;
	setAttr ".GI_specular_samples" 1;
	setAttr ".GI_transmission_samples" 1;
	setAttr ".GI_sss_samples" 1;
	setAttr ".GI_volume_samples" 0;
	setAttr ".GI_transmission_depth" 4;
	setAttr ".low_light_threshold" 0.014999999664723873;
	setAttr ".mb_en" yes;
	setAttr ".mots" 4;
	setAttr ".max_subdivisions" 1;
	setAttr ".version" -type "string" "2.1.0.2";
createNode aiAOVFilter -s -n "defaultArnoldFilter";
	rename -uid "6024F900-0000-03C3-5A9D-3CC600000294";
	setAttr ".ai_translator" -type "string" "gaussian";
createNode aiAOVDriver -s -n "defaultArnoldDriver";
	rename -uid "6024F900-0000-03C3-5A9D-3CC600000295";
	setAttr ".tiled" no;
	setAttr ".autocrop" yes;
	setAttr ".custom_attributes[0]" -type "string" "STRING mayaFile /mnt/projects/shr/assets/Light-Rig/arnoldSettings/LGT/work/maya/arnoldSettings_LGT_base_v032.ma";
	setAttr ".ai_translator" -type "string" "exr";
createNode aiAOVDriver -s -n "defaultArnoldDisplayDriver";
	rename -uid "6024F900-0000-03C3-5A9D-3CC600000296";
	setAttr ".output_mode" 0;
	setAttr ".ai_translator" -type "string" "maya";
createNode aiAOV -n "aiAOV_AO";
	rename -uid "6024F900-0000-03C3-5A9D-3CD000000297";
	setAttr ".aoven" no;
	setAttr ".aovn" -type "string" "AO";
createNode aiAOV -n "aiAOV_N";
	rename -uid "6024F900-0000-03C3-5A9D-3CD000000298";
	setAttr ".aovn" -type "string" "N";
	setAttr ".aovt" 7;
createNode aiAOVFilter -n "aiAOVFilter1";
	rename -uid "6024F900-0000-03C3-5A9D-3CD000000299";
	setAttr ".ai_translator" -type "string" "closest";
createNode aiAOV -n "aiAOV_P";
	rename -uid "6024F900-0000-03C3-5A9D-3CD00000029A";
	setAttr ".aovn" -type "string" "P";
	setAttr ".aovt" 7;
createNode aiAOVFilter -n "aiAOVFilter2";
	rename -uid "6024F900-0000-03C3-5A9D-3CD00000029B";
	setAttr ".ai_translator" -type "string" "closest";
createNode aiAOV -n "aiAOV_UV";
	rename -uid "6024F900-0000-03C3-5A9D-3CD00000029C";
	setAttr ".aovn" -type "string" "UV";
createNode aiAOV -n "aiAOV_Z";
	rename -uid "6024F900-0000-03C3-5A9D-3CD00000029D";
	setAttr ".aovn" -type "string" "Z";
	setAttr ".aovt" 4;
createNode aiAOVFilter -n "aiAOVFilter3";
	rename -uid "6024F900-0000-03C3-5A9D-3CD00000029E";
	setAttr ".ai_translator" -type "string" "closest";
createNode aiAOV -n "aiAOV_coat";
	rename -uid "6024F900-0000-03C3-5A9D-3CD00000029F";
	setAttr ".aovn" -type "string" "coat";
	setAttr ".aovt" 5;
createNode aiAOV -n "aiAOV_crypto_material";
	rename -uid "6024F900-0000-03C3-5A9D-3CD0000002A0";
	setAttr ".aovn" -type "string" "crypto_material";
	setAttr ".aovt" 5;
createNode aiAOV -n "aiAOV_crypto_object";
	rename -uid "6024F900-0000-03C3-5A9D-3CD0000002A1";
	setAttr ".aovn" -type "string" "crypto_object";
	setAttr ".aovt" 5;
createNode aiAOV -n "aiAOV_diffuse_albedo";
	rename -uid "6024F900-0000-03C3-5A9D-3CD0000002A2";
	setAttr ".aovn" -type "string" "diffuse_albedo";
	setAttr ".aovt" 5;
createNode aiAOV -n "aiAOV_diffuse_direct";
	rename -uid "6024F900-0000-03C3-5A9D-3CD0000002A3";
	setAttr ".aovn" -type "string" "diffuse_direct";
	setAttr ".aovt" 5;
createNode aiAOV -n "aiAOV_diffuse_indirect";
	rename -uid "6024F900-0000-03C3-5A9D-3CD0000002A4";
	setAttr ".aovn" -type "string" "diffuse_indirect";
	setAttr ".aovt" 5;
createNode aiAOV -n "aiAOV_emission";
	rename -uid "6024F900-0000-03C3-5A9D-3CD0000002A5";
	setAttr ".aovn" -type "string" "emission";
	setAttr ".aovt" 5;
createNode aiAOV -n "aiAOV_motionvector";
	rename -uid "6024F900-0000-03C3-5A9D-3CD0000002A6";
	setAttr ".aovn" -type "string" "motionvector";
	setAttr ".aovt" 5;
createNode aiAOV -n "aiAOV_shadow_matte";
	rename -uid "6024F900-0000-03C3-5A9D-3CD1000002A7";
	setAttr ".aovn" -type "string" "shadow_matte";
createNode aiAOV -n "aiAOV_specular_direct";
	rename -uid "6024F900-0000-03C3-5A9D-3CD1000002A8";
	setAttr ".aovn" -type "string" "specular_direct";
	setAttr ".aovt" 5;
createNode aiAOV -n "aiAOV_specular_indirect";
	rename -uid "6024F900-0000-03C3-5A9D-3CD1000002A9";
	setAttr ".aovn" -type "string" "specular_indirect";
	setAttr ".aovt" 5;
createNode aiAOV -n "aiAOV_sss";
	rename -uid "6024F900-0000-03C3-5A9D-3CD1000002AA";
	setAttr ".aovn" -type "string" "sss";
	setAttr ".aovt" 5;
createNode aiAOV -n "aiAOV_transmission";
	rename -uid "6024F900-0000-03C3-5A9D-3CD1000002AB";
	setAttr ".aovn" -type "string" "transmission";
	setAttr ".aovt" 5;
createNode aiAOV -n "aiAOV_volume";
	rename -uid "6024F900-0000-03C3-5A9D-3CD1000002AC";
	setAttr ".aovn" -type "string" "volume";
	setAttr ".aovt" 5;
createNode aiAOV -n "aiAOV_L_hdr";
	rename -uid "6024F900-0000-03C3-5A9D-3CD1000002AD";
	setAttr ".aovn" -type "string" "L_hdr";
	setAttr ".lpe" -type "string" "C.*<L.'hdr'>";
createNode aiAOV -n "aiAOV_L_key";
	rename -uid "6024F900-0000-03C3-5A9D-3CD1000002AE";
	setAttr ".aovn" -type "string" "L_key";
	setAttr ".lpe" -type "string" "C.*<L.'key'>";
createNode aiAOV -n "aiAOV_L_rim";
	rename -uid "6024F900-0000-03C3-5A9D-3CD1000002AF";
	setAttr ".aovn" -type "string" "L_rim";
	setAttr ".lpe" -type "string" "C.*<L.'rim'>";
createNode aiAOV -n "aiAOV_L_fill";
	rename -uid "6024F900-0000-03C3-5A9D-3CD1000002B0";
	setAttr ".aovn" -type "string" "L_fill";
	setAttr ".lpe" -type "string" "C.*<L.'fill'>";
createNode ramp -n "green_ramp";
	rename -uid "6024F900-0000-03C3-5A9D-3CD1000002B1";
	setAttr -s 2 ".cel";
	setAttr ".cel[1].ep" 0;
	setAttr ".cel[1].ec" -type "float3" 0 0 0 ;
	setAttr ".cel[2].ep" 1;
	setAttr ".cel[2].ec" -type "float3" 0 1 0 ;
createNode place2dTexture -n "place2dTexture_Green";
	rename -uid "6024F900-0000-03C3-5A9D-3CD1000002B2";
createNode ramp -n "red_ramp";
	rename -uid "6024F900-0000-03C3-5A9D-3CD1000002B3";
	setAttr -s 2 ".cel";
	setAttr ".cel[1].ep" 0;
	setAttr ".cel[1].ec" -type "float3" 0 0 0 ;
	setAttr ".cel[2].ep" 1;
	setAttr ".cel[2].ec" -type "float3" 1 0 0 ;
createNode place2dTexture -n "place2dTexture_Red";
	rename -uid "6024F900-0000-03C3-5A9D-3CD1000002B4";
	setAttr ".r" 90;
createNode cryptomatte -n "_aov_cryptomatte";
	rename -uid "6024F900-0000-03C3-5A9D-3CD1000002B5";
createNode aiAmbientOcclusion -n "ambientOcclusion";
	rename -uid "6024F900-0000-03C3-5A9D-3CD1000002B6";
createNode polyPlane -n "shadowCatcherHistory";
	rename -uid "6024F900-0000-03C3-5A9D-3CF5000002B7";
	setAttr ".cuv" 2;
createNode aiShadowMatte -n "shadowLayer_aiShadowMatte";
	rename -uid "6024F900-0000-03C3-5A9D-3D3A0000031B";
	setAttr ".background" 1;
	setAttr ".shadow_color" -type "float3" 1 1 1 ;
	setAttr ".diffuse_intensity" 0;
createNode shadingEngine -n "shadowLayer_aiShadowMatteSG";
	rename -uid "6024F900-0000-03C3-5A9D-3D3A0000031C";
	addAttr -ci true -h true -sn "aal" -ln "attributeAliasList" -dt "attributeAlias";
	setAttr ".ihi" 0;
	setAttr -s 2 ".dsm";
	setAttr ".ro" yes;
	setAttr -s 23 ".aovs";
	setAttr ".aovs[0].aov_name" -type "string" "AO";
	setAttr ".aovs[1].aov_name" -type "string" "L_fill";
	setAttr ".aovs[2].aov_name" -type "string" "L_hdr";
	setAttr ".aovs[3].aov_name" -type "string" "L_key";
	setAttr ".aovs[4].aov_name" -type "string" "L_rim";
	setAttr ".aovs[5].aov_name" -type "string" "N";
	setAttr ".aovs[6].aov_name" -type "string" "P";
	setAttr ".aovs[7].aov_name" -type "string" "UV";
	setAttr ".aovs[8].aov_name" -type "string" "Z";
	setAttr ".aovs[9].aov_name" -type "string" "coat";
	setAttr ".aovs[10].aov_name" -type "string" "crypto_material";
	setAttr ".aovs[11].aov_name" -type "string" "crypto_object";
	setAttr ".aovs[12].aov_name" -type "string" "diffuse_albedo";
	setAttr ".aovs[13].aov_name" -type "string" "diffuse_direct";
	setAttr ".aovs[14].aov_name" -type "string" "diffuse_indirect";
	setAttr ".aovs[15].aov_name" -type "string" "emission";
	setAttr ".aovs[16].aov_name" -type "string" "motionvector";
	setAttr ".aovs[17].aov_name" -type "string" "shadow_matte";
	setAttr ".aovs[18].aov_name" -type "string" "specular_direct";
	setAttr ".aovs[19].aov_name" -type "string" "specular_indirect";
	setAttr ".aovs[20].aov_name" -type "string" "sss";
	setAttr ".aovs[21].aov_name" -type "string" "transmission";
	setAttr ".aovs[22].aov_name" -type "string" "volume";
	setAttr ".aal" -type "attributeAlias" {"ai_aov_AO","aiCustomAOVs[0]","ai_aov_crypto_material"
		,"aiCustomAOVs[10]","ai_aov_crypto_object","aiCustomAOVs[11]","ai_aov_diffuse_albedo"
		,"aiCustomAOVs[12]","ai_aov_diffuse_direct","aiCustomAOVs[13]","ai_aov_diffuse_indirect"
		,"aiCustomAOVs[14]","ai_aov_emission","aiCustomAOVs[15]","ai_aov_motionvector","aiCustomAOVs[16]"
		,"ai_aov_shadow_matte","aiCustomAOVs[17]","ai_aov_specular_direct","aiCustomAOVs[18]"
		,"ai_aov_specular_indirect","aiCustomAOVs[19]","ai_aov_L_fill","aiCustomAOVs[1]","ai_aov_sss"
		,"aiCustomAOVs[20]","ai_aov_transmission","aiCustomAOVs[21]","ai_aov_volume","aiCustomAOVs[22]"
		,"ai_aov_L_hdr","aiCustomAOVs[2]","ai_aov_L_key","aiCustomAOVs[3]","ai_aov_L_rim"
		,"aiCustomAOVs[4]","ai_aov_N","aiCustomAOVs[5]","ai_aov_P","aiCustomAOVs[6]","ai_aov_UV"
		,"aiCustomAOVs[7]","ai_aov_Z","aiCustomAOVs[8]","ai_aov_coat","aiCustomAOVs[9]"} ;
createNode materialInfo -n "materialInfo1";
	rename -uid "6024F900-0000-03C3-5A9D-3D3A0000031D";
createNode renderSetup -n "renderSetup";
	rename -uid "097D8900-0000-6947-5A9E-BE9F0000A17C";
createNode renderSetupLayer -n "creature_adult";
	rename -uid "097D8900-0000-6947-5A9E-BE9F0000A17D";
	addAttr -ci true -sn "expandedState" -ln "expandedState" -min 0 -max 1 -at "bool";
	setAttr ".expandedState" yes;
createNode renderLayer -n "rs_creature_adult";
	rename -uid "097D8900-0000-6947-5A9E-BE9F0000A17E";
	setAttr ".do" 1;
createNode renderSetupLayer -n "shadow";
	rename -uid "097D8900-0000-6947-5A9E-BEA60000A17F";
	addAttr -ci true -sn "expandedState" -ln "expandedState" -min 0 -max 1 -at "bool";
	setAttr ".expandedState" yes;
createNode renderLayer -n "rs_shadow";
	rename -uid "097D8900-0000-6947-5A9E-BEA60000A180";
	setAttr ".rndr" no;
	setAttr ".do" 2;
createNode collection -n "catcher";
	rename -uid "097D8900-0000-6947-5A9E-BEAB0000A181";
createNode simpleSelector -n "collection1Selector";
	rename -uid "097D8900-0000-6947-5A9E-BEAB0000A182";
	setAttr ".ssl" -type "string" "|shadowCatcher";
createNode collection -n "caster";
	rename -uid "097D8900-0000-6947-5A9E-BEB10000A183";
	addAttr -ci true -sn "expandedState" -ln "expandedState" -min 0 -max 1 -at "bool";
createNode simpleSelector -n "collection2Selector";
	rename -uid "097D8900-0000-6947-5A9E-BEB10000A184";
	setAttr ".pat" -type "string" "::*body*, ::*claws*, ::*mouth*, ::*geo*";
	setAttr ".tf" 0;
createNode collection -n "AOVoverrides";
	rename -uid "097D8900-0000-6947-5A9E-BF4F0000A18A";
	addAttr -ci true -sn "expandedState" -ln "expandedState" -min 0 -max 1 -at "bool";
createNode simpleSelector -n "collection3Selector";
	rename -uid "097D8900-0000-6947-5A9E-BF4F0000A18B";
	setAttr ".pat" -type "string" "aiAOV*";
	setAttr ".tf" 0;
createNode absOverride -n "enabled";
	rename -uid "097D8900-0000-6947-5A9E-C4660000A190";
	addAttr -ci true -sn "atv" -ln "attrValue" -min 0 -max 1 -at "bool";
	setAttr ".atr" -type "string" "enabled";
createNode collection -n "creature_adultCollection";
	rename -uid "097D8900-0000-6947-5A9E-C4E90000A1ED";
createNode simpleSelector -n "collection4Selector";
	rename -uid "097D8900-0000-6947-5A9E-C4E90000A1EE";
	setAttr ".pat" -type "string" "::*body*, ::*claws*, ::*mouth*, ::*geo*";
	setAttr ".tf" 0;
createNode absOverride -n "primaryVisibility";
	rename -uid "097D8900-0000-6947-5A9E-D6A80000F9C5";
	addAttr -ci true -sn "atv" -ln "attrValue" -min 0 -max 1 -at "bool";
	setAttr ".atr" -type "string" "primaryVisibility";
createNode renderSettingsCollection -n "RenderSettingsCollection";
	rename -uid "097D8900-0000-6947-5A9E-E01500011327";
	addAttr -ci true -sn "expandedState" -ln "expandedState" -min 0 -max 1 -at "bool";
createNode simpleSelector -n "RenderSettingsCollectionSelector";
	rename -uid "097D8900-0000-6947-5A9E-E01500011328";
	setAttr ".ssl" -type "string" "defaultRenderQuality\ndefaultArnoldRenderOptions\ndefaultRenderGlobals\ndefaultArnoldDriver\ndefaultResolution\ndefaultArnoldFilter";
	setAttr ".tf" 0;
createNode absUniqueOverride -n "ignoreTextures";
	rename -uid "097D8900-0000-6947-5A9E-E01500011329";
	addAttr -ci true -sn "atv" -ln "attrValue" -min 0 -max 1 -at "bool";
	setAttr ".atr" -type "string" "ignoreTextures";
	setAttr ".tgName" -type "string" "defaultArnoldRenderOptions";
	setAttr ".atv" yes;
createNode absUniqueOverride -n "ignoreDisplacement";
	rename -uid "097D8900-0000-6947-5A9E-E0200001132B";
	addAttr -ci true -sn "atv" -ln "attrValue" -min 0 -max 1 -at "bool";
	setAttr ".atr" -type "string" "ignoreDisplacement";
	setAttr ".tgName" -type "string" "defaultArnoldRenderOptions";
	setAttr ".atv" yes;
createNode collection -n "setGeo_matte";
	rename -uid "097D8900-0000-6947-5A9F-BC7900016405";
	addAttr -ci true -sn "expandedState" -ln "expandedState" -min 0 -max 1 -at "bool";
createNode simpleSelector -n "collection5Selector";
	rename -uid "097D8900-0000-6947-5A9F-BC7900016406";
	setAttr ".pat" -type "string" "-::*body*, -::*claws*, -::*mouth*, -::*geo*, -*shadowCatcher*, -::*chrome*, -::*grey*";
	setAttr ".tf" 0;
createNode absOverride -n "aiMatte";
	rename -uid "097D8900-0000-6947-5A9F-BDB900016414";
	addAttr -ci true -sn "atv" -ln "attrValue" -min 0 -max 1 -at "bool";
	setAttr ".atr" -type "string" "aiMatte";
	setAttr ".atv" yes;
createNode collection -n "setGeo_shapes";
	rename -uid "097D8900-0000-6947-5A9F-BDB900016415";
	addAttr -ci true -sn "expandedState" -ln "expandedState" -min 0 -max 1 -at "bool";
	setAttr ".expandedState" yes;
createNode simpleSelector -n "setGeo_shapesSelector";
	rename -uid "097D8900-0000-6947-5A9F-BDB900016416";
	setAttr ".pat" -type "string" "*, -::*body*, -::*claws*, -::*mouth*, -::*geo*, -*shadowCatcher*, -::*Assistants*";
	setAttr ".tf" 2;
createNode objectSet -s -n "lightEditorRoot";
	rename -uid "097D8900-0000-6947-5A9F-C0A50001646E";
	addAttr -ci true -sn "isolate" -ln "isolate" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "wasEnabled" -ln "wasEnabled" -dv 1 -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "childIndex" -ln "childIndex" -dv -1 -at "long";
	addAttr -ci true -sn "lightGroup" -ln "lightGroup" -dv 1 -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "visibility" -ln "visibility" -dv 1 -min 0 -max 1 -at "bool";
lockNode -l 1 ;
createNode collection -n "shadowColourKey";
	rename -uid "097D8900-0000-6947-5A9F-E1DE000164E3";
	addAttr -ci true -sn "expandedState" -ln "expandedState" -min 0 -max 1 -at "bool";
createNode simpleSelector -n "collection6Selector";
	rename -uid "097D8900-0000-6947-5A9F-E1DE000164E4";
	setAttr ".pat" -type "string" "::*key*";
	setAttr ".tf" 4;
createNode collection -n "shadowColourRim";
	rename -uid "097D8900-0000-6947-5A9F-E201000164E5";
	addAttr -ci true -sn "expandedState" -ln "expandedState" -min 0 -max 1 -at "bool";
	setAttr ".expandedState" yes;
createNode simpleSelector -n "collection7Selector";
	rename -uid "097D8900-0000-6947-5A9F-E201000164E6";
	setAttr ".pat" -type "string" "::*rim*";
	setAttr ".tf" 4;
createNode collection -n "shadowColourFill";
	rename -uid "097D8900-0000-6947-5A9F-E212000164E7";
	addAttr -ci true -sn "expandedState" -ln "expandedState" -min 0 -max 1 -at "bool";
createNode simpleSelector -n "collection8Selector";
	rename -uid "097D8900-0000-6947-5A9F-E212000164E8";
	setAttr ".pat" -type "string" "::*fill*";
	setAttr ".tf" 4;
createNode absOverride -n "shadowColor";
	rename -uid "097D8900-0000-6947-5A9F-F8740001651B";
	addAttr -ci true -uac -sn "atv" -ln "attrValue" -at "float3" -nc 3;
	addAttr -ci true -sn "atvr" -ln "attrValueR" -at "float" -p "attrValue";
	addAttr -ci true -sn "atvg" -ln "attrValueG" -at "float" -p "attrValue";
	addAttr -ci true -sn "atvb" -ln "attrValueB" -at "float" -p "attrValue";
	setAttr ".atr" -type "string" "shadowColor";
	setAttr ".atv" -type "float3" 0 1 1 ;
	setAttr -k on ".atvr";
	setAttr -k on ".atvg";
	setAttr -k on ".atvb";
createNode absOverride -n "shadowColor1";
	rename -uid "097D8900-0000-6947-5A9F-F8810001651C";
	addAttr -ci true -uac -sn "atv" -ln "attrValue" -at "float3" -nc 3;
	addAttr -ci true -sn "atvr" -ln "attrValueR" -at "float" -p "attrValue";
	addAttr -ci true -sn "atvg" -ln "attrValueG" -at "float" -p "attrValue";
	addAttr -ci true -sn "atvb" -ln "attrValueB" -at "float" -p "attrValue";
	setAttr ".atr" -type "string" "shadowColor";
	setAttr ".atv" -type "float3" 1 0 1 ;
	setAttr -k on ".atvr";
	setAttr -k on ".atvg";
	setAttr -k on ".atvb";
createNode absOverride -n "shadowColor2";
	rename -uid "097D8900-0000-6947-5A9F-F88E0001651D";
	addAttr -ci true -uac -sn "atv" -ln "attrValue" -at "float3" -nc 3;
	addAttr -ci true -sn "atvr" -ln "attrValueR" -at "float" -p "attrValue";
	addAttr -ci true -sn "atvg" -ln "attrValueG" -at "float" -p "attrValue";
	addAttr -ci true -sn "atvb" -ln "attrValueB" -at "float" -p "attrValue";
	setAttr ".atr" -type "string" "shadowColor";
	setAttr ".atv" -type "float3" 1 1 0 ;
	setAttr -k on ".atvr";
	setAttr -k on ".atvg";
	setAttr -k on ".atvb";
createNode absUniqueOverride -n "maxSubdivisions";
	rename -uid "097D8900-0000-6947-5AA0-150C0001653A";
	addAttr -ci true -sn "atv" -ln "attrValue" -min 0 -max 255 -at "char";
	setAttr ".atr" -type "string" "maxSubdivisions";
	setAttr ".tgName" -type "string" "defaultArnoldRenderOptions";
	setAttr ".atv" 1;
createNode absUniqueOverride -n "AASamples";
	rename -uid "097D8900-0000-6947-5AA0-152A00016556";
	addAttr -ci true -sn "atv" -ln "attrValue" -min -10 -max 100 -smn 1 -smx 10 -at "long";
	setAttr ".atr" -type "string" "AASamples";
	setAttr ".tgName" -type "string" "defaultArnoldRenderOptions";
	setAttr ".atv" 2;
createNode absUniqueOverride -n "GIDiffuseSamples";
	rename -uid "097D8900-0000-6947-5AA0-153100016558";
	addAttr -ci true -sn "atv" -ln "attrValue" -min 0 -max 100 -smn 0 -smx 10 -at "long";
	setAttr ".atr" -type "string" "GIDiffuseSamples";
	setAttr ".tgName" -type "string" "defaultArnoldRenderOptions";
	setAttr ".atv" 1;
createNode absUniqueOverride -n "GISpecularSamples";
	rename -uid "097D8900-0000-6947-5AA0-15370001655A";
	addAttr -ci true -sn "atv" -ln "attrValue" -min 0 -max 100 -smn 0 -smx 10 -at "long";
	setAttr ".atr" -type "string" "GISpecularSamples";
	setAttr ".tgName" -type "string" "defaultArnoldRenderOptions";
	setAttr ".atv" 1;
createNode absUniqueOverride -n "GITransmissionSamples";
	rename -uid "097D8900-0000-6947-5AA0-153D0001655C";
	addAttr -ci true -sn "atv" -ln "attrValue" -min 0 -max 100 -smn 0 -smx 10 -at "long";
	setAttr ".atr" -type "string" "GITransmissionSamples";
	setAttr ".tgName" -type "string" "defaultArnoldRenderOptions";
	setAttr ".atv" 1;
createNode absUniqueOverride -n "GISssSamples";
	rename -uid "097D8900-0000-6947-5AA0-15420001655E";
	addAttr -ci true -sn "atv" -ln "attrValue" -min 0 -max 100 -smn 0 -smx 10 -at "long";
	setAttr ".atr" -type "string" "GISssSamples";
	setAttr ".tgName" -type "string" "defaultArnoldRenderOptions";
	setAttr ".atv" 1;
createNode absUniqueOverride -n "GIDiffuseDepth";
	rename -uid "097D8900-0000-6947-5AA0-154800016560";
	addAttr -ci true -sn "atv" -ln "attrValue" -min 0 -smn 0 -smx 16 -at "long";
	setAttr ".atr" -type "string" "GIDiffuseDepth";
	setAttr ".tgName" -type "string" "defaultArnoldRenderOptions";
createNode absUniqueOverride -n "GISpecularDepth";
	rename -uid "097D8900-0000-6947-5AA0-154E00016562";
	addAttr -ci true -sn "atv" -ln "attrValue" -min 0 -smn 0 -smx 16 -at "long";
	setAttr ".atr" -type "string" "GISpecularDepth";
	setAttr ".tgName" -type "string" "defaultArnoldRenderOptions";
	setAttr ".atv" 1;
createNode absUniqueOverride -n "GIVolumeSamples";
	rename -uid "097D8900-0000-6947-5AA0-156000016564";
	addAttr -ci true -sn "atv" -ln "attrValue" -min 0 -smx 10 -at "long";
	setAttr ".atr" -type "string" "GIVolumeSamples";
	setAttr ".tgName" -type "string" "defaultArnoldRenderOptions";
createNode reference -n "default_lightrigRN";
	rename -uid "09C21900-0000-5564-5AA9-494F00000319";
	setAttr ".ed" -type "dataReferenceEdits" 
		"default_lightrigRN"
		"default_lightrigRN" 0
		"default_lightrigRN" 1
		2 "default_lightrig:IGPUCS" "scriptType" " 0";
lockNode -l 1 ;
createNode reference -n "creature_adult_shaderkeeperRN";
	rename -uid "09C21900-0000-5564-5AA9-495900000343";
	setAttr ".ed" -type "dataReferenceEdits" 
		"creature_adult_shaderkeeperRN"
		"creature_adult_shaderkeeperRN" 0
		"creature_adult_shaderkeeperRN" 1
		2 "creature_adult_shaderkeeper:IGPUCS" "scriptType" " 0";
lockNode -l 1 ;
createNode aiStandardSurface -n "backplateProjection";
	rename -uid "A8391900-0000-2276-5ACD-FB34000005BB";
	setAttr ".specular" 0;
	setAttr ".emission" 1;
createNode shadingEngine -n "backplateProjection_SG";
	rename -uid "A8391900-0000-2276-5ACD-FB34000005BC";
	addAttr -ci true -h true -sn "aal" -ln "attributeAliasList" -dt "attributeAlias";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
	setAttr -s 23 ".aovs";
	setAttr ".aovs[0].aov_name" -type "string" "AO";
	setAttr ".aovs[1].aov_name" -type "string" "L_fill";
	setAttr ".aovs[2].aov_name" -type "string" "L_hdr";
	setAttr ".aovs[3].aov_name" -type "string" "L_key";
	setAttr ".aovs[4].aov_name" -type "string" "L_rim";
	setAttr ".aovs[5].aov_name" -type "string" "N";
	setAttr ".aovs[6].aov_name" -type "string" "P";
	setAttr ".aovs[7].aov_name" -type "string" "UV";
	setAttr ".aovs[8].aov_name" -type "string" "Z";
	setAttr ".aovs[9].aov_name" -type "string" "coat";
	setAttr ".aovs[10].aov_name" -type "string" "crypto_material";
	setAttr ".aovs[11].aov_name" -type "string" "crypto_object";
	setAttr ".aovs[12].aov_name" -type "string" "diffuse_albedo";
	setAttr ".aovs[13].aov_name" -type "string" "diffuse_direct";
	setAttr ".aovs[14].aov_name" -type "string" "diffuse_indirect";
	setAttr ".aovs[15].aov_name" -type "string" "emission";
	setAttr ".aovs[16].aov_name" -type "string" "motionvector";
	setAttr ".aovs[17].aov_name" -type "string" "shadow_matte";
	setAttr ".aovs[18].aov_name" -type "string" "specular_direct";
	setAttr ".aovs[19].aov_name" -type "string" "specular_indirect";
	setAttr ".aovs[20].aov_name" -type "string" "sss";
	setAttr ".aovs[21].aov_name" -type "string" "transmission";
	setAttr ".aovs[22].aov_name" -type "string" "volume";
	setAttr ".aal" -type "attributeAlias" {"ai_aov_AO","aiCustomAOVs[0]","ai_aov_crypto_material"
		,"aiCustomAOVs[10]","ai_aov_crypto_object","aiCustomAOVs[11]","ai_aov_diffuse_albedo"
		,"aiCustomAOVs[12]","ai_aov_diffuse_direct","aiCustomAOVs[13]","ai_aov_diffuse_indirect"
		,"aiCustomAOVs[14]","ai_aov_emission","aiCustomAOVs[15]","ai_aov_motionvector","aiCustomAOVs[16]"
		,"ai_aov_shadow_matte","aiCustomAOVs[17]","ai_aov_specular_direct","aiCustomAOVs[18]"
		,"ai_aov_specular_indirect","aiCustomAOVs[19]","ai_aov_L_fill","aiCustomAOVs[1]","ai_aov_sss"
		,"aiCustomAOVs[20]","ai_aov_transmission","aiCustomAOVs[21]","ai_aov_volume","aiCustomAOVs[22]"
		,"ai_aov_L_hdr","aiCustomAOVs[2]","ai_aov_L_key","aiCustomAOVs[3]","ai_aov_L_rim"
		,"aiCustomAOVs[4]","ai_aov_N","aiCustomAOVs[5]","ai_aov_P","aiCustomAOVs[6]","ai_aov_UV"
		,"aiCustomAOVs[7]","ai_aov_Z","aiCustomAOVs[8]","ai_aov_coat","aiCustomAOVs[9]"} ;
createNode materialInfo -n "materialInfo2";
	rename -uid "A8391900-0000-2276-5ACD-FB34000005BD";
createNode projection -n "backplateProjection_projection";
	rename -uid "A8391900-0000-2276-5ACD-FB48000005BE";
	setAttr ".t" 8;
	setAttr ".vt1" -type "float2" 0.5 0.5 ;
	setAttr ".vt2" -type "float2" 0.5 0.5 ;
	setAttr ".vt3" -type "float2" 0.5 0.5 ;
createNode file -n "backplateProjection_file";
	rename -uid "A8391900-0000-2276-5ACD-FB48000005BF";
	setAttr ".dc" -type "float3" 0 0 0 ;
	setAttr ".cs" -type "string" "sRGB";
createNode place2dTexture -n "backplateProjection_place2dTexture";
	rename -uid "A8391900-0000-2276-5ACD-FB48000005C3";
	setAttr ".wu" no;
	setAttr ".wv" no;
createNode aiAmbientOcclusion -n "shadowMatteAmbientOcclusion";
	rename -uid "E7A8B900-0000-1E4C-5ACE-1E9B000005C4";
	setAttr ".samples" 7;
	setAttr ".spread" 0.3815028965473175;
	setAttr ".far_clip" 90;
	setAttr ".black" -type "float3" 0 1 0 ;
	setAttr ".white" -type "float3" 0 0 0 ;
createNode shadingEngine -n "aiAmbientOcclusion1SG";
	rename -uid "E7A8B900-0000-1E4C-5ACE-1E9B000005C5";
	addAttr -ci true -h true -sn "aal" -ln "attributeAliasList" -dt "attributeAlias";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
	setAttr -s 23 ".aovs";
	setAttr ".aovs[0].aov_name" -type "string" "AO";
	setAttr ".aovs[1].aov_name" -type "string" "L_fill";
	setAttr ".aovs[2].aov_name" -type "string" "L_hdr";
	setAttr ".aovs[3].aov_name" -type "string" "L_key";
	setAttr ".aovs[4].aov_name" -type "string" "L_rim";
	setAttr ".aovs[5].aov_name" -type "string" "N";
	setAttr ".aovs[6].aov_name" -type "string" "P";
	setAttr ".aovs[7].aov_name" -type "string" "UV";
	setAttr ".aovs[8].aov_name" -type "string" "Z";
	setAttr ".aovs[9].aov_name" -type "string" "coat";
	setAttr ".aovs[10].aov_name" -type "string" "crypto_material";
	setAttr ".aovs[11].aov_name" -type "string" "crypto_object";
	setAttr ".aovs[12].aov_name" -type "string" "diffuse_albedo";
	setAttr ".aovs[13].aov_name" -type "string" "diffuse_direct";
	setAttr ".aovs[14].aov_name" -type "string" "diffuse_indirect";
	setAttr ".aovs[15].aov_name" -type "string" "emission";
	setAttr ".aovs[16].aov_name" -type "string" "motionvector";
	setAttr ".aovs[17].aov_name" -type "string" "shadow_matte";
	setAttr ".aovs[18].aov_name" -type "string" "specular_direct";
	setAttr ".aovs[19].aov_name" -type "string" "specular_indirect";
	setAttr ".aovs[20].aov_name" -type "string" "sss";
	setAttr ".aovs[21].aov_name" -type "string" "transmission";
	setAttr ".aovs[22].aov_name" -type "string" "volume";
	setAttr ".aal" -type "attributeAlias" {"ai_aov_AO","aiCustomAOVs[0]","ai_aov_crypto_material"
		,"aiCustomAOVs[10]","ai_aov_crypto_object","aiCustomAOVs[11]","ai_aov_diffuse_albedo"
		,"aiCustomAOVs[12]","ai_aov_diffuse_direct","aiCustomAOVs[13]","ai_aov_diffuse_indirect"
		,"aiCustomAOVs[14]","ai_aov_emission","aiCustomAOVs[15]","ai_aov_motionvector","aiCustomAOVs[16]"
		,"ai_aov_shadow_matte","aiCustomAOVs[17]","ai_aov_specular_direct","aiCustomAOVs[18]"
		,"ai_aov_specular_indirect","aiCustomAOVs[19]","ai_aov_L_fill","aiCustomAOVs[1]","ai_aov_sss"
		,"aiCustomAOVs[20]","ai_aov_transmission","aiCustomAOVs[21]","ai_aov_volume","aiCustomAOVs[22]"
		,"ai_aov_L_hdr","aiCustomAOVs[2]","ai_aov_L_key","aiCustomAOVs[3]","ai_aov_L_rim"
		,"aiCustomAOVs[4]","ai_aov_N","aiCustomAOVs[5]","ai_aov_P","aiCustomAOVs[6]","ai_aov_UV"
		,"aiCustomAOVs[7]","ai_aov_Z","aiCustomAOVs[8]","ai_aov_coat","aiCustomAOVs[9]"} ;
createNode materialInfo -n "materialInfo3";
	rename -uid "E7A8B900-0000-1E4C-5ACE-1E9B000005C6";
createNode absOverride -n "intensity";
	rename -uid "E7A8B900-0000-1E4C-5ACE-1F3200000617";
	addAttr -ci true -k true -sn "atv" -ln "attrValue" -smn 0 -smx 10 -at "float";
	setAttr ".atr" -type "string" "intensity";
	setAttr -k on ".atv";
createNode nodeGraphEditorInfo -n "hyperShadePrimaryNodeEditorSavedTabsInfo";
	rename -uid "E7A8B900-0000-1E4C-5ACE-219B00000666";
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -2858.8750354900831 515.92100589662778 ;
	setAttr ".tgi[0].vh" -type "double2" -1277.3624748082989 1105.8369557364856 ;
	setAttr -s 4 ".tgi[0].ni";
	setAttr ".tgi[0].ni[0].x" -1865.7142333984375;
	setAttr ".tgi[0].ni[0].y" 992.85711669921875;
	setAttr ".tgi[0].ni[0].nvs" 1923;
	setAttr ".tgi[0].ni[1].x" -2192.857177734375;
	setAttr ".tgi[0].ni[1].y" 992.85711669921875;
	setAttr ".tgi[0].ni[1].nvs" 1923;
	setAttr ".tgi[0].ni[2].x" -1865.7142333984375;
	setAttr ".tgi[0].ni[2].y" 764.28570556640625;
	setAttr ".tgi[0].ni[2].nvs" 1923;
	setAttr ".tgi[0].ni[3].x" -2500;
	setAttr ".tgi[0].ni[3].y" 891.4285888671875;
	setAttr ".tgi[0].ni[3].nvs" 1923;
select -ne :time1;
	setAttr ".o" 1001;
	setAttr ".unw" 1001;
select -ne :hardwareRenderingGlobals;
	setAttr ".otfna" -type "stringArray" 22 "NURBS Curves" "NURBS Surfaces" "Polygons" "Subdiv Surface" "Particles" "Particle Instance" "Fluids" "Strokes" "Image Planes" "UI" "Lights" "Cameras" "Locators" "Joints" "IK Handles" "Deformers" "Motion Trails" "Components" "Hair Systems" "Follicles" "Misc. UI" "Ornaments"  ;
	setAttr ".otfva" -type "Int32Array" 22 0 1 1 1 1 1
		 1 1 1 0 0 0 0 0 0 0 0 0
		 0 0 0 0 ;
	setAttr ".fprt" yes;
select -ne :renderPartition;
	setAttr -s 21 ".st";
select -ne :renderGlobalsList1;
select -ne :defaultShaderList1;
	setAttr -s 33 ".s";
select -ne :postProcessList1;
	setAttr -s 2 ".p";
select -ne :defaultRenderUtilityList1;
	setAttr -s 139 ".u";
select -ne :defaultRenderingList1;
	setAttr -s 5 ".r";
select -ne :lightList1;
	setAttr -s 4 ".l";
select -ne :defaultTextureList1;
	setAttr -s 98 ".tx";
select -ne :initialShadingGroup;
	addAttr -ci true -h true -sn "aal" -ln "attributeAliasList" -dt "attributeAlias";
	setAttr ".ro" yes;
	setAttr -s 23 ".aovs";
	setAttr ".aovs[0].aov_name" -type "string" "AO";
	setAttr ".aovs[1].aov_name" -type "string" "N";
	setAttr ".aovs[2].aov_name" -type "string" "P";
	setAttr ".aovs[3].aov_name" -type "string" "UV";
	setAttr ".aovs[4].aov_name" -type "string" "Z";
	setAttr ".aovs[5].aov_name" -type "string" "coat";
	setAttr ".aovs[6].aov_name" -type "string" "crypto_material";
	setAttr ".aovs[7].aov_name" -type "string" "crypto_object";
	setAttr ".aovs[8].aov_name" -type "string" "diffuse_albedo";
	setAttr ".aovs[9].aov_name" -type "string" "diffuse_direct";
	setAttr ".aovs[10].aov_name" -type "string" "diffuse_indirect";
	setAttr ".aovs[11].aov_name" -type "string" "emission";
	setAttr ".aovs[12].aov_name" -type "string" "motionvector";
	setAttr ".aovs[13].aov_name" -type "string" "shadow_matte";
	setAttr ".aovs[14].aov_name" -type "string" "specular_direct";
	setAttr ".aovs[15].aov_name" -type "string" "specular_indirect";
	setAttr ".aovs[16].aov_name" -type "string" "sss";
	setAttr ".aovs[17].aov_name" -type "string" "transmission";
	setAttr ".aovs[18].aov_name" -type "string" "volume";
	setAttr ".aovs[19].aov_name" -type "string" "L_hdr";
	setAttr ".aovs[20].aov_name" -type "string" "L_key";
	setAttr ".aovs[21].aov_name" -type "string" "L_rim";
	setAttr ".aovs[22].aov_name" -type "string" "L_fill";
	setAttr ".aal" -type "attributeAlias" {"ai_aov_AO","aiCustomAOVs[0]","ai_aov_diffuse_indirect"
		,"aiCustomAOVs[10]","ai_aov_emission","aiCustomAOVs[11]","ai_aov_motionvector","aiCustomAOVs[12]"
		,"ai_aov_shadow_matte","aiCustomAOVs[13]","ai_aov_specular_direct","aiCustomAOVs[14]"
		,"ai_aov_specular_indirect","aiCustomAOVs[15]","ai_aov_sss","aiCustomAOVs[16]","ai_aov_transmission"
		,"aiCustomAOVs[17]","ai_aov_volume","aiCustomAOVs[18]","ai_aov_L_hdr","aiCustomAOVs[19]"
		,"ai_aov_N","aiCustomAOVs[1]","ai_aov_L_key","aiCustomAOVs[20]","ai_aov_L_rim","aiCustomAOVs[21]"
		,"ai_aov_L_fill","aiCustomAOVs[22]","ai_aov_P","aiCustomAOVs[2]","ai_aov_UV","aiCustomAOVs[3]"
		,"ai_aov_Z","aiCustomAOVs[4]","ai_aov_coat","aiCustomAOVs[5]","ai_aov_crypto_material"
		,"aiCustomAOVs[6]","ai_aov_crypto_object","aiCustomAOVs[7]","ai_aov_diffuse_albedo"
		,"aiCustomAOVs[8]","ai_aov_diffuse_direct","aiCustomAOVs[9]"} ;
select -ne :initialParticleSE;
	addAttr -ci true -h true -sn "aal" -ln "attributeAliasList" -dt "attributeAlias";
	setAttr ".ro" yes;
	setAttr -s 23 ".aovs";
	setAttr ".aovs[0].aov_name" -type "string" "AO";
	setAttr ".aovs[1].aov_name" -type "string" "N";
	setAttr ".aovs[2].aov_name" -type "string" "P";
	setAttr ".aovs[3].aov_name" -type "string" "UV";
	setAttr ".aovs[4].aov_name" -type "string" "Z";
	setAttr ".aovs[5].aov_name" -type "string" "coat";
	setAttr ".aovs[6].aov_name" -type "string" "crypto_material";
	setAttr ".aovs[7].aov_name" -type "string" "crypto_object";
	setAttr ".aovs[8].aov_name" -type "string" "diffuse_albedo";
	setAttr ".aovs[9].aov_name" -type "string" "diffuse_direct";
	setAttr ".aovs[10].aov_name" -type "string" "diffuse_indirect";
	setAttr ".aovs[11].aov_name" -type "string" "emission";
	setAttr ".aovs[12].aov_name" -type "string" "motionvector";
	setAttr ".aovs[13].aov_name" -type "string" "shadow_matte";
	setAttr ".aovs[14].aov_name" -type "string" "specular_direct";
	setAttr ".aovs[15].aov_name" -type "string" "specular_indirect";
	setAttr ".aovs[16].aov_name" -type "string" "sss";
	setAttr ".aovs[17].aov_name" -type "string" "transmission";
	setAttr ".aovs[18].aov_name" -type "string" "volume";
	setAttr ".aovs[19].aov_name" -type "string" "L_hdr";
	setAttr ".aovs[20].aov_name" -type "string" "L_key";
	setAttr ".aovs[21].aov_name" -type "string" "L_rim";
	setAttr ".aovs[22].aov_name" -type "string" "L_fill";
	setAttr ".aal" -type "attributeAlias" {"ai_aov_AO","aiCustomAOVs[0]","ai_aov_diffuse_indirect"
		,"aiCustomAOVs[10]","ai_aov_emission","aiCustomAOVs[11]","ai_aov_motionvector","aiCustomAOVs[12]"
		,"ai_aov_shadow_matte","aiCustomAOVs[13]","ai_aov_specular_direct","aiCustomAOVs[14]"
		,"ai_aov_specular_indirect","aiCustomAOVs[15]","ai_aov_sss","aiCustomAOVs[16]","ai_aov_transmission"
		,"aiCustomAOVs[17]","ai_aov_volume","aiCustomAOVs[18]","ai_aov_L_hdr","aiCustomAOVs[19]"
		,"ai_aov_N","aiCustomAOVs[1]","ai_aov_L_key","aiCustomAOVs[20]","ai_aov_L_rim","aiCustomAOVs[21]"
		,"ai_aov_L_fill","aiCustomAOVs[22]","ai_aov_P","aiCustomAOVs[2]","ai_aov_UV","aiCustomAOVs[3]"
		,"ai_aov_Z","aiCustomAOVs[4]","ai_aov_coat","aiCustomAOVs[5]","ai_aov_crypto_material"
		,"aiCustomAOVs[6]","ai_aov_crypto_object","aiCustomAOVs[7]","ai_aov_diffuse_albedo"
		,"aiCustomAOVs[8]","ai_aov_diffuse_direct","aiCustomAOVs[9]"} ;
select -ne :defaultRenderGlobals;
	addAttr -ci true -sn "imageNamePrefix" -ln "imageNamePrefix" -dt "string";
	addAttr -ci true -sn "deadlineJobName" -ln "deadlineJobName" -dt "string";
	addAttr -ci true -sn "deadlineJobComment" -ln "deadlineJobComment" -dt "string";
	addAttr -ci true -sn "deadlineDepartment" -ln "deadlineDepartment" -dt "string";
	addAttr -ci true -sn "deadlineGroup" -ln "deadlineGroup" -dt "string";
	addAttr -ci true -sn "deadlineJobPool" -ln "deadlineJobPool" -dt "string";
	addAttr -ci true -sn "deadlineJobSecondaryPool" -ln "deadlineJobSecondaryPool" -dt "string";
	addAttr -ci true -sn "deadlineJobPriority" -ln "deadlineJobPriority" -at "long";
	addAttr -ci true -sn "deadlineLimitCount" -ln "deadlineLimitCount" -at "long";
	addAttr -ci true -sn "deadlineConcurrentTasks" -ln "deadlineConcurrentTasks" -at "long";
	addAttr -ci true -sn "deadlineSlaveTimeout" -ln "deadlineSlaveTimeout" -at "long";
	addAttr -ci true -sn "deadlineMinSlaveTimeout" -ln "deadlineMinSlaveTimeout" -at "long";
	addAttr -ci true -sn "deadlineAutoTaskTimeout" -ln "deadlineAutoTaskTimeout" -at "long";
	addAttr -ci true -sn "deadlineLimitGroups" -ln "deadlineLimitGroups" -dt "string";
	addAttr -ci true -sn "deadlineMachineList" -ln "deadlineMachineList" -dt "string";
	addAttr -ci true -sn "deadlineIsBlacklist" -ln "deadlineIsBlacklist" -at "long";
	addAttr -ci true -sn "deadlineSubmitAsSuspended" -ln "deadlineSubmitAsSuspended" 
		-at "long";
	addAttr -ci true -sn "deadlineCloseOnSubmission" -ln "deadlineCloseOnSubmission" 
		-at "long";
	addAttr -ci true -sn "deadlineChunkSize" -ln "deadlineChunkSize" -at "long";
	addAttr -ci true -sn "deadlineSubmitMayaScene" -ln "deadlineSubmitMayaScene" -at "long";
	addAttr -ci true -sn "deadlineNumCPUs" -ln "deadlineNumCPUs" -at "long";
	addAttr -ci true -sn "deadlineSubmitEachRenderLayer" -ln "deadlineSubmitEachRenderLayer" 
		-at "long";
	addAttr -ci true -sn "deadlineOverrideLayerSettings" -ln "deadlineOverrideLayerSettings" 
		-at "long";
	addAttr -ci true -sn "deadlineSubmitEachCamera" -ln "deadlineSubmitEachCamera" -at "long";
	addAttr -ci true -sn "deadlineIgnoreDefaultCameras" -ln "deadlineIgnoreDefaultCameras" 
		-at "long";
	addAttr -ci true -sn "deadlineUseMayaBatchPlugin" -ln "deadlineUseMayaBatchPlugin" 
		-at "long";
	addAttr -ci true -sn "deadlineUseLocalAssetCaching" -ln "deadlineUseLocalAssetCaching" 
		-at "long";
	addAttr -ci true -sn "deadlineStrictErrorChecking" -ln "deadlineStrictErrorChecking" 
		-at "long";
	addAttr -ci true -sn "deadlineLocalRendering" -ln "deadlineLocalRendering" -at "long";
	addAttr -ci true -sn "deadlineStartupScript" -ln "deadlineStartupScript" -dt "string";
	addAttr -ci true -sn "deadlineMayaArgs" -ln "deadlineMayaArgs" -dt "string";
	addAttr -ci true -sn "deadlineTilesInX" -ln "deadlineTilesInX" -at "long";
	addAttr -ci true -sn "deadlineTilesInY" -ln "deadlineTilesInY" -at "long";
	addAttr -ci true -sn "deadlineTileSingleJob" -ln "deadlineTileSingleJob" -at "long";
	addAttr -ci true -sn "deadlineTileDependentJob" -ln "deadlineTileDependentJob" -at "long";
	addAttr -ci true -sn "deadlineTileCleanupJob" -ln "deadlineTileCleanupJob" -at "long";
	addAttr -ci true -sn "deadlineTileErrorOnMissing" -ln "deadlineTileErrorOnMissing" 
		-at "long";
	addAttr -ci true -sn "tileMissingBackground" -ln "tileMissingBackground" -at "long";
	addAttr -ci true -sn "deadlineMentalRayFilename" -ln "deadlineMentalRayFilename" 
		-dt "string";
	addAttr -ci true -sn "deadlineSubmitMentalRayJob" -ln "deadlineSubmitMentalRayJob" 
		-at "long";
	addAttr -ci true -sn "deadlineMentalRayThreads" -ln "deadlineMentalRayThreads" -at "long";
	addAttr -ci true -sn "deadlineMentalRayOffset" -ln "deadlineMentalRayOffset" -at "long";
	addAttr -ci true -sn "deadlineMentalRayLocalRendering" -ln "deadlineMentalRayLocalRendering" 
		-at "long";
	addAttr -ci true -sn "deadlineMentalRayArgs" -ln "deadlineMentalRayArgs" -dt "string";
	addAttr -ci true -sn "deadlineVRayFilename" -ln "deadlineVRayFilename" -dt "string";
	addAttr -ci true -sn "deadlineSubmitVRayJob" -ln "deadlineSubmitVRayJob" -at "long";
	addAttr -ci true -sn "deadlineVRayThreads" -ln "deadlineVRayThreads" -at "long";
	addAttr -ci true -sn "deadlineSubmitVrimg2ExrJob" -ln "deadlineSubmitVrimg2ExrJob" 
		-at "long";
	addAttr -ci true -sn "deadlineDeleteVrimgFiles" -ln "deadlineDeleteVrimgFiles" -at "long";
	addAttr -ci true -sn "deadlineExportRenderManThreads" -ln "deadlineExportRenderManThreads" 
		-at "long";
	addAttr -ci true -sn "deadlineRenderRenderManWithRis" -ln "deadlineRenderRenderManWithRis" 
		-at "long";
	addAttr -ci true -sn "deadlineSubmitRenderManJob" -ln "deadlineSubmitRenderManJob" 
		-at "long";
	addAttr -ci true -sn "deadlineRenderManFrameDependent" -ln "deadlineRenderManFrameDependent" 
		-at "long";
	addAttr -ci true -sn "deadlineRenderManThreads" -ln "deadlineRenderManThreads" -at "long";
	addAttr -ci true -sn "deadlineRenderManArgs" -ln "deadlineRenderManArgs" -dt "string";
	addAttr -ci true -sn "deadlineSubmitArnoldJob" -ln "deadlineSubmitArnoldJob" -at "long";
	addAttr -ci true -sn "deadlineExportArnoldLocal" -ln "deadlineExportArnoldLocal" 
		-at "long";
	addAttr -ci true -sn "deadlineArnoldThreads" -ln "deadlineArnoldThreads" -at "long";
	addAttr -ci true -sn "deadlineArnoldArgs" -ln "deadlineArnoldArgs" -dt "string";
	addAttr -ci true -sn "deadlineSubmitMaxwellJob" -ln "deadlineSubmitMaxwellJob" -at "long";
	addAttr -ci true -sn "deadlineSubmitRedshiftJob" -ln "deadlineSubmitRedshiftJob" 
		-at "long";
	addAttr -ci true -sn "deadlineExportRedshiftLocal" -ln "deadlineExportRedshiftLocal" 
		-at "long";
	addAttr -ci true -sn "deadlineRedshiftFrameDependent" -ln "deadlineRedshiftFrameDependent" 
		-at "long";
	addAttr -ci true -sn "deadlineRedshiftLayerSubmission" -ln "deadlineRedshiftLayerSubmission" 
		-at "long";
	addAttr -ci true -sn "deadlineRedshiftThreads" -ln "deadlineRedshiftThreads" -at "long";
	addAttr -ci true -sn "deadlineRedshiftArgs" -ln "deadlineRedshiftArgs" -dt "string";
	addAttr -ci true -sn "deadlineExportMaxwellLocal" -ln "deadlineExportMaxwellLocal" 
		-at "long";
	addAttr -ci true -sn "deadlineMaxwellThreads" -ln "deadlineMaxwellThreads" -at "long";
	addAttr -ci true -sn "deadlineMaxwellArgs" -ln "deadlineMaxwellArgs" -dt "string";
	setAttr ".ren" -type "string" "arnold";
	setAttr ".outf" 51;
	setAttr ".imfkey" -type "string" "exr";
	setAttr ".an" yes;
	setAttr ".fs" 1001;
	setAttr ".ef" 1010;
	setAttr ".pff" yes;
	setAttr ".ifp" -type "string" "<Scene>/<RenderLayer>/<Scene>.<RenderLayer>.<RenderPass>";
	setAttr ".deadlineJobName" -type "string" "arnoldSettings_LGT_base_v032";
	setAttr ".deadlineJobComment" -type "string" "";
	setAttr ".deadlineDepartment" -type "string" "";
	setAttr ".deadlineGroup" -type "string" "medium";
	setAttr ".deadlineJobPool" -type "string" "3d";
	setAttr ".deadlineJobSecondaryPool" -type "string" "3d";
	setAttr ".deadlineJobPriority" 50;
	setAttr ".deadlineConcurrentTasks" 1;
	setAttr ".deadlineLimitGroups" -type "string" "arnold";
	setAttr ".deadlineMachineList" -type "string" "";
	setAttr ".deadlineChunkSize" 1;
	setAttr ".deadlineUseMayaBatchPlugin" 1;
	setAttr ".deadlineStrictErrorChecking" 1;
	setAttr ".deadlineStartupScript" -type "string" "";
	setAttr ".deadlineMayaArgs" -type "string" "";
	setAttr ".deadlineTilesInX" 2;
	setAttr ".deadlineTilesInY" 2;
	setAttr ".deadlineTileSingleJob" 1;
	setAttr ".deadlineTileDependentJob" 1;
	setAttr ".deadlineTileErrorOnMissing" 1;
	setAttr ".tileMissingBackground" 1;
	setAttr ".deadlineMentalRayFilename" -type "string" "";
	setAttr ".deadlineMentalRayArgs" -type "string" "";
	setAttr ".deadlineVRayFilename" -type "string" "";
	setAttr ".deadlineRenderManFrameDependent" 1;
	setAttr ".deadlineRenderManArgs" -type "string" "";
	setAttr ".deadlineArnoldArgs" -type "string" "";
	setAttr ".deadlineRedshiftArgs" -type "string" "";
	setAttr ".deadlineMaxwellArgs" -type "string" "";
select -ne :defaultResolution;
	setAttr ".w" 2704;
	setAttr ".h" 1520;
	setAttr ".pa" 0.99699997901916504;
	setAttr ".al" yes;
	setAttr ".dar" 1.7729693651199341;
select -ne :defaultLightSet;
	setAttr -s 4 ".dsm";
select -ne :hardwareRenderGlobals;
	setAttr ".ctrs" 256;
	setAttr ".btrs" 512;
connectAttr "rs_shadow.ri" "shadowCatcher.rlio[0]";
connectAttr "shadowCatcherHistory.out" "shadowCatcherShape.i";
relationship "link" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "shadowLayer_aiShadowMatteSG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "backplateProjection_SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "aiAmbientOcclusion1SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "shadowLayer_aiShadowMatteSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "backplateProjection_SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "aiAmbientOcclusion1SG.message" ":defaultLightSet.message";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr ":defaultArnoldDisplayDriver.msg" ":defaultArnoldRenderOptions.drivers"
		 -na;
connectAttr ":defaultArnoldFilter.msg" ":defaultArnoldRenderOptions.filt";
connectAttr ":defaultArnoldDriver.msg" ":defaultArnoldRenderOptions.drvr";
connectAttr "aiAOV_AO.msg" ":defaultArnoldRenderOptions.aovs" -na;
connectAttr "aiAOV_N.msg" ":defaultArnoldRenderOptions.aovs" -na;
connectAttr "aiAOV_P.msg" ":defaultArnoldRenderOptions.aovs" -na;
connectAttr "aiAOV_UV.msg" ":defaultArnoldRenderOptions.aovs" -na;
connectAttr "aiAOV_Z.msg" ":defaultArnoldRenderOptions.aovs" -na;
connectAttr "aiAOV_coat.msg" ":defaultArnoldRenderOptions.aovs" -na;
connectAttr "aiAOV_crypto_material.msg" ":defaultArnoldRenderOptions.aovs" -na;
connectAttr "aiAOV_crypto_object.msg" ":defaultArnoldRenderOptions.aovs" -na;
connectAttr "aiAOV_diffuse_albedo.msg" ":defaultArnoldRenderOptions.aovs" -na;
connectAttr "aiAOV_diffuse_direct.msg" ":defaultArnoldRenderOptions.aovs" -na;
connectAttr "aiAOV_diffuse_indirect.msg" ":defaultArnoldRenderOptions.aovs" -na;
connectAttr "aiAOV_emission.msg" ":defaultArnoldRenderOptions.aovs" -na;
connectAttr "aiAOV_motionvector.msg" ":defaultArnoldRenderOptions.aovs" -na;
connectAttr "aiAOV_shadow_matte.msg" ":defaultArnoldRenderOptions.aovs" -na;
connectAttr "aiAOV_specular_direct.msg" ":defaultArnoldRenderOptions.aovs" -na;
connectAttr "aiAOV_specular_indirect.msg" ":defaultArnoldRenderOptions.aovs" -na
		;
connectAttr "aiAOV_sss.msg" ":defaultArnoldRenderOptions.aovs" -na;
connectAttr "aiAOV_transmission.msg" ":defaultArnoldRenderOptions.aovs" -na;
connectAttr "aiAOV_volume.msg" ":defaultArnoldRenderOptions.aovs" -na;
connectAttr "aiAOV_L_hdr.msg" ":defaultArnoldRenderOptions.aovs" -na;
connectAttr "aiAOV_L_key.msg" ":defaultArnoldRenderOptions.aovs" -na;
connectAttr "aiAOV_L_rim.msg" ":defaultArnoldRenderOptions.aovs" -na;
connectAttr "aiAOV_L_fill.msg" ":defaultArnoldRenderOptions.aovs" -na;
connectAttr ":defaultArnoldDriver.msg" "aiAOV_AO.out[0].drvr";
connectAttr ":defaultArnoldFilter.msg" "aiAOV_AO.out[0].ftr";
connectAttr "ambientOcclusion.out" "aiAOV_AO.dftv";
connectAttr ":defaultArnoldDriver.msg" "aiAOV_N.out[0].drvr";
connectAttr "aiAOVFilter1.msg" "aiAOV_N.out[0].ftr";
connectAttr ":defaultArnoldDriver.msg" "aiAOV_P.out[0].drvr";
connectAttr "aiAOVFilter2.msg" "aiAOV_P.out[0].ftr";
connectAttr ":defaultArnoldDriver.msg" "aiAOV_UV.out[0].drvr";
connectAttr ":defaultArnoldFilter.msg" "aiAOV_UV.out[0].ftr";
connectAttr "green_ramp.oc" "aiAOV_UV.dftv";
connectAttr ":defaultArnoldDriver.msg" "aiAOV_Z.out[0].drvr";
connectAttr "aiAOVFilter3.msg" "aiAOV_Z.out[0].ftr";
connectAttr ":defaultArnoldDriver.msg" "aiAOV_coat.out[0].drvr";
connectAttr ":defaultArnoldFilter.msg" "aiAOV_coat.out[0].ftr";
connectAttr ":defaultArnoldDriver.msg" "aiAOV_crypto_material.out[0].drvr";
connectAttr ":defaultArnoldFilter.msg" "aiAOV_crypto_material.out[0].ftr";
connectAttr "_aov_cryptomatte.out" "aiAOV_crypto_material.dftv";
connectAttr ":defaultArnoldDriver.msg" "aiAOV_crypto_object.out[0].drvr";
connectAttr ":defaultArnoldFilter.msg" "aiAOV_crypto_object.out[0].ftr";
connectAttr "_aov_cryptomatte.out" "aiAOV_crypto_object.dftv";
connectAttr ":defaultArnoldDriver.msg" "aiAOV_diffuse_albedo.out[0].drvr";
connectAttr ":defaultArnoldFilter.msg" "aiAOV_diffuse_albedo.out[0].ftr";
connectAttr ":defaultArnoldDriver.msg" "aiAOV_diffuse_direct.out[0].drvr";
connectAttr ":defaultArnoldFilter.msg" "aiAOV_diffuse_direct.out[0].ftr";
connectAttr ":defaultArnoldDriver.msg" "aiAOV_diffuse_indirect.out[0].drvr";
connectAttr ":defaultArnoldFilter.msg" "aiAOV_diffuse_indirect.out[0].ftr";
connectAttr ":defaultArnoldDriver.msg" "aiAOV_emission.out[0].drvr";
connectAttr ":defaultArnoldFilter.msg" "aiAOV_emission.out[0].ftr";
connectAttr ":defaultArnoldDriver.msg" "aiAOV_motionvector.out[0].drvr";
connectAttr ":defaultArnoldFilter.msg" "aiAOV_motionvector.out[0].ftr";
connectAttr ":defaultArnoldDriver.msg" "aiAOV_shadow_matte.out[0].drvr";
connectAttr ":defaultArnoldFilter.msg" "aiAOV_shadow_matte.out[0].ftr";
connectAttr ":defaultArnoldDriver.msg" "aiAOV_specular_direct.out[0].drvr";
connectAttr ":defaultArnoldFilter.msg" "aiAOV_specular_direct.out[0].ftr";
connectAttr ":defaultArnoldDriver.msg" "aiAOV_specular_indirect.out[0].drvr";
connectAttr ":defaultArnoldFilter.msg" "aiAOV_specular_indirect.out[0].ftr";
connectAttr ":defaultArnoldDriver.msg" "aiAOV_sss.out[0].drvr";
connectAttr ":defaultArnoldFilter.msg" "aiAOV_sss.out[0].ftr";
connectAttr ":defaultArnoldDriver.msg" "aiAOV_transmission.out[0].drvr";
connectAttr ":defaultArnoldFilter.msg" "aiAOV_transmission.out[0].ftr";
connectAttr ":defaultArnoldDriver.msg" "aiAOV_volume.out[0].drvr";
connectAttr ":defaultArnoldFilter.msg" "aiAOV_volume.out[0].ftr";
connectAttr ":defaultArnoldDriver.msg" "aiAOV_L_hdr.out[0].drvr";
connectAttr ":defaultArnoldFilter.msg" "aiAOV_L_hdr.out[0].ftr";
connectAttr ":defaultArnoldDriver.msg" "aiAOV_L_key.out[0].drvr";
connectAttr ":defaultArnoldFilter.msg" "aiAOV_L_key.out[0].ftr";
connectAttr ":defaultArnoldDriver.msg" "aiAOV_L_rim.out[0].drvr";
connectAttr ":defaultArnoldFilter.msg" "aiAOV_L_rim.out[0].ftr";
connectAttr ":defaultArnoldDriver.msg" "aiAOV_L_fill.out[0].drvr";
connectAttr ":defaultArnoldFilter.msg" "aiAOV_L_fill.out[0].ftr";
connectAttr "place2dTexture_Green.o" "green_ramp.uv";
connectAttr "place2dTexture_Green.ofs" "green_ramp.fs";
connectAttr "red_ramp.oc" "green_ramp.co";
connectAttr "place2dTexture_Red.o" "red_ramp.uv";
connectAttr "place2dTexture_Red.ofs" "red_ramp.fs";
connectAttr "shadowMatteAmbientOcclusion.out" "shadowLayer_aiShadowMatte.background_color"
		;
connectAttr "shadowLayer_aiShadowMatte.out" "shadowLayer_aiShadowMatteSG.ss";
connectAttr "shadowCatcherShape.iog" "shadowLayer_aiShadowMatteSG.dsm" -na;
connectAttr "shadowLayer_aiShadowMatteSG.msg" "materialInfo1.sg";
connectAttr "shadowLayer_aiShadowMatte.msg" "materialInfo1.m";
connectAttr "shadowLayer_aiShadowMatte.msg" "materialInfo1.t" -na;
connectAttr "creature_adult.msg" "renderSetup.frl";
connectAttr "shadow.msg" "renderSetup.lrl";
connectAttr "rs_creature_adult.msg" "creature_adult.lrl";
connectAttr "renderSetup.lit" "creature_adult.pls";
connectAttr "creature_adultCollection.msg" "creature_adult.cl";
connectAttr "setGeo_matte.msg" "creature_adult.ch";
connectAttr "renderLayerManager.rlmi[1]" "rs_creature_adult.rlid";
connectAttr "rs_shadow.msg" "shadow.lrl";
connectAttr "creature_adult.nxt" "shadow.prv";
connectAttr "renderSetup.lit" "shadow.pls";
connectAttr "RenderSettingsCollection.msg" "shadow.cl";
connectAttr "shadowColourFill.msg" "shadow.ch";
connectAttr "renderLayerManager.rlmi[2]" "rs_shadow.rlid";
connectAttr "collection1Selector.c" "catcher.sel";
connectAttr "shadow.lit" "catcher.pls";
connectAttr "shadow.nic" "catcher.pic";
connectAttr "RenderSettingsCollection.nxt" "catcher.prv";
connectAttr "collection2Selector.c" "caster.sel";
connectAttr "catcher.nxt" "caster.prv";
connectAttr "shadow.lit" "caster.pls";
connectAttr "shadow.nic" "caster.pic";
connectAttr "primaryVisibility.msg" "caster.cl";
connectAttr "primaryVisibility.msg" "caster.ch";
connectAttr "collection3Selector.c" "AOVoverrides.sel";
connectAttr "caster.nxt" "AOVoverrides.prv";
connectAttr "shadow.lit" "AOVoverrides.pls";
connectAttr "shadow.nic" "AOVoverrides.pic";
connectAttr "enabled.msg" "AOVoverrides.cl";
connectAttr "enabled.msg" "AOVoverrides.ch";
connectAttr "AOVoverrides.lit" "enabled.pls";
connectAttr "AOVoverrides.en" "enabled.pen";
connectAttr "collection4Selector.c" "creature_adultCollection.sel";
connectAttr "creature_adult.lit" "creature_adultCollection.pls";
connectAttr "creature_adult.nic" "creature_adultCollection.pic";
connectAttr "caster.lit" "primaryVisibility.pls";
connectAttr "caster.en" "primaryVisibility.pen";
connectAttr "RenderSettingsCollectionSelector.c" "RenderSettingsCollection.sel";
connectAttr "shadow.lit" "RenderSettingsCollection.pls";
connectAttr "shadow.nic" "RenderSettingsCollection.pic";
connectAttr "ignoreTextures.msg" "RenderSettingsCollection.cl";
connectAttr "GIVolumeSamples.msg" "RenderSettingsCollection.ch";
connectAttr "RenderSettingsCollection.lit" "ignoreTextures.pls";
connectAttr "RenderSettingsCollection.en" "ignoreTextures.pen";
connectAttr "ignoreTextures.nxt" "ignoreDisplacement.prv";
connectAttr "RenderSettingsCollection.lit" "ignoreDisplacement.pls";
connectAttr "RenderSettingsCollection.en" "ignoreDisplacement.pen";
connectAttr "collection5Selector.c" "setGeo_matte.sel";
connectAttr "creature_adultCollection.nxt" "setGeo_matte.prv";
connectAttr "creature_adult.lit" "setGeo_matte.pls";
connectAttr "creature_adult.nic" "setGeo_matte.pic";
connectAttr "setGeo_shapes.msg" "setGeo_matte.cl";
connectAttr "setGeo_shapes.msg" "setGeo_matte.ch";
connectAttr "setGeo_shapes.lit" "aiMatte.pls";
connectAttr "setGeo_shapes.en" "aiMatte.pen";
connectAttr "setGeo_shapesSelector.c" "setGeo_shapes.sel";
connectAttr "setGeo_matte.lit" "setGeo_shapes.pls";
connectAttr "setGeo_matte.en" "setGeo_shapes.pen";
connectAttr "creature_adult.nic" "setGeo_shapes.pic";
connectAttr "aiMatte.msg" "setGeo_shapes.cl";
connectAttr "aiMatte.msg" "setGeo_shapes.ch";
connectAttr "collection5Selector.out" "setGeo_shapesSelector.in";
connectAttr "collection6Selector.c" "shadowColourKey.sel";
connectAttr "AOVoverrides.nxt" "shadowColourKey.prv";
connectAttr "shadow.lit" "shadowColourKey.pls";
connectAttr "shadow.nic" "shadowColourKey.pic";
connectAttr "shadowColor.msg" "shadowColourKey.cl";
connectAttr "shadowColor.msg" "shadowColourKey.ch";
connectAttr "collection7Selector.c" "shadowColourRim.sel";
connectAttr "shadowColourKey.nxt" "shadowColourRim.prv";
connectAttr "shadow.lit" "shadowColourRim.pls";
connectAttr "shadow.nic" "shadowColourRim.pic";
connectAttr "shadowColor1.msg" "shadowColourRim.cl";
connectAttr "intensity.msg" "shadowColourRim.ch";
connectAttr "collection8Selector.c" "shadowColourFill.sel";
connectAttr "shadowColourRim.nxt" "shadowColourFill.prv";
connectAttr "shadow.lit" "shadowColourFill.pls";
connectAttr "shadow.nic" "shadowColourFill.pic";
connectAttr "shadowColor2.msg" "shadowColourFill.cl";
connectAttr "shadowColor2.msg" "shadowColourFill.ch";
connectAttr "shadowColourKey.lit" "shadowColor.pls";
connectAttr "shadowColourKey.en" "shadowColor.pen";
connectAttr "shadowColourRim.lit" "shadowColor1.pls";
connectAttr "shadowColourRim.en" "shadowColor1.pen";
connectAttr "shadowColourFill.lit" "shadowColor2.pls";
connectAttr "shadowColourFill.en" "shadowColor2.pen";
connectAttr "ignoreDisplacement.nxt" "maxSubdivisions.prv";
connectAttr "RenderSettingsCollection.lit" "maxSubdivisions.pls";
connectAttr "RenderSettingsCollection.en" "maxSubdivisions.pen";
connectAttr "maxSubdivisions.nxt" "AASamples.prv";
connectAttr "RenderSettingsCollection.lit" "AASamples.pls";
connectAttr "RenderSettingsCollection.en" "AASamples.pen";
connectAttr "AASamples.nxt" "GIDiffuseSamples.prv";
connectAttr "RenderSettingsCollection.lit" "GIDiffuseSamples.pls";
connectAttr "RenderSettingsCollection.en" "GIDiffuseSamples.pen";
connectAttr "GIDiffuseSamples.nxt" "GISpecularSamples.prv";
connectAttr "RenderSettingsCollection.lit" "GISpecularSamples.pls";
connectAttr "RenderSettingsCollection.en" "GISpecularSamples.pen";
connectAttr "GISpecularSamples.nxt" "GITransmissionSamples.prv";
connectAttr "RenderSettingsCollection.lit" "GITransmissionSamples.pls";
connectAttr "RenderSettingsCollection.en" "GITransmissionSamples.pen";
connectAttr "GITransmissionSamples.nxt" "GISssSamples.prv";
connectAttr "RenderSettingsCollection.lit" "GISssSamples.pls";
connectAttr "RenderSettingsCollection.en" "GISssSamples.pen";
connectAttr "GISssSamples.nxt" "GIDiffuseDepth.prv";
connectAttr "RenderSettingsCollection.lit" "GIDiffuseDepth.pls";
connectAttr "RenderSettingsCollection.en" "GIDiffuseDepth.pen";
connectAttr "GIDiffuseDepth.nxt" "GISpecularDepth.prv";
connectAttr "RenderSettingsCollection.lit" "GISpecularDepth.pls";
connectAttr "RenderSettingsCollection.en" "GISpecularDepth.pen";
connectAttr "GISpecularDepth.nxt" "GIVolumeSamples.prv";
connectAttr "RenderSettingsCollection.lit" "GIVolumeSamples.pls";
connectAttr "RenderSettingsCollection.en" "GIVolumeSamples.pen";
connectAttr "backplateProjection_projection.oc" "backplateProjection.emission_color"
		;
connectAttr "backplateProjection_projection.oc" "backplateProjection.base_color"
		;
connectAttr "backplateProjection.out" "backplateProjection_SG.ss";
connectAttr "backplateProjection_SG.msg" "materialInfo2.sg";
connectAttr "backplateProjection.msg" "materialInfo2.m";
connectAttr "backplateProjection.msg" "materialInfo2.t" -na;
connectAttr "backplateProjection_place3dTexture.wim" "backplateProjection_projection.pm"
		;
connectAttr "backplateProjection_file.oc" "backplateProjection_projection.im";
connectAttr ":perspShape.msg" "backplateProjection_projection.lc";
connectAttr ":defaultColorMgtGlobals.cme" "backplateProjection_file.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "backplateProjection_file.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "backplateProjection_file.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "backplateProjection_file.ws";
connectAttr "backplateProjection_place2dTexture.c" "backplateProjection_file.c";
connectAttr "backplateProjection_place2dTexture.tf" "backplateProjection_file.tf"
		;
connectAttr "backplateProjection_place2dTexture.rf" "backplateProjection_file.rf"
		;
connectAttr "backplateProjection_place2dTexture.mu" "backplateProjection_file.mu"
		;
connectAttr "backplateProjection_place2dTexture.mv" "backplateProjection_file.mv"
		;
connectAttr "backplateProjection_place2dTexture.s" "backplateProjection_file.s";
connectAttr "backplateProjection_place2dTexture.wu" "backplateProjection_file.wu"
		;
connectAttr "backplateProjection_place2dTexture.wv" "backplateProjection_file.wv"
		;
connectAttr "backplateProjection_place2dTexture.re" "backplateProjection_file.re"
		;
connectAttr "backplateProjection_place2dTexture.of" "backplateProjection_file.of"
		;
connectAttr "backplateProjection_place2dTexture.r" "backplateProjection_file.ro"
		;
connectAttr "backplateProjection_place2dTexture.n" "backplateProjection_file.n";
connectAttr "backplateProjection_place2dTexture.vt1" "backplateProjection_file.vt1"
		;
connectAttr "backplateProjection_place2dTexture.vt2" "backplateProjection_file.vt2"
		;
connectAttr "backplateProjection_place2dTexture.vt3" "backplateProjection_file.vt3"
		;
connectAttr "backplateProjection_place2dTexture.vc1" "backplateProjection_file.vc1"
		;
connectAttr "backplateProjection_place2dTexture.o" "backplateProjection_file.uv"
		;
connectAttr "backplateProjection_place2dTexture.ofs" "backplateProjection_file.fs"
		;
connectAttr "shadowMatteAmbientOcclusion.out" "aiAmbientOcclusion1SG.ss";
connectAttr "aiAmbientOcclusion1SG.msg" "materialInfo3.sg";
connectAttr "shadowMatteAmbientOcclusion.msg" "materialInfo3.m";
connectAttr "shadowMatteAmbientOcclusion.msg" "materialInfo3.t" -na;
connectAttr "shadowColor1.nxt" "intensity.prv";
connectAttr "shadowColourRim.lit" "intensity.pls";
connectAttr "shadowColourRim.en" "intensity.pen";
connectAttr "shadowLayer_aiShadowMatteSG.msg" "hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[0].dn"
		;
connectAttr "shadowLayer_aiShadowMatte.msg" "hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[1].dn"
		;
connectAttr "aiAmbientOcclusion1SG.msg" "hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[2].dn"
		;
connectAttr "shadowMatteAmbientOcclusion.msg" "hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[3].dn"
		;
connectAttr "shadowLayer_aiShadowMatteSG.pa" ":renderPartition.st" -na;
connectAttr "backplateProjection_SG.pa" ":renderPartition.st" -na;
connectAttr "aiAmbientOcclusion1SG.pa" ":renderPartition.st" -na;
connectAttr "shadowLayer_aiShadowMatte.msg" ":defaultShaderList1.s" -na;
connectAttr "backplateProjection.msg" ":defaultShaderList1.s" -na;
connectAttr "shadowMatteAmbientOcclusion.msg" ":defaultShaderList1.s" -na;
connectAttr "place2dTexture_Green.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "place2dTexture_Red.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "_aov_cryptomatte.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "backplateProjection_place3dTexture.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "backplateProjection_place2dTexture.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
connectAttr "rs_creature_adult.msg" ":defaultRenderingList1.r" -na;
connectAttr "rs_shadow.msg" ":defaultRenderingList1.r" -na;
connectAttr "green_ramp.msg" ":defaultTextureList1.tx" -na;
connectAttr "red_ramp.msg" ":defaultTextureList1.tx" -na;
connectAttr "ambientOcclusion.msg" ":defaultTextureList1.tx" -na;
connectAttr "backplateProjection_projection.msg" ":defaultTextureList1.tx" -na;
connectAttr "backplateProjection_file.msg" ":defaultTextureList1.tx" -na;
// End of arnoldSettings_LGT_base_v032.ma
