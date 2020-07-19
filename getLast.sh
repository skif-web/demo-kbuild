#!/bin/bash

# script running script
workDir=`dirname "$(readlink -f "$0")"`

# future command to run
cmdline="last "

# read config
source $workDir/.config || { echo "ERROR! Unable to read config"; exit 1; }

# if select
if [ "x$CONFIG_SHOW_ONLY_CURRENT_USER" == "xy" ]; then
    currentUser=`whoami`
    cmdline="$cmdline $currentUser"
fi

# now run command. If destination is file - ise redirect
if [ "x$CONFIG_SELECT_DESTINATION_FILE" == "xy" ]; then
    $cmdline > $CONFIG_SELECT_DESTINATION_FILE_FILENAME
else
    $cmdline
fi

