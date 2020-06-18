#!/bin/bash

echo "# INSTALL SCRIPT";

## Check directories
if [[ ! -d "${_SCRIPTDIR}" ]];then
    mkdir -p "${_SCRIPTDIR}";
fi;

case "$1" in
    "lazy" | "lazy-loading")
        . "${_SOURCEDIR}bin/scripts/lazy-loading.sh" "${2}";
    ;;
    "hybrid" | "hybridscreens" | "hybrid-screens")
        . "${_SOURCEDIR}bin/scripts/hybrid-screens.sh" "${2}";
    ;;
    "parallax")
        . "${_SOURCEDIR}bin/scripts/parallax.sh" "${2}";
    ;;
    "help" | "" | * )
        . "${_SOURCEDIR}bin/help.sh";
    ;;
esac
