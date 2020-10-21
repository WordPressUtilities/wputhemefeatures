#!/bin/bash

echo "# INSTALL SCRIPT";

## Check directories
if [[ ! -d "${_SCRIPTDIR}" ]];then
    mkdir -p "${_SCRIPTDIR}";
fi;

case "$1" in
    "pjax")
        . "${_SOURCEDIR}bin/scripts/pjax.sh" "${2}";
    ;;
    "lazy" | "lazy-loading")
        . "${_SOURCEDIR}bin/scripts/lazy-loading.sh" "${2}";
    ;;
    "moveblocks" | "move-blocks")
        . "${_SOURCEDIR}bin/scripts/move-blocks.sh" "${2}";
    ;;
    "hybrid" | "hybridscreens" | "hybrid-screens")
        . "${_SOURCEDIR}bin/scripts/hybrid-screens.sh" "${2}";
    ;;
    "scrollanims" | "scroll-anims")
        . "${_SOURCEDIR}bin/scripts/scroll-anims.sh" "${2}";
    ;;
    "scrolllevel" | "scroll-level")
        . "${_SOURCEDIR}bin/scripts/scroll-level.sh" "${2}";
    ;;
    "parallax")
        . "${_SOURCEDIR}bin/scripts/parallax.sh" "${2}";
    ;;
    "help" | "" | * )
        . "${_SOURCEDIR}bin/help.sh";
    ;;
esac
