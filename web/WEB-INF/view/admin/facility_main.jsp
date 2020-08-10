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
                            <div class="card" style="position: relative;">
                                <div class="card-header align-items-center faq">
                                    <div class="categoryBtn" style="position: absolute; margin-left: 980px;">
                                        <div class="btn btn-primary" style="cursor: pointer;" data-toggle="modal"
                                             data-target="#caddModal">카테고리 추가
                                        </div>
                                        <div id="caddModal" tabindex="-1" role="dialog"
                                             aria-labelledby="exampleModalLabel"
                                             aria-hidden="true" class="modal fade text-left">
                                            <div role="document" class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h4 id="exampleModalLabel" class="modal-title">카테고리 추가</h4>
                                                        <button type="button" data-dismiss="modal"
                                                                aria-label="Close"
                                                                class="close"><span aria-hidden="true">×</span>
                                                        </button>
                                                    </div>
                                                    <form action="/admin/fm.do" method="post">
                                                        <div class="modal-body">
                                                            <p>추가할 카테고리 이름</p>
                                                            <div class="form-group row">
                                                                <div class="col-sm-6">
                                                                    <input type="text"
                                                                           class="form-control"
                                                                           style="width: 340px;"
                                                                           name="categoryname"
                                                                           id="categoryname"
                                                                           required value="">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" data-dismiss="modal"
                                                                    class="btn btn-secondary">취소하기
                                                            </button>
                                                            <button id="csavebtn" type="submit"
                                                                    class="btn btn-primary">
                                                                저장하기
                                                            </button>
                                                        </div>
                                                        <input type="text" name="type" value="cadd"
                                                               style="display: none;">
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="btn btn-primary" style="cursor: pointer;" data-toggle="modal"
                                             data-target="#cdelModal">삭제
                                        </div>
                                        <div id="cdelModal" tabindex="-1" role="dialog"
                                             aria-labelledby="exampleModalLabel2"
                                             aria-hidden="true" class="modal fade text-left">
                                            <div role="document" class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h4 id="exampleModalLabel2" class="modal-title">카테고리 삭제</h4>
                                                        <button type="button" data-dismiss="modal"
                                                                aria-label="Close"
                                                                class="close"><span aria-hidden="true">×</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <table class="table table-striped">
                                                            <tbody>
                                                            <c:forEach items="${fm_cs}" var="fm_c">
                                                                <tr>
                                                                    <td>
                                                                        <p style="margin-right: 20px; margin-top: 12px;">${fm_c.getNAME()}</p>
                                                                    </td>
                                                                    <th scope="row">
                                                                        <a href="/admin/fm.do?type=cdel&no=${fm_c.getNO()}">
                                                                            <button class="btn btn-primary">삭제</button>
                                                                        </a>
                                                                    </th>
                                                                </tr>
                                                            </c:forEach>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <h3 class="h4">시설관리(${name})</h3>
                                    <%--                                    여기 foreach로 박아버려--%>
                                    <div style="margin-top: 15px;">
                                        <c:forEach items="${fm_cs}" var="fm_c">
                                            <a href="/admin/fm.do?type=change&no_c=${fm_c.getNO()}"
                                               class="btn btn-primary"
                                               style="margin-left: 40px; margin-top:20px; cursor: pointer">${fm_c.getNAME()}
                                            </a>
                                        </c:forEach>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive text-center">
                                        <table class="table table-striped table-hover">
                                            <thead>
                                            <tr>
                                                <th style="white-space: nowrap; width: 900px;">파일</th>
                                                <th>삭제</th>
                                            </tr>
                                            </thead>
                                            <tbody id="pageContent">
                                            <form id="fileUploadForm" method="post" enctype="multipart/form-data">
                                                <c:forEach items="${fm_is}" var="fm_i" varStatus="i">
                                                    <tr>
                                                        <th>
                                                            <div class="input-group">
                                                                <input id="inputProfile${fm_i.getNo()}" readonly
                                                                       disabled type="text"
                                                                       class="form-control"
                                                                       placeholder=""
                                                                       required=""
                                                                       value="${fm_i.getImg().substring("/resources/files/facility/".length())}">
                                                                <div class="input-group-append">
                                                                    <button onclick="selectProfile(${fm_i.getNo()}, ${fm_i.getNo_c()})"
                                                                            type="button" class="btn btn-primary">업로드
                                                                    </button>
                                                                    <input type="file" class="tag-hide myinputfile"
                                                                           id="file${fm_i.getNo()}"
                                                                           name="banner[${fm_i.getNo()}].file"
                                                                           style="display: none"/>
                                                                </div>
                                                            </div>
                                                        </th>
                                                        <td>
                                                            <a href="/admin/fm.do?type=idel&no=${fm_i.getNo()}&no_c=${fm_i.getNo_c()}"
                                                               class="btn btn-primary"><span>삭제</span></a></td>
                                                    </tr>
                                                </c:forEach>
                                            </form>
                                            </tbody>
                                        </table>
                                        <div class="justify-content-center" style="display: flex">
                                            <a href="/admin/fm.do?type=add&no_c=${no_c}">
                                                <button class="btn btn-primary">파일 추가하기</button>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <section class="forms">
                <div class="container-fluid">
                    <div class="row">
                        <!--TODO Banner Setting-->
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-header d-flex align-items-center">
                                    <h3 class="h4">미리보기</h3>
                                </div>
                                <div class="card-body">
                                    <div class="facility-container mb-md-5 pb-md-5 mb-1 pb-3">
                                        <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
                                            <div class="container">
                                                <div class="carousel-inner">
                                                    <c:set var="facility_devider" value="${(facility.no+1)/4}"/>
                                                    <c:forEach varStatus="status" begin="0"
                                                               end="${(facility_devider+(1-(facility_devider%1))%1)-1}">
                                                        <c:choose>
                                                            <c:when test="${status.count eq 1}">
                                                                <%--0 ~ 4--%>
                                                                <div class="carousel-item active">
                                                                    <div class="row">
                                                                        <c:forEach items="${facilities}" var="facility"
                                                                                   begin="${(status.count-1) *4}"
                                                                                   end="${((status.count) *4)-1}"
                                                                                   varStatus="statusImage">
                                                                            <c:if test="${statusImage.count <=2}">
                                                                                <c:choose>
                                                                                    <c:when test="${statusImage.count%2==0}">
                                                                                        <%--TODO 짝수--%>
                                                                                        <div class="col-md-7 col-12 facility-image-section">
                                                                                            <img class="img-fluid facility-image"
                                                                                                 src="<%=request.getContextPath()%>${facility.img}"
                                                                                                 alt="${statusImage.index+1}"/>
                                                                                        </div>
                                                                                    </c:when>
                                                                                    <c:otherwise>
                                                                                        <%--TODO 홀수--%>
                                                                                        <div class="col-md-5 col-12 facility-image-section">
                                                                                            <img class="img-fluid facility-image"
                                                                                                 src="<%=request.getContextPath()%>${facility.img}"
                                                                                                 alt="${statusImage.index+1}"/>
                                                                                        </div>
                                                                                    </c:otherwise>
                                                                                </c:choose>
                                                                            </c:if>
                                                                            <c:if test="${statusImage.count >=3}">
                                                                                <c:choose>
                                                                                    <c:when test="${statusImage.count%2==0}">
                                                                                        <%--TODO 짝수--%>
                                                                                        <div class="col-md-5 col-12 facility-image-section">
                                                                                            <img class="img-fluid facility-image"
                                                                                                 src="<%=request.getContextPath()%>${facility.img}"
                                                                                                 alt="${statusImage.index+1}"/>
                                                                                        </div>
                                                                                    </c:when>
                                                                                    <c:otherwise>
                                                                                        <%--TODO 홀수--%>
                                                                                        <div class="col-md-7 col-12 facility-image-section">
                                                                                            <img class="img-fluid facility-image"
                                                                                                 src="<%=request.getContextPath()%>${facility.img}"
                                                                                                 alt="${statusImage.index+1}"/>
                                                                                        </div>
                                                                                    </c:otherwise>
                                                                                </c:choose>
                                                                            </c:if>
                                                                        </c:forEach>
                                                                    </div>
                                                                </div>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <div class="carousel-item">
                                                                    <div class="row">
                                                                        <c:forEach items="${facilities}" var="facility"
                                                                                   begin="${(status.count-1) *4}"
                                                                                   end="${((status.count) *4)-1}"
                                                                                   varStatus="statusImage">
                                                                            <c:if test="${statusImage.count <=2}">
                                                                                <c:choose>
                                                                                    <c:when test="${statusImage.count%2==0}">
                                                                                        <%--TODO 짝수--%>
                                                                                        <div class="col-md-7 col-12 facility-image-section">
                                                                                            <img class="img-fluid facility-image"
                                                                                                 src="<%=request.getContextPath()%>${facility.img}"
                                                                                                 alt="${statusImage.index}"/>
                                                                                        </div>
                                                                                    </c:when>
                                                                                    <c:otherwise>
                                                                                        <%--TODO 홀수--%>
                                                                                        <div class="col-md-5 col-12 facility-image-section">
                                                                                            <img class="img-fluid facility-image"
                                                                                                 src="<%=request.getContextPath()%>${facility.img}"
                                                                                                 alt="${statusImage.index}"/>
                                                                                        </div>
                                                                                    </c:otherwise>
                                                                                </c:choose>
                                                                            </c:if>
                                                                            <c:if test="${statusImage.count >=3}">
                                                                                <c:choose>
                                                                                    <c:when test="${statusImage.count%2==0}">
                                                                                        <%--TODO 짝수--%>
                                                                                        <div class="col-md-5 col-12 facility-image-section">
                                                                                            <img class="img-fluid facility-image"
                                                                                                 src="<%=request.getContextPath()%>${facility.img}"
                                                                                                 alt="${statusImage.index}"/>
                                                                                        </div>
                                                                                    </c:when>
                                                                                    <c:otherwise>
                                                                                        <%--TODO 홀수--%>
                                                                                        <div class="col-md-7 col-12 facility-image-section">
                                                                                            <img class="img-fluid facility-image"
                                                                                                 src="<%=request.getContextPath()%>${facility.img}"
                                                                                                 alt="${statusImage.index}"/>
                                                                                        </div>
                                                                                    </c:otherwise>
                                                                                </c:choose>
                                                                            </c:if>
                                                                        </c:forEach>
                                                                    </div>
                                                                </div>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:forEach>
                                                </div>
                                            </div>
                                            <a class="carousel-control-prev" href="#carouselExampleControls"
                                               role="button"
                                               data-slide="prev">
                                                <div class="btn btn-primary"><</div>
                                            </a>
                                            <a class="carousel-control-next" href="#carouselExampleControls"
                                               role="button"
                                               data-slide="next">
                                                <div class="btn btn-primary">></div>
                                            </a>
                                        </div>
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
<script>
    $(document).ready(function () {
        var url = window.location.href;
        $('#Main').removeClass('active');
        $('#Fm').removeClass('active');
        $('#Footer').removeClass('active');
        $('#Quick').removeClass('active');
        $('#Faq').removeClass('active');
        $('#Notice').removeClass('active');

        if (url.indexOf('main') != -1) {
            $('#Main').addClass('active');
        } else if (url.indexOf('fm') != -1) {
            $('#Fm').addClass('active');
        } else if (url.indexOf('footer') != -1) {
            $('#Footer').addClass('active');
            $('#exampledropdownDropdown_homepage_manage').addClass('show');
        } else if (url.indexOf('quick') != -1) {
            $('#Quick').addClass('active');
            $('#exampledropdownDropdown_homepage_manage').addClass('show');
        } else if (url.indexOf('faq') != -1) {
            $('#Faq').addClass('active');
            $('#exampledropdownDropdown_cs').addClass('show');
        } else if (url.indexOf('notice') != -1) {
            $('#Notice').addClass('active');
            $('#exampledropdownDropdown_cs').addClass('show');
        } else
            console.log("전혀 찍히지 않음");
    })
    $(document).on("change", ".myinputfile", function (i) {
        handleImageFileSelect(i)
    })

    function handleImageFileSelect(e) {
        var files = e.target.files;
        var filesArr = Array.prototype.slice.call(files);

        filesArr.forEach(function (f) {
            if (!f.type.match("image.*")) {
                alert("이미지 형식만 가능합니다.");
                return;
            }
            sel_file = f;
            var reader = new FileReader();
            reader.onload = function (e) {
                $('#img').attr("src", e.target.result);
            }
            reader.readAsDataURL(f);
        });
    }

    function selectProfile(no, no_c) {
        $('#file' + no).change(function () {
            var fileValue = $('#file' + no).val().split("\\");
            var fileName = fileValue[fileValue.length - 1];
            $('#inputProfile' + no).val(fileName);
            getImg(no, no_c);
        });
        $('#file' + no).click();
    }

    function getImg(no, no_c) {
        var form = $('#fileUploadForm')[0];
        // Create an FormData object
        var data = new FormData(form);
        var id = "#inputProfile" + no;
        var filename = $(id).val();
        fmChangeImg(no, data, filename, no_c);
    }
</script>
</body>
</html>