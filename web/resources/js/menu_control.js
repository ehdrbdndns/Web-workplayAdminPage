/*TODO FAQ*/
$(document).ready(function () {
    var url = window.location.href;
    $('#all').removeClass('active');
    $('#in').removeClass('active');
    $('#use').removeClass('active');
    $('#giving').removeClass('active');
    $('#etc').removeClass('active');

    if (url.indexOf('category=0') != -1) {
        $('#all').addClass('active');
    } else if (url.indexOf('category=1') != -1) {
        $('#in').addClass('active');
    } else if (url.indexOf('category=2') != -1) {
        $('#use').addClass('active');
    } else if (url.indexOf('category=3') != -1) {
        $('#giving').addClass('active');
    } else if (url.indexOf('category=4') != -1) {
        $('#etc').addClass('active');
    }
});

/*TODO Facility*/
$(document).ready(function () {
    var url = window.location.href;
    var menu_elements = $('.facility-menu a').get();
    for (var i = 0; i < menu_elements.length; i++) {
        if (url.indexOf('type=' + (i + 1)) != -1) {
            menu_elements[i].setAttribute('class', 'list-group-item h2 text-decoration-none active');
        }
    }
});