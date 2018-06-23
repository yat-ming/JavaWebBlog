$(function () {
    (function () {
        $('.pure-menu-link').attr('ishide', true);
        $('.pure-menu-link').click(function () {
            if ($(this).attr('ishide') == 'true') {
                $(this).next().slideDown();
                $(this).attr('ishide', false);
            } else {
                $(this).next().slideUp();
                $(this).attr('ishide', true);
            }
        });
    })();
});
