<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>홈</title>
    <meta name="description" content="">
    <meta name="robots" content="all,follow">
    <!-- Bootstrap CSS-->
    <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
          integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <!-- Font Awesome CSS-->
    <link rel="stylesheet" type="text/css" href="../resources/js/font-awesome/css/font-awesome.min.css">
    <!-- Fontastic Custom icon font-->
    <link rel="stylesheet" type="text/css" href="../resources/css/fontastic.css">
    <!-- Google fonts - Poppins -->
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Poppins:300,400,700">
    <!-- theme stylesheet-->
    <link rel="stylesheet" type="text/css" href="../resources/css/style.default.css" id="theme-stylesheet">
    <!-- Custom stylesheet - for your changes-->
    <link rel="stylesheet" type="text/css" href="../resources/css/custom.css">
    <!-- Favicon-->
    <link rel="shortcut icon" type="text/css" href="../resources/images/favicon.ico">
    <!-- Tweaks for older IEs--><!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
</head>
<body>
<div class="page">
    <!--TODO Main Navbar-->
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
                        <!-- Navbar Brand --><a href="/main" class="navbar-brand d-none d-sm-inline-block">
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
                        <li class="nav-item"><a href="/logout" class="nav-link logout"> <span
                                class="d-none d-sm-inline">Logout</span><i class="fa fa-sign-out"></i></a></li>
                    </ul>
                </div>
            </div>
        </nav>
    </header>
    <div class="page-content d-flex align-items-stretch">
        <!--TODO Side Navbar -->
        <nav class="side-navbar">
            <!--TODO Sidebar Header-->
            <div class="sidebar-header d-flex align-items-center">
                <div class="avatar"><img src="../resources/images/avatar-1.jpg" alt="..."
                                         class="img-fluid rounded-circle"></div>
                <div class="title">
                    <h1 class="h4">Kim Woosik</h1>
                    <p>Web Front Designer</p>
                </div>
            </div>
            <!--TODo Sidebar Navidation Menus-->
            <span class="heading">Main</span>
            <ul class="list-unstyled">
                <li class="active"><a href="/main"> <i class="icon-home"></i>홈</a></li>
                <li><a href="/sales_a"> <i class="fa fa-bar-chart"></i>시설관리</a></li>
                <li><a href="#exampledropdownDropdown_homepage_manage" aria-expanded="false" data-toggle="collapse"> <i
                        class="icon-interface-windows"></i>회사 정보</a>
                    <ul id="exampledropdownDropdown_homepage_manage" class="collapse list-unstyled ">
                        <li><a href="/sns">배너 관리</a></li>
                        <li><a href="/banner">Footer</a></li>
                        <li><a href="/tos">퀵메뉴</a></li>
                    </ul>
                </li>
                <li><a href="#exampledropdownDropdown_cs" aria-expanded="false" data-toggle="collapse"> <i
                        class="icon-interface-windows"></i>고객센터</a>
                    <ul id="exampledropdownDropdown_cs" class="collapse list-unstyled ">
                        <li><a href="/qna">FAQ</a></li>
                        <li><a href="/notice">공지사항</a></li>
                    </ul>
                </li>
            </ul>
            <span class="heading">Extras</span>
            <ul class="list-unstyled">
                <li><a href="/logout"> <i class="icon-flask"></i>로그아웃</a></li>
            </ul>
        </nav>
        <div class="content-inner">
            <!-- TODO Page Header-->
            <header class="page-header">
                <div class="container-fluid">
                    <h2 class="no-margin-bottom">Dashboard</h2>
                </div>
            </header>
            <section>

            </section>
            <footer class="main-footer">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-sm-6">
                            <p>Okiwi company &copy; 2019-2020</p>
                        </div>
                        <div class="col-sm-6 text-right">
                            <p>Design by <a href="#" class="external">Okiwi.co.kr</a>
                            </p>
                            <!-- Please do not remove the backlink to us unless you support further theme's development at https://bootstrapious.com/donate. It is part of the license conditions. Thank you for understanding :)-->
                        </div>
                    </div>
                </div>
            </footer>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
        integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
        crossorigin="anonymous"></script>
<!-- Main File-->
<script src="../resources/js/front.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
</body>
</html>