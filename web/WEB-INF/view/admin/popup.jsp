<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Popups all</title>
    <meta name="description" content="">
    <meta name="robots" content="all,follow">
    <!-- Bootstrap CSS-->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
          integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <!-- Font Awesome CSS-->
    <link rel="stylesheet" href="../resources/js/font-awesome/css/font-awesome.min.css">
    <!-- Fontastic Custom icon font-->
    <link rel="stylesheet" href="../resources/css/fontastic.css">
    <!-- Google fonts - Poppins -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,700">
    <!-- theme stylesheet-->
    <link rel="stylesheet" href="../resources/css/style.default.css" id="theme-stylesheet">
    <!-- Custom stylesheet - for your changes-->
    <link rel="stylesheet" href="../resources/css/custom.css">
    <!-- Favicon-->
    <link rel="shortcut icon" href="../resources/images/favicon.ico">
    <!-- Tweaks for older IEs--><!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
    <jsp:include page="../../common/jquery_3_5.jsp"/>
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
                        <!-- Navbar Brand --><a href="index.html" class="navbar-brand d-none d-sm-inline-block">
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
                        <li class="nav-item"><a href="login.html" class="nav-link logout"> <span
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
                <li><a href="index.html"> <i class="icon-home"></i>홈</a></li>
                <li><a href="#"> <i class="fa fa-bar-chart"></i>매출 관리</a></li>
                <li><a href="#"> <i class="icon-grid"></i>이용자 통계</a></li>
                <li><a href="#"> <i class="icon-grid"></i>회원 관리</a></li>
                <li><a href="#"> <i class="fa fa-bar-chart"></i>계정 관리</a></li>
                <li><a href="#exampledropdownDropdown_homepage_manage" aria-expanded="false" data-toggle="collapse"> <i
                        class="icon-interface-windows"></i>홈페이지 관리</a>
                    <ul id="exampledropdownDropdown_homepage_manage" class="collapse list-unstyled">
                        <li><a href="#">SNS 연동</a></li>
                        <li><a href="#">배너 관리</a></li>
                        <li><a href="#">이용 약관</a></li>
                        <li><a href="#">회사 소개</a></li>
                        <li><a href="#">Footer 변경</a></li>
                        <li><a href="#">FAQ 변경</a></li>
                    </ul>
                </li>
                <li><a href="#exampledropdownDropdown_cs" aria-expanded="false" data-toggle="collapse"> <i
                        class="icon-interface-windows"></i>고객센터</a>
                    <ul id="exampledropdownDropdown_cs" class="collapse list-unstyled">
                        <li><a href="#">문의사항</a></li>
                        <li><a href="#">공지사항</a></li>
                    </ul>
                </li>
                <li><a href="#exampledropdownDropdown_log" aria-expanded="false" data-toggle="collapse"> <i
                        class="icon-interface-windows"></i>기록 보관</a>
                    <ul id="exampledropdownDropdown_log" class="collapse list-unstyled">
                        <li><a href="#">Table 기록</a></li>
                        <li><a href="#">Message 기록</a></li>
                    </ul>
                </li>
            </ul>
            <span class="heading">Extras</span>
            <ul class="list-unstyled">
                <li><a href="#"> <i class="icon-flask"></i>로그아웃</a></li>
            </ul>
        </nav>
        <div class="content-inner">
            <!-- TODO Page Header-->
            <header class="page-header">
                <div class="container-fluid">
                    <h2 class="no-margin-bottom">Dashboard</h2>
                </div>
            </header>
            <!--TODO Pop-ups-->
            <section>
                <div class="container-fluid">
                    <div class="row">
                        <!--TODO 회원관리 세부사항 팝업-->
                        <div class="col-lg-4">
                            <div class="card">
                                <div class="card-header d-flex align-items-center">
                                    <h3 class="h4">회원관리 세부사항 팝업</h3>
                                </div>
                                <div class="card-body text-center">
                                    <button type="button" data-toggle="modal" data-target="#myModal"
                                            class="btn btn-primary">Form in simple modal
                                    </button>
                                    <!-- Modal-->
                                    <div id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                                         aria-hidden="true" class="modal fade text-left">
                                        <div role="document" class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h4 id="exampleModalLabel" class="modal-title">회원 세부사항</h4>
                                                    <button type="button" data-dismiss="modal" aria-label="Close"
                                                            class="close"><span aria-hidden="true">×</span></button>
                                                </div>
                                                <div class="modal-body">
                                                    <p>Lorem ipsum dolor sit amet consectetur.</p>
                                                    <div class="row">
                                                        <div class="col-sm-12 m-0 p-0">
                                                            <div class="col-12 m-0 p-0">
                                                                <div>
                                                                    <div class="card-body">
                                                                        <div class="table-responsive">
                                                                            <table class="table table-striped">
                                                                                <tbody>
                                                                                <tr>
                                                                                    <th scope="row">No</th>
                                                                                    <td>2</td>
                                                                                    <th scope="row">Sex</th>
                                                                                    <td>man</td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <th scope="row">ID</th>
                                                                                    <td>SkyRed</td>
                                                                                    <th scope="row">Email</th>
                                                                                    <td>zlzldntlr@naver.com</td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <th scope="row">Register</th>
                                                                                    <td>2020-07-09</td>
                                                                                    <th scope="row">Phone</th>
                                                                                    <td>01045299453</td>
                                                                                </tr>
                                                                                </tbody>
                                                                            </table>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" data-dismiss="modal"
                                                            class="btn btn-secondary">닫기
                                                    </button>
                                                    <button type="button" class="btn btn-primary">차단하기</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--TODO FAQ 변경 디테일 팝업-->
                        <div class="col-lg-4">
                            <div class="card">
                                <div class="card-header d-flex align-items-center">
                                    <h3 class="h4">FAQ 변경 디테일 팝업</h3>
                                </div>
                                <div class="card-body text-center">
                                    <button type="button" data-toggle="modal" data-target="#myModal1"
                                            class="btn btn-primary">Form in simple modal
                                    </button>
                                    <!-- Modal-->
                                    <div id="myModal1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel1"
                                         aria-hidden="true" class="modal fade text-left">
                                        <div role="document" class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h4 id="exampleModalLabel1" class="modal-title">FAQ 변경 디테일 팝업</h4>
                                                    <button type="button" data-dismiss="modal" aria-label="Close"
                                                            class="close"><span aria-hidden="true">×</span></button>
                                                </div>
                                                <div class="modal-body">
                                                    <p>Lorem ipsum dolor sit amet consectetur.</p>
                                                    <div class="form-group row">
                                                        <label class="col-sm-3 form-control-label m-auto">Title</label>
                                                        <div class="col-sm-9">
                                                            <input type="text" class="form-control">
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <label class="col-sm-3 form-control-label m-auto">Contents</label>
                                                        <div class="col-sm-9">
                                                            <textarea type="text" class="form-control autosize"
                                                                      placeholder="Contents Placeholder"></textarea>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" data-dismiss="modal"
                                                            class="btn btn-secondary">Close
                                                    </button>
                                                    <button type="button" class="btn btn-primary">Save changes</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--TODO 공지사항 세부 팝업-->
                        <div class="col-lg-4">
                            <div class="card">
                                <div class="card-header d-flex align-items-center">
                                    <h3 class="h4">공지사항 세부 팝업</h3>
                                </div>
                                <div class="card-body text-center">
                                    <button type="button" data-toggle="modal" data-target="#myModal2"
                                            class="btn btn-primary">Form in simple modal
                                    </button>
                                    <!-- Modal-->
                                    <div id="myModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel2"
                                         aria-hidden="true" class="modal fade text-left">
                                        <div role="document" class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h4 id="exampleModalLabel2" class="modal-title">공지사항 세부 팝업</h4>
                                                    <button type="button" data-dismiss="modal" aria-label="Close"
                                                            class="close"><span aria-hidden="true">×</span></button>
                                                </div>
                                                <div class="modal-body">
                                                    <p>Lorem ipsum dolor sit amet consectetur.</p>
                                                    <div class="form-group row">
                                                        <label class="col-sm-3 form-control-label m-auto">Title</label>
                                                        <div class="col-sm-6">
                                                            <input type="text" class="form-control">
                                                        </div>
                                                        <label class="col-sm-3 form-control-label m-auto">2020-07-09</label>
                                                    </div>
                                                    <div class="form-group row">
                                                        <label class="col-sm-3 form-control-label m-auto">Contents</label>
                                                        <div class="col-sm-9">
                                                            <textarea type="text" class="form-control autosize"
                                                                      placeholder="Contents Placehold"></textarea>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" data-dismiss="modal"
                                                            class="btn btn-secondary">Close
                                                    </button>
                                                    <button type="button" class="btn btn-primary">Save changes</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--TODO 문의사항 세부 팝업-->
                        <div class="col-lg-4">
                            <div class="card">
                                <div class="card-header d-flex align-items-center">
                                    <h3 class="h4">문의사항 세부 팝업</h3>
                                </div>
                                <div class="card-body text-center">
                                    <button type="button" data-toggle="modal" data-target="#myModal3"
                                            class="btn btn-primary">Form in simple modal
                                    </button>
                                    <!-- Modal-->
                                    <div id="myModal3" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel3"
                                         aria-hidden="true" class="modal fade text-left">
                                        <div role="document" class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h4 id="exampleModalLabel3" class="modal-title">문의사항 세부 팝업</h4>
                                                    <button type="button" data-dismiss="modal" aria-label="Close"
                                                            class="close"><span aria-hidden="true">×</span></button>
                                                </div>
                                                <div class="modal-body">
                                                    <p>Lorem ipsum dolor sit amet consectetur.</p>
                                                    <div class="form-group row">
                                                        <label class="col-sm-3 form-control-label m-auto">Title</label>
                                                        <div class="col-sm-9">
                                                            <input type="text" class="form-control">
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <label class="col-sm-3 form-control-label m-auto">Register</label>
                                                        <div class="col-sm-9">
                                                            <input type="text" class="form-control">
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <label class="col-sm-3 form-control-label m-auto">Writer</label>
                                                        <div class="col-sm-9">
                                                            <input type="text" class="form-control">
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <label class="col-sm-3 form-control-label m-auto">Question</label>
                                                        <div class="col-sm-9">
                                                            <textarea type="text" class="form-control autosize"
                                                                      placeholder="Contents Placehold"></textarea>
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <label class="col-sm-3 form-control-label m-auto">Comment's Date</label>
                                                        <div class="col-sm-9">
                                                            <input type="text" class="form-control">
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <label class="col-sm-3 form-control-label m-auto">Comment's</label>
                                                        <div class="col-sm-9">
                                                            <textarea type="text" class="form-control autosize"
                                                                      placeholder="Contents Placehold"></textarea>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" data-dismiss="modal"
                                                            class="btn btn-secondary">Close
                                                    </button>
                                                    <button type="button" class="btn btn-primary">Save changes</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!--TODO Footer Section-->
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
<!-- JavaScript files-->
<!-- Main File-->
<script src="../resources/js/front.js"></script>
</body>
</html>
