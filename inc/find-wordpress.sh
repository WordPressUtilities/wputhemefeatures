#!/bin/bash

## Check if dir is correct
if [[ ! -f "style.css" || ! -f "functions.php" ]];then

    if ! [ -x "$(command -v wp)" ]; then
      echo "# This is not a WordPress theme folder !"
      return 0;
    fi

    echo '# Looking for a WordPress theme folder. Please wait.'

    _THEME_PATH=$(wp theme path);
    _THEME_NAME=$(wp theme list --status=active --format=csv --field=name);
    if [[ ! -d "${_THEME_PATH}/${_THEME_NAME}" ]];then
        echo "# This is not a WordPress theme folder!"
        return 0;
    fi;

    _CURRENT_DIR="${_THEME_PATH}/${_THEME_NAME}";
    cd "${_CURRENT_DIR}";
    echo "# A WordPress theme was found. Directory has been changed."
fi;

