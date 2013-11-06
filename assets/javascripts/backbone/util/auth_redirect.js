define(
    [
        'jquery',
        'jquery.cookie'
    ],
    function ($) {
        var redirectToLogin = function () {
            var locationhref = "/login";
            if (location.hash && location.hash.length > 0) {
                locationhref += "?hash=" + location.hash.substring(1);
            }
            location.href = locationhref;
        };

        var $doc = $(document);
        $doc.ajaxSend(function (event, xhr) {
            var authToken = $.cookie('access_token');
            if (authToken) {
                xhr.setRequestHeader("Authorization", "Bearer " + authToken);
            }
        });

        $doc.ajaxError(function (event, xhr) {
            if (xhr.status == 401)
                redirectToLogin();
        });
    });
