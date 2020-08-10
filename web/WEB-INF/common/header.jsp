<%--
  Created by IntelliJ IDEA.
  User: zlzld
  Date: 2020-06-29
  Time: 오후 3:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--TODO HEADER-->
<div onmouseover="new function() {
    if($(window).width()>=768){
        $('#submenu').stop(true,true);
        $('#submenu').fadeIn().css('z-index', 999);
    }
}" onmouseleave="new function() {
    if($(window).width()>=768){
        $('#submenu').stop(true,true);
        $('#submenu').fadeOut();
        setTimeout(function() {
            $('#submenu').css('z-index',0);
        },300);
    }
}">
    <nav class="navbar navbar-expand-md">
        <div class="container">
            <a class="navbar-brand" href="/main.do">
                <img src="../../resources/images/logo.svg" class="logo-size"
                     alt="header logo"/>
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse_mobile"
                    aria-controls="navbarCollapse_mobile" aria-expanded="false" aria-label="Toggle navigation">
                <!--<span class="navbar-toggler-icon"></span>-->
                <img src="../../resources/images/navigation_mobile_button.svg" alt="navigation mobile image"/>
            </button>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <ul class="navbar-nav ml-auto">
                    <li id="home" class="nav-item">
                        <a class="nav-link h5" href="/main.do">홈</a>
                    </li>
                    <li id="center" class="nav-item">
                        <a class="nav-link h5" href="/center.do"><센터소개></센터소개></a>
                    </li>
                    <li id="move-in" class="nav-item">
                        <a class="nav-link h5" href="/move_in.do">입주안내</a>
                    </li>
                    <li id="announce" class="nav-item">
                        <a class="nav-link h5" href="/announce.do">공지사항</a>
                    </li>
                    <li id="customer-center" class="nav-item">
                        <a class="nav-link h5" href="/customer_center.do">고객센터</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <div id="submenu" class="navbar navbar-expand-md bg-main-orange pt-5 pb-5 position-absolute w-100"
         style="z-index: 0; display: none;">
        <div class="container">
            <div class="collapse navbar-collapse">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item active nav-item-submenu">
                        <a class="nav-link h5" href="/main.do">홈</a>
                    </li>
                    <li class="nav-item nav-item-submenu">
                        <a class="nav-link h5">센터소개</a>
                        <a class="nav-link h5 font-weight-light" href="/center.do">센터소개</a>
                        <a class="nav-link h5 font-weight-light" href="/facility.do">시설소개</a>
                    </li>
                    <li class="nav-item nav-item-submenu">
                        <a class="nav-link h5" href="/move_in.do">입주안내</a>
                    </li>
                    <li class="nav-item nav-item-submenu">
                        <a class="nav-link h5" href="/announce.do">공지사항</a>
                    </li>
                    <li class="nav-item nav-item-submenu">
                        <a class="nav-link h5">고객센터</a>
                        <a class="nav-link h5 font-weight-light" href="/customer_center.do">이용안내</a>
                        <a class="nav-link h5 font-weight-light" href="/faq.do?category=0">FAQ</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
<!--TODO HEADER END-->
