<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
            <section class="forms">
                <div class="container-fluid">
                    <div class="row">
                        <!--TODO 블로그 유튜브 위치 휴대폰 이메일 FAX 서울시유관기관 청년마루-->
                        <!--TODO Company Name Change Form-->
                        <div class="col-lg-6">
                            <div class="card">
                                <div class="card-header d-flex align-items-center">
                                    <h3 class="h4">서울시 유관기관</h3>
                                </div>
                                <div class="card-body">
                                    <form class="footer">
                                        <div class="form-group">
                                            <label class="form-control-label">기관</label>
                                            <input id="seoulurl0" type="text" placeholder="Change Your Name"
                                                   class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label class="form-control-label">URL</label>
                                            <input id="seoulurl1" type="text" placeholder="Change Your Name"
                                                   class="form-control">
                                        </div>
                                        <div class="form-group" style="margin-bottom: 0px;">
                                            <button onclick="checkInputInstitution('seoul',$('#seoulurl0').val(), $('#seoulurl1').val())"
                                                    type="button" class="btn btn-primary">추 가
                                            </button>
                                            <p style="clear:both;">&nbsp</p>
                                        </div>
                                        <div class="footerLine"></div>
                                        <h1 class="h1" style="font-size: 12px; color: #777;">설정된 기관 이름</h1>
                                        <div class="card-body">
                                            <c:forEach items="${footerSeoul}" var="footer" varStatus="i">
                                            <form>
                                                <div class="form-group footer-group">
                                                    <input type="text" class="form-control" value="${footer.getName()}" style="height: 25px;" disabled readonly>
                                                    <button onclick="checkDeletInstitution('seoul',${footer.getNo()})"
                                                            type="button" class="btn btn-primary footerIntuition">삭제
                                                    </button>
                                                </div>
                                            </form>
                                            </c:forEach>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="card">
                                <div class="card-header d-flex align-items-center">
                                    <h3 class="h4">청년 마루</h3>
                                </div>
                                <div class="card-body">
                                    <form class="footer">
                                        <div class="form-group">
                                            <label class="form-control-label">기관</label>
                                            <input id="youghturl0" type="text" placeholder="Change Your Name"
                                                   class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label class="form-control-label">URL</label>
                                            <input id="youghturl1" type="text" placeholder="Change Your Name"
                                                   class="form-control">
                                        </div>
                                        <div class="form-group" style="margin-bottom: 0px;">
                                            <button onclick="checkInputInstitution('yought',$('#youghturl0').val(), $('#youghturl1').val())"
                                                    type="button" class="btn btn-primary">추 가
                                            </button>
                                            <p style="clear:both;">&nbsp</p>
                                        </div>
                                        <div class="footerLine"></div>
                                        <h1 class="h1" style="font-size: 12px; color: #777;">설정된 기관 이름</h1>
                                        <div class="card-body">
                                            <c:forEach items="${footerYought}" var="footer" varStatus="i">
                                                <form>
                                                    <div class="form-group footer-group">
                                                        <input type="text" class="form-control" value="${footer.getName()}" style="height: 25px;" disabled readonly>
                                                        <button onclick="checkDeletInstitution('yought',${footer.getNo()})"
                                                                type="button" class="btn btn-primary footerIntuition">삭제
                                                        </button>
                                                    </div>
                                                </form>
                                            </c:forEach>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="card">
                                <div class="card-header d-flex align-items-center">
                                    <h3 class="h4">블로그</h3>
                                </div>
                                <div class="card-body">
                                    <form>
                                        <div class="form-group">
                                            <label class="form-control-label">블로그 이름</label>
                                            <input id="blogurl0" type="text" disabled readonly class="form-control"
                                            <c:choose>
                                            <c:when test="${footer.getBlog_name() eq null || footer.getBlog_name() == ''}">
                                                   value="비어 있음">
                                            </c:when>
                                            <c:otherwise>
                                                value="${footer.getBlog_name()}" >
                                            </c:otherwise>
                                            </c:choose>
                                        </div>
                                        <div class="form-group">
                                            <label class="form-control-label">URL</label>
                                            <input id="blogurl3" type="text" disabled readonly class="form-control"
                                            <c:choose>
                                            <c:when test="${footer.getBlog_url() eq null || footer.getBlog_url() == ''}">
                                                   value="비어 있음">
                                            </c:when>
                                            <c:otherwise>
                                                value="${footer.getBlog_url()}" >
                                            </c:otherwise>
                                            </c:choose>
                                        </div>
                                        <div class="form-group">
                                            <label class="form-control-label">바뀔 이름</label>
                                            <input id="blogurl1" type="text" placeholder="Change Your Name"
                                                   class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label class="form-control-label">바뀔 URL</label>
                                            <input id="blogurl2" type="text" placeholder="Change Your URL"
                                                   class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <button onclick="checkInputdatas('blog',$('#blogurl1').val(),$('#blogurl2').val())"
                                                    type="button" class="btn btn-primary">변 경
                                            </button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="card">
                                <div class="card-header d-flex align-items-center">
                                    <h3 class="h4">유튜브</h3>
                                </div>
                                <div class="card-body">
                                    <form>
                                        <div class="form-group">
                                            <label class="form-control-label">유튜브 이름</label>
                                            <input id="Youtubeurl0" type="text" disabled readonly
                                                   class="form-control"
                                            <c:choose>
                                            <c:when test="${footer.getYoutube_name() eq null || footer.getYoutube_name() == ''}">
                                                   value="비어 있음">
                                            </c:when>
                                            <c:otherwise>
                                                value="${footer.getYoutube_name()}" >
                                            </c:otherwise>
                                            </c:choose>
                                        </div>
                                        <div class="form-group">
                                            <label class="form-control-label">URL</label>
                                            <input id="Youtubeurl3" type="text" disabled readonly
                                                   class="form-control"
                                            <c:choose>
                                            <c:when test="${footer.getYoutube_url() eq null || footer.getYoutube_url() == ''}">
                                                   value="비어 있음">
                                            </c:when>
                                            <c:otherwise>
                                                value="${footer.getYoutube_url()}" >
                                            </c:otherwise>
                                            </c:choose>
                                        </div>
                                        <div class="form-group">
                                            <label class="form-control-label">바뀔 이름</label>
                                            <input id="Youtubeurl1" type="text" placeholder="Change Your Name"
                                                   class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label class="form-control-label">바뀔 URL</label>
                                            <input id="Youtubeurl2" type="text" placeholder="Change Your URL"
                                                   class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <button onclick="checkInputdatas('Youtube',$('#Youtubeurl1').val(),$('#Youtubeurl2').val())"
                                                    type="button" class="btn btn-primary">변 경
                                            </button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="card">
                                <div class="card-header d-flex align-items-center">
                                    <h3 class="h4">위치</h3>
                                </div>
                                <div class="card-body">
                                    <form>
                                        <div class="form-group">
                                            <label class="form-control-label">위치 정보</label>
                                            <input id="Locationurl0" type="text" disabled readonly class="form-control"
                                            <c:choose>
                                            <c:when test="${footer.getLocation() eq null || footer.getLocation() == ''}">
                                                   value="비어 있음">
                                            </c:when>
                                            <c:otherwise>
                                                value="${footer.getLocation()}" >
                                            </c:otherwise>
                                            </c:choose>
                                        </div>
                                        <div class="form-group">
                                            <label class="form-control-label">바뀔 이름</label>
                                            <input id="Locationurl1" type="text" placeholder="Change Your Name"
                                                   class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <button onclick="checkInputdata('Location',$('#Locationurl1').val())"
                                                    type="button" class="btn btn-primary">변 경
                                            </button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="card">
                                <div class="card-header d-flex align-items-center">
                                    <h3 class="h4">휴대폰</h3>
                                </div>
                                <div class="card-body">
                                    <form>
                                        <div class="form-group">
                                            <label class="form-control-label">휴대폰 번호</label>
                                            <input id="Phoneurl0" type="text" disabled readonly class="form-control"
                                            <c:choose>
                                            <c:when test="${footer.getPhone() eq null || footer.getPhone() == ''}">
                                                   value="비어 있음">
                                            </c:when>
                                            <c:otherwise>
                                                value="${footer.getPhone()}" >
                                            </c:otherwise>
                                            </c:choose>
                                        </div>
                                        <div class="form-group">
                                            <label class="form-control-label">바뀔 번호</label>
                                            <input id="Phoneurl1" type="text" placeholder="Change Your Name"
                                                   class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <button onclick="checkInputdata('Phone',$('#Phoneurl1').val())"
                                                    type="button" class="btn btn-primary">변 경
                                            </button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="card">
                                <div class="card-header d-flex align-items-center">
                                    <h3 class="h4">이메일</h3>
                                </div>
                                <div class="card-body">
                                    <form>
                                        <div class="form-group">
                                            <label class="form-control-label">이메일 정보</label>
                                            <input id="emailurl0" type="text" disabled readonly class="form-control"
                                            <c:choose>
                                            <c:when test="${footer.getEmail() eq null || footer.getEmail() == ''}">
                                                   value="비어 있음">
                                            </c:when>
                                            <c:otherwise>
                                                value="${footer.getEmail()}" >
                                            </c:otherwise>
                                            </c:choose>
                                        </div>
                                        <div class="form-group">
                                            <label class="form-control-label">바뀔 이메일</label>
                                            <input id="emailurl1" type="text" placeholder="Change Your Name"
                                                   class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <button onclick="checkInputdata('email',$('#emailurl1').val())"
                                                    type="button" class="btn btn-primary">변 경
                                            </button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="card">
                                <div class="card-header d-flex align-items-center">
                                    <h3 class="h4">FAX</h3>
                                </div>
                                <div class="card-body">
                                    <form>
                                        <div class="form-group">
                                            <label class="form-control-label">FAX 번호</label>
                                            <input id="FAXurl0" type="text" disabled readonly class="form-control"
                                            <c:choose>
                                            <c:when test="${footer.getFAX() eq null || footer.getFAX() == ''}">
                                                   value="비어 있음">
                                            </c:when>
                                            <c:otherwise>
                                                value="${footer.getFAX()}" >
                                            </c:otherwise>
                                            </c:choose>
                                        </div>
                                        <div class="form-group">
                                            <label class="form-control-label">바뀔 번호</label>
                                            <input id="FAXurl1" type="text" placeholder="Change Your Name"
                                                   class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <button onclick="checkInputdata('FAX',$('#FAXurl1').val())"
                                                    type="button" class="btn btn-primary">변 경
                                            </button>
                                        </div>
                                    </form>
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
<script>
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
    function checkInputdata(type, data) {
        if (data === "")
            return false;
        else
            inputajax(type, data);
    }

    function checkInputdatas(type, data, url){
        if(data === "")
            alert("이름을 입력해주세요.");
        else if(url === "")
            alert("url을  입력해주세요.");
        else
            inputsajax(type, data, url);
    }

    function checkInputInstitution(type, data, url, number){
        if(data === "")
            alert("이름을 입력해주세요.");
        else if(url === "")
            alert("url을  입력해주세요.");
        else
            inputInstitutionajax(type, data, url, number);
    }
</script>
</body>
</html>