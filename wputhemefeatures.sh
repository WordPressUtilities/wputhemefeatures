#!/bin/bash

WPUThemeFeatures(){

local _VERSION='0.13.2';
cat <<EOF

###################################
## WPU Theme Features v ${_VERSION}
###################################

EOF

local _SOURCEDIR="$( dirname "${BASH_SOURCE[0]}" )/";
local _CURRENT_DIR="$( pwd )/";
local _LANGDIR="lang";
local _SCRIPTDIR="assets/js/libs";
local _USE_GIT_SUBMODULES="y";


if [[ -f "${_SOURCEDIR}wputhemefeatures-local.sh" ]];then
    . "${_SOURCEDIR}wputhemefeatures-local.sh";
fi;

## Init Sources
if [[ ! -f "${_SOURCEDIR}sources/JavaScriptUtilities/README.md" || ! -f "${_SOURCEDIR}sources/BashUtilities/README.md" ]];then
    (cd "${_SOURCEDIR}" && git submodule update --init --recursive);
fi;

# Load BashUtilities
. "${_SOURCEDIR}sources/BashUtilities/modules/files.sh";
. "${_SOURCEDIR}sources/BashUtilities/modules/messages.sh";
. "${_SOURCEDIR}sources/BashUtilities/modules/texttransform.sh";
. "${_SOURCEDIR}sources/BashUtilities/modules/values.sh";
. "${_SOURCEDIR}sources/BashUtilities/modules/git.sh";

## Autocomplete
. "${_SOURCEDIR}inc/autocomplete.sh";

## Find WordPress
. "${_SOURCEDIR}inc/find-wordpress.sh";

local _THEME_NAME=${PWD##*/};
local _FUNCTIONS_PHP="${_CURRENT_DIR}functions.php";
local _SCSSPLUGIN="${_CURRENT_DIR}src/scss/${_THEME_NAME}/_plugins.scss";

# Route to a script
case "$1" in
    "script" | "lang" | "src")
        . "${_SOURCEDIR}bin/${1}.sh" "${2}" "${3}" "${4}" "${5}";
    ;;
    "help" | "" | * )
        . "${_SOURCEDIR}bin/help.sh";
    ;;
esac

}

WPUThemeFeatures "$@";

