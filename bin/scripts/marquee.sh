#!/bin/bash

echo "# Script : jQMarquee";

if [[ -f "${_CURRENT_DIR}${_SCRIPTDIR}/jQMarquee/js/jq-marquee.min.js" ]];then
    echo '- Already installed !'
    return 0;
fi;

# Go to folder
cd "${_CURRENT_DIR}${_SCRIPTDIR}";

# Add as a submodule
bashutilities_submodule_or_install "https://github.com/JavaScriptUtilities/jQMarquee.git" "${_USE_GIT_SUBMODULES}";

# Back to the main folder
cd "${_CURRENT_DIR}";

_SCRIPT_VERSION=$(wputhemefeatures_get_version "${_CURRENT_DIR}${_SCRIPTDIR}/jQMarquee");

# Load script
_functions_add=$(cat <<EOF

###################################
## jQMarquee
###################################

add_action('wp_enqueue_scripts', function () {
    \$script_version = '${_SCRIPT_VERSION}';
    wp_enqueue_script('jq-marquee', get_stylesheet_directory_uri() . '/${_SCRIPTDIR}/jQMarquee/js/jq-marquee.min.js', array(), \$script_version, true);
});

EOF
);

echo "${_functions_add}" >> "${_FUNCTIONS_PHP}";
