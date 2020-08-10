<%--
  Created by IntelliJ IDEA.
  User: zlzld
  Date: 2020-08-03
  Time: 오후 8:16
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<nav class="side-navbar">
    <!--TODO Sidebar Header-->
    <div class="sidebar-header d-flex align-items-center">
        <div class="avatar"><img src="<%=request.getContextPath()%>/resources/images/logo.svg" alt="..."
                                 class="img-fluid rounded-circle"></div>
        <div class="title">
            <h1 class="h4">Work Play</h1>
        </div>
    </div>
    <!--TODo Sidebar Navidation Menus-->
    <span class="heading">Main</span>
    <ul class="list-unstyled">
<%--        <li id="Main" class="active"><a href="/admin/main.do"> <i class="icon-home"></i>홈</a></li>--%>
        <li id="Fm"><a href="/admin/fm.do"> <i class="fa fa-bar-chart"></i>시설관리</a></li>
        <li><a href="#exampledropdownDropdown_homepage_manage" aria-expanded="false" data-toggle="collapse"> <i
                class="icon-interface-windows"></i>회사 정보</a>
            <ul id="exampledropdownDropdown_homepage_manage" class="collapse list-unstyled ">
                <li id="Footer"><a href="/admin/footer.do">Footer</a></li>
                <li id="Quick"><a href="/admin/quick.do">퀵메뉴</a></li>
            </ul>
        </li>
        <li><a href="#exampledropdownDropdown_cs" aria-expanded="false" data-toggle="collapse"> <i
                class="icon-interface-windows"></i>고객센터</a>
            <ul id="exampledropdownDropdown_cs" class="collapse list-unstyled ">
                <li id="Faq"><a href="/admin/faq.do">FAQ</a></li>
                <li id="Notice"><a href="/admin/notice.do">공지사항</a></li>
            </ul>
        </li>
    </ul>
    <span class="heading">Extras</span>
    <ul class="list-unstyled">
        <li><a href="/admin/logout.do"> <i class="icon-flask"></i>로그아웃</a></li>
    </ul>
</nav>