#!/bin/bash

echo "# Script : PJAX";

if [[ -f "${_CURRENT_DIR}${_SCRIPTDIR}/vanilla-pjax-init.js" ]];then
    echo '- Already installed !'
    return 0;
fi;

# Go to folder
cd "${_CURRENT_DIR}${_SCRIPTDIR}";

# Add as a submodule
bashutilities_submodule_or_install "https://github.com/JavaScriptUtilities/vanillaPJAX.git" "${_USE_GIT_SUBMODULES}";

# Back to the main folder
cd "${_CURRENT_DIR}";

_SCRIPT_VERSION=$(wputhemefeatures_get_version "${_CURRENT_DIR}${_SCRIPTDIR}/vanillaPJAX");

# Load script
_functions_add=$(cat <<EOF

###################################
## Pushstate/AJAX
###################################

add_action('wp_enqueue_scripts', function () {
    \$script_version = '${_SCRIPT_VERSION}';
    wp_enqueue_script('vanilla-pjax', get_stylesheet_directory_uri() . '/${_SCRIPTDIR}/vanillaPJAX/js/vanilla-pjax.min.js', array('jquery'), \$script_version, true);
    wp_enqueue_script('vanilla-pjax-init', get_stylesheet_directory_uri() . '/${_SCRIPTDIR}/vanilla-pjax-init.js', array('jquery','vanilla-pjax'), \$script_version, true);
});

add_action('wp_footer', function () {
    echo '<div class="page-cover"></div>';
}, 99);

EOF
);

echo "${_functions_add}" >> "${_FUNCTIONS_PHP}";

# Inject JS
cat "${_SOURCEDIR}sources/scripts/pjax/init.js" >> "${_CURRENT_DIR}${_SCRIPTDIR}/vanilla-pjax-init.js";

# Inject SCSS
if [[ -f "${_SCSSPLUGIN}" ]];then
    cat "${_SOURCEDIR}sources/scripts/pjax/source.scss" >> "${_SCSSPLUGIN}";
fi;

