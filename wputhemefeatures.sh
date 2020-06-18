#!/bin/bash

WPUThemeFeatures(){

local _VERSION='0.3.0';
cat <<EOF

###################################
## WPU Theme Features v ${_VERSION}
###################################

EOF

local _SOURCEDIR="$( dirname "${BASH_SOURCE[0]}" )/";
local _CURRENT_DIR="$( pwd )/";
local _SCRIPTDIR="assets/js/libs";

if [[ -f "${_SOURCEDIR}wputhemefeatures-local.sh" ]];then
    . "${_SOURCEDIR}wputhemefeatures-local.sh";
fi;

## Init Sources
if [[ ! -f "${_SOURCEDIR}sources/JavaScriptUtilities/README.md" ]];then
    (cd "${_SOURCEDIR}" && git submodule update --init --recursive);
fi;

## Check if dir is correct
if [[ ! -f "style.css" ||  ! -f "functions.php" ]];then
    echo "# This is not a WordPress theme folder !"
    return 0;
fi;

# Route to a script
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

