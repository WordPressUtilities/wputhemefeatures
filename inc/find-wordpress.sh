#!/bin/bash

## Check if dir is correct
if [[ ! -f "style.css" || ! -f "functions.php" ]];then

    if ! [ -x "$(command -v wp)" ]; then
      echo $(bashutilities_message '# This is not a WordPress theme folder !' 'error');
      return 0;
    fi

    echo '# Looking for a WordPress theme folder. Please wait.'
    echo $(bashutilities_message '# Looking for a WordPress theme folder. Please wait.' 'notice');

    _THEME_PATH=$(wp theme path);
    _THEME_NAME=$(wp theme list --status=active --format=csv --field=name);
    _THEME_DIR="${_THEME_PATH}/${_THEME_NAME}";
    if [[ ! -d "${_THEME_DIR}" || ! -f "${_THEME_DIR}/functions.php" ]];then
        echo $(bashutilities_message '# This is not a WordPress theme folder!' 'error');
        return 0;
    fi;

    _CURRENT_DIR="${_THEME_DIR}";
    cd "${_CURRENT_DIR}";
    echo $(bashutilities_message '# A WordPress theme was found. Directory has been changed.' 'success');
fi;

