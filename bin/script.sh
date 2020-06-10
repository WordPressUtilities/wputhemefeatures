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
    "lazy-loading" | "lazy")
        . "${_SOURCEDIR}scripts/lazy-loading.sh" "${2}";
    ;;
    "help" | "" | * )
        . "${_SOURCEDIR}bin/help.sh";
    ;;
esac
