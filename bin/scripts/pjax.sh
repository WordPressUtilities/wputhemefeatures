#!/bin/bash

echo "# Script : PJAX";

# Go to folder
cd "${_CURRENT_DIR}${_SCRIPTDIR}";

# Add as a submodule
bashutilities_submodule_or_install "https://github.com/JavaScriptUtilities/vanillaPJAX.git" "${_USE_GIT_SUBMODULES}";

# Back to the main folder
cd "${_CURRENT_DIR}";

# Load script
_functions_add=$(cat <<EOF

###################################
## Pushstate/AJAX
###################################

add_action('wp_enqueue_scripts', function () {
    wp_enqueue_script('vanilla-pjax', get_stylesheet_directory_uri() . '/${_SCRIPTDIR}/vanillaPJAX/js/vanilla-pjax.min.js', array('jquery'), '1.0.0', true);
    wp_enqueue_script('vanilla-pjax-init', get_stylesheet_directory_uri() . '/${_SCRIPTDIR}/vanilla-pjax-init.js', array('jquery','vanilla-pjax'), '1.0.0', true);
});

EOF
);

echo "${_functions_add}" >> "${_FUNCTIONS_PHP}";

# Load script
_js_init_add=$(cat <<EOF

jQuery(document).ready(function($) {
    var \$jQBody = jQuery('body');
    new vanillaPJAX({
        targetContainer: document.body.querySelector('.main-content'),
        ajaxParam: 'ajax',
        callbackBeforeAJAX: function(newUrl, content) {
            \$jQBody.trigger('wpu-ajax-loading');
        },
        callbackAfterLoad: function(newUrl, content) {
            var \$values = document.getElementById('js-values');
            document.title = \$values.getAttribute('data-page_title');
            document.body.className = \$values.getAttribute('data-body_class');
            \$jQBody.trigger('wpu-ajax-ready');
        },
    });
    \$jQBody.trigger('wpu-ajax-ready');
});

EOF
);

echo "${_js_init_add}" >> "${_CURRENT_DIR}${_SCRIPTDIR}/vanilla-pjax-init.js";
