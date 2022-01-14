jQuery(document).ready(function($) {
    var $jQBody = jQuery('body'),
        $targetContainer = document.body.querySelector('#content'),
        animDuration = 500;
    var _self = new vanillaPJAX({
        targetContainer: $targetContainer,
        ajaxParam: 'ajax',
        callbackTimeoutBeforeLoadContent: function(duration, newUrl, content) {
            return animDuration;
        },
        callbackBeforeAJAX: function(newUrl, content) {
            $jQBody.trigger('wpu-ajax-loading');
        },
        callbackAfterLoad: function(newUrl, content) {
            /* Load $values */
            var $values = document.getElementById('js-values');
            document.title = $values.getAttribute('data-page_title');
            document.body.className = $values.getAttribute('data-body_class');

            /* Find JS */
            var innerJs = $targetContainer.querySelectorAll('script');
            innerJs.forEach(function(userItem) {
                eval(userItem.innerText);
            });

            /* Page is ready */
            $jQBody.trigger('wpu-ajax-ready');

            /* Trigger special JS */
            if(typeof wpulivesearch_trigger_datas_ready == 'function'){
                wpulivesearch_trigger_datas_ready();
            }

            /* Refresh clickables */
            _self.setClickables($targetContainer);

        },
    });
    $jQBody.trigger('wpu-ajax-ready');

    /* Refresh content */
    window.addEventListener('wpulivesearch_updated_content', function() {
        window.dispatchEvent(new Event('vanilla-pjax-refresh'));
    });

});
