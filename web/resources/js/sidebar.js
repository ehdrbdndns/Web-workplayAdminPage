$(document).read(function(){
    var url = window.location.href;
    $('#Main').removeClass('active');
    $('#Fm').removeClass('active');
    $('#Footer').removeClass('active');
    $('#Quick').removeClass('active');
    $('#Faq').removeClass('active');
    $('#Notice').removeClass('active');

    if(url.indexOf('main')!=-1){
        $('#Main').addClass('active');
    } else if(url.indexOf('fm')!=-1){
        $('#Fm').addClass('active');
    } else if(url.indexOf('footer')!=-1){
        $('#Footer').addClass('active');
        $('#exampledropdownDropdown_homepage_manage').addClass('show');
    } else if(url.indexOf('quick')!=-1){
        $('#Quick').addClass('active');
        $('#exampledropdownDropdown_homepage_manage').addClass('show');
    } else if(url.indexOf('faq')!=-1){
        $('#Faq').addClass('active');
        $('#exampledropdownDropdown_cs').addClass('show');
    } else if(url.indexOf('notice')!=-1){
        $('#Notice').addClass('active');
        $('#exampledropdownDropdown_cs').addClass('show');
    }
});