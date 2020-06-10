#!/bin/bash


WPUThemeFeatures(){

local _VERSION='0.1.0';
cat <<EOF

###################################
## WPU Theme Features v ${_VERSION}
###################################

EOF

local _SOURCEDIR="$( dirname "${BASH_SOURCE[0]}" )/";
local _CURRENT_DIR="$( pwd )/";

## Check if dir is correct
if [[ ! -f "style.css" ||  ! -f "functions.php" ]];then
    echo "# This is not a WordPress theme folder !"
    return 0;
fi;


case "$1" in
    "script")
        . "${_SOURCEDIR}bin/script.sh" "${2}";
    ;;
    "help" | "" | * )
        . "${_SOURCEDIR}bin/help.sh";
    ;;
esac


}

WPUThemeFeatures "$@";

