$(document).ready(function () {
    var url = window.location.href;
    $('#home').removeClass('active');
    $('#center').removeClass('active');
    $('#move-in').removeClass('active');
    $('#announce').removeClass('active');
    $('#customer-center').removeClass('active');

    if (url.indexOf('main') != -1) {
        $('#home').addClass('active');
    } else if (url.indexOf('center') != -1 || url.indexOf('facility') != -1) {
        $('#center').addClass('active');
    } else if (url.indexOf('move_in') != -1) {
        $('#move-in').addClass('active');
    } else if (url.indexOf('announce') != -1) {
        $('#announce').addClass('active');
    } else if (url.indexOf('customer_center') != -1 || url.indexOf('faq') != -1) {
        $('#customer-center').addClass('active');
    }
});