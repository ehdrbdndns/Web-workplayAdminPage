<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <jsp:include page="../../../common/admin/import_admin_css.jsp"/>
    <jsp:include page="../../../common/admin/import_admin_js.jsp"/>
</head>
<body>
<div class="page">
    <!--TODO Main Navbar-->
    <jsp:include page="../../common/admin/admin_header.jsp"/>
    <div class="page-content d-flex align-items-stretch">
        <!--TODO Side Navbar -->
        <jsp:include page="../../common/admin/admin_sidebar.jsp"/>
        <div class="content-inner">
            <!-- TODO Page Header-->
            <header class="page-header">
                <div class="container-fluid">
                    <h2 class="no-margin-bottom">Dashboard</h2>
                </div>
            </header>
            <section class="notice">
                <div class="container-fluid">
                    <div class="row">
                        <!--TODO Notice -->
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-header d-flex align-items-center">
                                    <h3 class="h4">공지사항</h3>
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive text-center">
                                        <table class="table table-striped table-hover">
                                            <thead>
                                            <tr>
                                                <th style="white-space: nowrap;">등록 일자</th>
                                                <th style="white-space: nowrap; width: 672px;">제목</th>
                                                <th>삭제</th>
                                                <th>수정</th>
                                            </tr>
                                            </thead>
                                            <tbody id="pageContent">
                                            <%--                                            pageajax로 채움--%>
                                            </tbody>
                                        </table>
                                    </div>
                                    <!--TODO Pagenation-->
                                    <nav class="m-md-4 m-2" aria-label="Page navigation example">
                                        <ul id="pagenav" class="pagination justify-content-center">
                                            <%--                                            pageajax로 채움--%>
                                        </ul>
                                    </nav>
                                    <div class="justify-content-center" style="display: flex">
                                        <a href="/admin/notice.do?type=add">
                                            <button class="btn btn-primary">추가하기</button>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <jsp:include page="../../common/admin/admin_footer.jsp"/>
        </div>
    </div>
</div>
<!-- Main File-->
<script>
    $(document).ready(function () {
        $(document).ready(function () {
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
            } else
                console.log("전혀 찍히지 않음");
        })
        pageajax("sub", 1);
    })
</script>
</body>
</html>