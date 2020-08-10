<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link rel="stylesheet" type="text/css"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
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
    <jsp:include page="../../common/jquery_3_5.jsp"/>
    <script src="../../../resources/js/ajax.js"></script>
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
                <li><a href="/main.do"> <i class="icon-home"></i>홈</a></li>
                <li><a href="/fm.do"> <i class="fa fa-bar-chart"></i>시설관리</a></li>
                <li><a href="#exampledropdownDropdown_homepage_manage" aria-expanded="true" data-toggle="collapse"> <i
                        class="icon-interface-windows"></i>회사 정보</a>
                    <ul id="exampledropdownDropdown_homepage_manage" class="collapse list-unstyled show">
                        <li class="active"><a href="/banner.do">배너 관리</a></li>
                        <li><a href="/footer.do">Footer</a></li>
                        <li><a href="/quick.do">퀵메뉴</a></li>
                    </ul>
                </li>
                <li><a href="#exampledropdownDropdown_cs" aria-expanded="false" data-toggle="collapse"> <i
                        class="icon-interface-windows"></i>고객센터</a>
                    <ul id="exampledropdownDropdown_cs" class="collapse list-unstyled ">
                        <li><a href="/faq.do">FAQ</a></li>
                        <li><a href="/notice.do">공지사항</a></li>
                    </ul>
                </li>
            </ul>
            <span class="heading">Extras</span>
            <ul class="list-unstyled">
                <li><a href="/logout.do"> <i class="icon-flask"></i>로그아웃</a></li>
            </ul>
        </nav>
        <div class="content-inner">
            <!-- TODO Page Header-->
            <header class="page-header">
                <div class="container-fluid">
                    <h2 class="no-margin-bottom">Dashboard</h2>
                </div>
            </header>
            <form id="fileUploadForm" method="post" enctype="multipart/form-data">
                <section class="forms">
                    <div class="container-fluid">
                        <div class="row">
                            <!--TODO Banner Setting-->
                            <div class="col-lg-12">
                                <div class="card">
                                    <div class="card-close">
                                        <button type="button" id="closeCard1" data-toggle="dropdown"
                                                aria-haspopup="true" aria-expanded="false" class="dropdown-toggle">
                                            <i class="fa fa-ellipsis-v"></i></button>
                                        <div aria-labelledby="closeCard1"
                                             class="dropdown-menu dropdown-menu-right has-shadow"><a href="#"
                                                                                                     class="dropdown-item remove">
                                            <i class="fa fa-deviantart"></i>상세보기</a></div>
                                    </div>
                                    <div class="card-header d-flex align-items-center">
                                        <h3 class="h4">배너 관리</h3>
                                    </div>
                                    <div class="card-body">
                                        <div class="table-responsive text-center">
                                            <table class="table table-striped table-hover text-center">
                                                <thead>
                                                <tr>
                                                    <th>Banner 변경</th>
                                                    <th>노출 여부</th>
                                                    <th>삭제</th>
                                                </tr>
                                                </thead>
                                                <tbody id="bannerbody">
                                                <c:forEach items="${banner}" var="banner" varStatus="i">
                                                <tr>
                                                    <td style="width: 500px;">
                                                        <div class="input-group">
                                                            <input id="inputProfile${i.index}" readonly disabled
                                                                   type="text"
                                                                   class="form-control"
                                                                   placeholder="${banner.getName()}"
                                                                   required="">
                                                            <div class="input-group-append">
                                                                <button onclick="selectProfile(${i.index}, ${banner.getNo()}, ${banner.getBanner_check()})"
                                                                        type="button" class="btn btn-primary">찾아보기
                                                                </button>
                                                                <input type="file" class="tag-hide myinputfile"
                                                                       id="f${i.index}"
                                                                       name="banner[${i.index}].file"
                                                                       style="display: none"/>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <c:choose>
                                                        <c:when test="${i.first}">
                                                            <td>

                                                            </td>
                                                            <td>

                                                            </td>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <td>
                                                                <input
                                                                       class="checkbox-template"
                                                                       onclick="boxclick(${banner.getNo()}, ${banner.getBanner_check()})"
                                                                       type="checkbox"
                                                                       value="${banner.getBanner_check()}" name="Check"
                                                                <c:if test="${banner.getBanner_check() eq 1}">
                                                                       checked
                                                                </c:if>
                                                                       id="uploadCheck${banner.getBanner_check()}">
                                                                <label
                                                                        class="form-check-label"
                                                                        for="uploadCheck${banner.getBanner_check()}">Banner 노출</label>
                                                            </td>
                                                            <th scope="row">
                                                                <a onclick="delBanner(${banner.getNo()})"
                                                                   class="btn btn-primary" style="color: white;"><span>삭제</span></a>
                                                                <div class="form-check d-none"><input name="slCheck"
                                                                                                      class="form-check-input"
                                                                                                      type="checkbox"
                                                                                                      value="${banner.getNo()}"
                                                                                                      id="selectCheck${i.index}"><label
                                                                        class="form-check-label"
                                                                        for="selectCheck${i.index}"></label>
                                                                </div>
                                                            </th>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </tr>
                                                </tbody>
                                                </c:forEach>
                                            </table>
                                            <div class="form-group text-right m-1">
                                                <button id="addbtn" onclick="addBanner()" type="button"
                                                        class="btn btn-primary">추가 하기
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </form>
            <section class="forms">
                <div class="container-fluid">
                    <div class="row">
                        <!--TODO Banner Setting-->
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-header d-flex align-items-center">
                                    <h3 class="h4">배너 미리보기</h3>
                                </div>
                                <div class="card-body" style="width: 100%;">
                                    <div style="width: 100%;">
                                        <div id="carouselExampleIndicators" class="carousel slide"
                                             data-ride="carousel">
                                            <ol id="ul_list" class="carousel-indicators">
                                                <c:forEach items="${banner}" var="banner" varStatus="i">
                                                    <c:choose>
                                                        <c:when test="${i.first}">
                                                            <li data-target="#carouselExampleIndicators"
                                                                data-slide-to="${i.index}"
                                                                class="active"></li>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <c:if test="${banner.getBanner_check() eq 1}">
                                                                <li data-target="#carouselExampleIndicators"
                                                                    data-slide-to="${i.index}"
                                                                    class=""></li>
                                                            </c:if>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:forEach>
                                            </ol>
                                            <div id="img_list" class="carousel-inner">
                                                <c:forEach items="${banner}" var="banner" varStatus="i">
                                                    <c:choose>
                                                        <c:when test="${i.first}">
                                                            <div class="carousel-item active">
                                                                <c:choose>
                                                                    <c:when test="${banner.getName() eq null || banner.getName() eq ''}">
                                                                        <img class="d-block w-100"
                                                                             id="imgf${i.index}"
                                                                             src="/images/1500x300.png"
                                                                             alt="Second slide">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <img class="d-block w-100"
                                                                             id="imgf${i.index}"
                                                                             src="/resources/imgUpload/${banner.getName()}"
                                                                             alt="${i.index}slide">
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </div>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <c:if test="${banner.getBanner_check() eq 1}">
                                                                <div class="carousel-item ">
                                                                    <c:choose>
                                                                        <c:when test="${banner.getName() eq null || banner.getName() eq ''}">
                                                                            <img class="d-block w-100"
                                                                                 id="imgf${i.index}"
                                                                                 src="/images/1500x300.png"
                                                                                 alt="Second slide">
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <img class="d-block w-100"
                                                                                 id="imgf${i.index}"
                                                                                 src="/resources/imgUpload/${banner.getName()}"
                                                                                 alt="${i.index}slide">
                                                                        </c:otherwise>
                                                                    </c:choose>
                                                                </div>
                                                            </c:if>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:forEach>
                                            </div>
                                            <div id="movebtn">
                                                <a class="carousel-control-prev" href="#carouselExampleIndicators"
                                                   role="button"
                                                   data-slide="prev">
                                                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                                    <span class="sr-only">Previous</span>
                                                </a>
                                                <a class="carousel-control-next" href="#carouselExampleIndicators"
                                                   role="button"
                                                   data-slide="next">
                                                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                                    <span class="sr-only">Next</span>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
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
<!-- Main File-->
<script src="../resources/js/front.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script>
    var sel_file = [];
    $(document).on("change", ".myinputfile", function (i) {
        console.log(i.currentTarget.id)
        handleImageFileSelect(i)
    })

    function handleImageFileSelect(e) {
        var files = e.target.files;
        var filesArr = Array.prototype.slice.call(files);
        var myid = e.target.id;
        filesArr.forEach(function (f) {
            if (!f.type.match("image.*")) {
                1``
                alert("이미지 형식만 가능합니다.");
                return;
            }
            sel_file.push(f);
            var reader = new FileReader();
            reader.onload = function (e) {
                console.log(myid)
                //$("#img_list").append(img_html);
                $('#img' + myid).attr("src", e.target.result);
            }
            reader.readAsDataURL(f);
        });
    }

    function selectProfile(index, no, check) {
        $('#f' + index).change(function () {
            var fileValue = $('#f' + index).val().split("\\");
            var fileName = fileValue[fileValue.length - 1];
            $('#inputProfile' + index).val(fileName);
            getImg(no, index, check);
        });
        $('#f' + index).click();
    }

    function getImg(no, index, check) {
        var form = $('#fileUploadForm')[0];
        // Create an FormData object
        var data = new FormData(form);
        var id = "#inputProfile" + index;
        var filename = $(id).val();
        bannerChangeImg(no, data, filename, check);
    }

    function boxclick(no, check) {
        var check = 0;
            if (check === 1) {
                check = 0;
            }
            else if (check === 0) {
                check = 1;
            }
            else{
                console.log("제대로 된 체크값을 가지고 오지 못함.");
            }
            bannerChangeBox(no, check);
    }

    // function checktest() {
    //     $("input:checkbox[name=Check]").each(function (i) {
    //         //console.log($(this).val());
    //         if ($(this).is(":checked") == true)
    //             $(this).val(1);
    //         $(this).attr("name", "banner[" + i + "].Check");
    //     })
    //     $("input:checkbox[name=slCheck]").each(function (i) {
    //         console.log($(this).val());
    //         $(this).prop('checked', true);
    //         $(this).attr("name", "banner[" + i + "].No");
    //     })
    // }


</script>
</body>
</html>