$(document).ready(function () {
    var url = window.location.href;
    var src1 = '../../resources/images/page_banner_1.jpg';
    var src2 = '../../resources/images/page_banner_2.jpg';
    var src3 = '../../resources/images/page_banner_3.jpg';
    var src4 = '../../resources/images/page_banner_4.jpg';
    var src5 = '../../resources/images/page_banner_5.jpg';
    var src6 = '../../resources/images/page_banner_6.jpg';

    if (url.indexOf('center') != -1) {
        $('.page-banner').css('background-image', 'url(' + src1 + ')');
    } else if (url.indexOf('move_in') != -1) {
        $('.page-banner').css('background-image', 'url(' + src2 + ')');
    } else if (url.indexOf('announce') != -1) {
        $('.page-banner').css('background-image', 'url(' + src3 + ')');
    } else if (url.indexOf('customer_center') != -1) {
        $('.page-banner').css('background-image', 'url(' + src4 + ')');
    } else if (url.indexOf('faq') != -1) {
        $('.page-banner').css('background-image', 'url(' + src5 + ')');
    } else if (url.indexOf('facility') != -1) {
        $('.page-banner').css('background-image', 'url(' + src6 + ')');
    }
});