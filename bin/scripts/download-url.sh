#!/bin/bash

echo "# Script : Custom";

# Test variable
if [[ "${1}" == '' ]];then
    echo '- No script URL available';
    return 0;
fi;

# Test if URL is valid
_reply=$(curl -Is "${1}" | head -n 1 );
if [[ "${_reply}" == '' ]];then
    echo '- Invalid URL';
    return 0;
fi;

# Test if already installed
_filename="${1##*/}"
if [[ -f "${_CURRENT_DIR}${_SCRIPTDIR}/${_filename}" ]];then
    echo '- Already installed !'
    return 0;
fi;

# Download file
cd "${_CURRENT_DIR}${_SCRIPTDIR}";
curl -O "${1}" --silent --fail;

# Back to the main folder
cd "${_CURRENT_DIR}";

# Check if file exists
if [[ ! -f "${_SCRIPTDIR}/${_filename}" ]];then
    echo '- The file could not be downloaded.'
    return 0;
fi;

# Build script ID
_script_id="${_filename/\.min.js/}";
_script_id="${_script_id/\.js/}";
_script_id=$(bashutilities_string_to_slug "${_script_id}");

# Load script
_functions_add=$(cat <<EOF

###################################
## ${_script_id}
###################################

add_action('wp_enqueue_scripts', function () {
    wp_enqueue_script('${_THEME_NAME}-${_script_id}', get_stylesheet_directory_uri() . '/${_SCRIPTDIR}/${_filename}}', array('jquery'), '1.0.0', true);
});

EOF
);

echo "${_functions_add}" >> "${_FUNCTIONS_PHP}";

echo "- Script '${_script_id}' has been installed.";
