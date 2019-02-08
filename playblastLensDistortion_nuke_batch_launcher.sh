#!/bin/bash

echo "POST PARAMS from SG: "$*
echo $0
echo $1
echo $2

if [ -z "$NUKE_VERSION" ]; then
    export NUKE_VERSION="11.2v4"
fi

if [ -z "$NUKE_PRESET" ]; then
    export NUKE_PRESET="global"
fi

nuke_mode_flag="$2"

echo "============================================================="
echo "Launch Nuke$NUKE_VERSION with preset: $NUKE_PRESET"
echo "============================================================="

echo "PIPELINE_DEV mode is: $PIPELINE_DEV"
echo "PIPELINE_DEV_ROOT is: $PIPELINE_DEV_ROOT"

if [ $PIPELINE_DEV = "true" ] && [ $PIPELINE_DEV_ROOT ]; then
    NUKE_PIPELINE_ROOT_PATH="$PIPELINE_DEV_ROOT/nuke"
else
    NUKE_PIPELINE_ROOT_PATH="/mnt/pipeline/ATK_PIPELINE/nuke"
fi
echo "NUKE_PIPELINE_ROOT_PATH is: $NUKE_PIPELINE_ROOT_PATH"

export DEADLINE_PIPELINE_PATH="$NUKE_PIPELINE_ROOT_PATH/projects/global"

if [ -z "$NUKE_PATH" ]; then
    export NUKE_PATH="$NUKE_PIPELINE_ROOT_PATH/projects/global"
fi

echo "DEADLINE_PIPELINE_PATH: $DEADLINE_PIPELINE_PATH"
echo "NUKE PATH: $NUKE_PATH"
echo "NUKE PRESET: $NUKE_PRESET"
echo "NUKE-MODE FLAG: $nuke_mode_flag"
echo "MAJOR VERSION: ${NUKE_VERSION:0:4}"


if [ $nuke_mode_flag == "--hiero" ] || [ $nuke_mode_flag == "--studio" ]; then

    if [ ! -d "$HOME/.nuke" ]; then
        mkdir -p "$HOME/.nuke"
    fi

    if [ ! -d "$HOME/.nuke/TaskPresets" ]; then
        echo "ATK-INFO: COPYING Basic Export Presets from '/mnt/pipeline/ATK_PIPELINE/hiero/hiero_nukestudio_presets/*' to '$HOME/.nuke/TaskPresets' "
        cp -R "/mnt/pipeline/ATK_PIPELINE/hiero/hiero_nukestudio_presets/TaskPresets" "$HOME/.nuke/"
    else
        echo "ATK-INFO: Basic Export Presets '$HOME/.nuke/TaskPresets' already exist, skip copying."
    fi

    if [ ! -d "$HOME/.nuke/Python" ]; then
        echo "ATK-INFO: COPYING Basic files from '/mnt/pipeline/ATK_PIPELINE/hiero/Python/*' to '$HOME/.nuke/Python' "
        cp -R "/mnt/pipeline/ATK_PIPELINE/hiero/Python/" "$HOME/.nuke/"
    else
        echo "ATK-INFO: Basic files '$HOME/.nuke/Python' already exist, skip copying."
    fi
fi

export OPTICAL_FLARES_PATH="$NUKE_PIPELINE_ROOT_PATH/projects/global/plugins/OpticalFlares_Nuke${NUKE_VERSION:0:2}.0"
echo "OPTICAL_FLARES_PATH: $OPTICAL_FLARES_PATH"

# Special Workaround for Node-Lock license files for OpticalFlares
export OPTICAL_FLARES_LICENSE_PATH="$NUKE_PIPELINE_ROOT_PATH/projects/global/plugins/licenses/OpticalFlares_Nuke${NUKE_VERSION:0:2}.0/$HOSTNAME"
echo "OPTICAL_FLARES_LICENSE_PATH: $OPTICAL_FLARES_LICENSE_PATH"

fpn="$NUKE_PIPELINE_ROOT_PATH/launcher/workstation/linux/Nuke.env"
echo "Setting environment variables in file: " $fpn
while ifS='' read -r line || [[ -n "$line" ]]; do
    export $line
    echo "$line"
done < "$fpn"

if [ -d "/opt/TheFoundry/Nuke$NUKE_VERSION" ]; then
    cd "/opt/TheFoundry/Nuke$NUKE_VERSION"
    echo "Starting Nuke from local disk..."
else
    echo "Starting Nuke from Server..."
    cd /mnt/pipeline/software/TheFoundry/Nuke/Nuke$NUKE_VERSION
fi

echo "Starting Nuke..."
./Nuke${NUKE_VERSION:0:4} $*
