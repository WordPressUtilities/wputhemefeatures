#!/bin/bash

echo "# INSTALL SCRIPT";

## Check directories
if [[ ! -d "assets" ]];then
    mkdir "assets";
fi;
if [[ ! -d "assets/js" ]];then
    mkdir "assets/js";
fi;
if [[ ! -d "assets/js/libs" ]];then
    mkdir "assets/js/libs";
fi;

case "$1" in
    "lazy" | "lazy-loading")
        . "${_SOURCEDIR}bin/scripts/lazy-loading.sh" "${2}";
    ;;
    "hybrid" | "hybridscreens" | "hybrid-screens")
        . "${_SOURCEDIR}bin/scripts/hybrid-screens.sh" "${2}";
    ;;
    "help" | "" | * )
        . "${_SOURCEDIR}bin/help.sh";
    ;;
esac
