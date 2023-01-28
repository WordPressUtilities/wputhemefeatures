#!/bin/bash

_protection_file="${_CURRENT_DIR}/inc/.htaccess";
if [[ ! -f "${_protection_file}" ]];then
    echo "- Creating Protection file";
    echo 'deny from all' > "${_protection_file}";
    cat "${_protection_file}";
    echo "${_protection_file}";
fi;

for _new_file in {"inc/helpers.php","inc/parent-theme.php","inc/scripts.php","inc/social.php","inc/styles.php"}; do
    if [[ ! -f "${_CURRENT_DIR}/${_new_file}" ]];then
        echo "- Creating ${_new_file}";
        # Create new file
        touch "${_new_file}";
        _include_file="include dirname(__FILE__) . '/${_new_file}';";

        # Include it
        awk -v varnewfile="${_include_file}" 'NR==3{print varnewfile}1' "${_FUNCTIONS_PHP}" > tmpwputh && mv tmpwputh "${_FUNCTIONS_PHP}"
    fi;
done

