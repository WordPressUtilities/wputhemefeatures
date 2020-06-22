#!/bin/bash

WPUThemeFeatures(){

local _VERSION='0.4.0';
cat <<EOF

###################################
## WPU Theme Features v ${_VERSION}
###################################

EOF

local _SOURCEDIR="$( dirname "${BASH_SOURCE[0]}" )/";
local _CURRENT_DIR="$( pwd )/";
local _SCRIPTDIR="assets/js/libs";
local _USE_GIT_SUBMODULES="1";


if [[ -f "${_SOURCEDIR}wputhemefeatures-local.sh" ]];then
    . "${_SOURCEDIR}wputhemefeatures-local.sh";
fi;

## Init Sources
if [[ ! -f "${_SOURCEDIR}sources/JavaScriptUtilities/README.md" || ! -f "${_SOURCEDIR}sources/BashUtilities/README.md" ]];then
    (cd "${_SOURCEDIR}" && git submodule update --init --recursive);
fi;

## Find WordPress
. "${_SOURCEDIR}inc/find-wordpress.sh";

# Route to a script
case "$1" in
    "script")
        . "${_SOURCEDIR}bin/script.sh" "${2}";
    ;;
    "src")
        . "${_SOURCEDIR}bin/${1}.sh" "${2}" "${3}" "${4}" "${5}";
    ;;
    "help" | "" | * )
        . "${_SOURCEDIR}bin/help.sh";
    ;;
esac

}

WPUThemeFeatures "$@";

