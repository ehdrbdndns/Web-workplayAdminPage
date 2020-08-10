<%--
  Created by IntelliJ IDEA.
  User: zlzld
  Date: 2020-08-04
  Time: 오후 8:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="navbarCollapse_mobile" class="bg-main-orange position-absolute w-100 h-100 collapse">
    <a onclick="new function() {
        if($('#navbarCollapse_mobile').hasClass('show')){
            $('#navbarCollapse_mobile').removeClass('show');
        }
    }" class="position-absolute" style="right: 32px;top: 32px;">
        <img src="../../resources/images/navigation_close.svg" alt="close-button"/>
    </a>
    <ul class="navbar-nav">
        <li class="nav-item">
            <a class="nav-link h5" href="/main.do">홈</a>
        </li>
        <li class="nav-item">
            <a class="nav-link h5">센터소개</a>
            <a class="nav-link h5" href="/center.do">센터소개</a>
            <a class="nav-link h5" href="/facility.do">시설소개</a>
        </li>
        <li class="nav-item">
            <a class="nav-link h5" href="/move_in.do">입주안내</a>
        </li>
        <li class="nav-item">
            <a class="nav-link h5" href="/announce.do">공지사항</a>
        </li>
        <li class="nav-item">
            <a class="nav-link h5">고객센터</a>
            <a class="nav-link h5" href="/customer_center.do">이용안내</a>
            <a class="nav-link h5" href="/faq.do">FAQ</a>
        </li>
    </ul>
</div>