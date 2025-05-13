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
bashutilities_sed "s/mythemename/${_THEME_NAME}/g" "${_LANG_FILE}";
echo "# The lang file has been successfully added!"

###################################
## Loading text-domain
###################################

# Load script
_functions_add=$(cat <<EOF

###################################
## Language
###################################

add_action('after_setup_theme', function () {
    load_theme_textdomain('${_THEME_NAME}', get_stylesheet_directory() . '/lang');
});

EOF
);

## Check lang registration
if ! grep -q 'load_theme_textdomain' "${_FUNCTIONS_PHP}" && ! grep -q 'load_theme_textdomain' "${_BASE_FUNCTIONS_PHP}"; then
    echo "# Registering lang in ${_FUNCTIONS_PHP}"
    echo "${_functions_add}" >> "${_FUNCTIONS_PHP}";
fi
