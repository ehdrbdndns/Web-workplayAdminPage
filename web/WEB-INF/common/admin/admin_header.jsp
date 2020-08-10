<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2020-08-03
  Time: 오후 7:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<header class="header">
    <nav class="navbar">
        <!-- Search Box-->
        <div class="search-box">
            <button class="dismiss"><i class="icon-close"></i></button>
            <form id="searchForm" action="#" role="search">
                <input type="search" placeholder="What are you looking for..." class="form-control">
            </form>
        </div>
        <div class="container-fluid">
            <div class="navbar-holder d-flex align-items-center justify-content-between">
                <!-- Navbar Header-->
                <div class="navbar-header">
                    <!-- Navbar Brand --><a href="/admin/fm.do" class="navbar-brand d-none d-sm-inline-block">
                    <div class="brand-text d-none d-lg-inline-block">
                        <span>Okiwi </span><strong>Dashboard</strong></div>
                    <div class="brand-text d-none d-sm-inline-block d-lg-none"><strong>BD</strong></div>
                </a>
                    <!-- Toggle Button-->
                    <a id="toggle-btn" href="#"
                       class="menu-btn active"><span></span><span></span><span></span></a>
                </div>
                <!-- Navbar Menu -->
                <ul class="nav-menu list-unstyled d-flex flex-md-row align-items-md-center">
                    <li class="nav-item"><a href="/admin/logout.do" class="nav-link logout"> <span
                            class="d-none d-sm-inline">Logout</span><i class="fa fa-sign-out"></i></a></li>
                </ul>
            </div>
        </div>
    </nav>
</header>