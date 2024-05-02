#!/bin/bash

###################################
## Ensure inc dir exists
###################################

if [[ ! -d "inc" ]];then
    mkdir "inc";
fi;

###################################
## Protection
###################################

_has_protection="1";
for _dir in {"src","inc","tpl","lang"}; do
    _protection_dir="${_CURRENT_DIR}/${_dir}";
    _protection_file="${_protection_dir}/.htaccess";
    _protection_index="${_protection_dir}/index.php";
    if [[ -d "${_protection_dir}" ]];then
        if [[ ! -f "${_protection_file}" ]];then
            _has_protection="0";
            echo "- Protecting dir ${_dir}";
            echo 'deny from all' > "${_protection_file}";
        fi;
        if [[ ! -f "${_protection_index}" ]];then
            _has_protection="0";
            echo "- Protecting index dir ${_dir}";
            echo '<?php /* Silence */' > "${_protection_index}";
        fi;
    fi;
done;
if [[ "${_has_protection}" == '1' ]];then
    echo "- All directories where already protected."
fi;

###################################
## Functions files
###################################

_has_function_file="1";
for _new_file in {"inc/helpers.php","inc/parent-theme.php","inc/scripts.php","inc/social.php","inc/styles.php","inc/styles.php"}; do
    if [[ ! -f "${_CURRENT_DIR}/${_new_file}" ]];then
        echo "- Creating ${_new_file}";
        _has_function_file="";

        # Create new file
        echo '<?php' > "${_new_file}";
        _include_file="require __DIR__ . '/${_new_file}';";

        # Include it
        awk -v varnewfile="${_include_file}" 'NR==3{print varnewfile}1' "${_FUNCTIONS_PHP}" > tmpwputh && mv tmpwputh "${_FUNCTIONS_PHP}"
    fi;
done
if [[ "${_has_function_file}" == '1' ]];then
    echo "- All function files where already created."
fi;

###################################
## JS Files
###################################

_has_js_file="1";
for _new_file in {"theme.json","package.json"}; do
    if [[ ! -f "${_CURRENT_DIR}/${_new_file}" ]];then
        echo "- Creating ${_new_file}";
        _has_js_file="";
        # Create new file
        echo '{}' > "${_new_file}";
    fi;
done
if [[ "${_has_js_file}" == '1' ]];then
    echo "- All JS files where already created."
fi;

###################################
## Language files
###################################

function wputhemefeatures_upgrade_language_files() {
    local _LANGDIR="${_CURRENT_DIR}lang/";
    local _LANGDIR_INC="${_CURRENT_DIR}inc/lang/";
    if [[ -d "${_LANGDIR_INC}" ]]; then
        _LANGDIR="${_LANGDIR_INC}";
    fi
    if [[ ! -d "${_LANGDIR}" ]]; then
        echo "- No lang dir found.";
        return 0;
    fi
    rm "${_LANGDIR}"*.l10n.php;
    wp i18n make-php "${_LANGDIR}";
    echo "- Language files updated.";
}
wputhemefeatures_upgrade_language_files;
