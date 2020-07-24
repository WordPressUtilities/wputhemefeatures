#!/bin/bash

echo "# INSTALL LANG";

## Check directories
if [[ ! -d "${_LANGDIR}" ]];then
    mkdir "${_LANGDIR}";
fi;

## Get lang
_LANG_NAME="${1}";
if [[ -z "${1}" ]];then
    _DEFAULT_LANG='fr_FR';
    _LANG_NAME=$(bashutilities_get_user_var "- What lang do you need ?" "${_DEFAULT_LANG}");
fi;

_LANG_FILE="${_CURRENT_DIR}${_LANGDIR}/${_LANG_NAME}.po";
if [[ -f "${_LANG_FILE}" ]];then
    echo "# This file already exists!"
    return 0;
fi;

cp "${_SOURCEDIR}sources/lang.po" "${_LANG_FILE}";
bashutilities_sed "s/fr_FR/${_LANG_NAME}/g" "${_LANG_FILE}";
echo "# The lang file has been successfully added!"
