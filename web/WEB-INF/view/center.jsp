<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <!--TODO META-->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!--TODO META META END-->
    <title>WorkPlayTown</title>
    <jsp:include page="../../common/import_css.jsp" flush="false"/>
</head>
<body class="bg-main-white">
<!--TODO HEADER-->
<jsp:include page="../common/header_mobile.jsp" flush="false"/>
<jsp:include page="../common/header.jsp" flush="false"/>
<!--TODO HEADER END-->
<!--TODO MAIN-->
<!--TODO Banner-->
<div id="carouselExampleSlidesOnly" class="carousel slide" data-ride="carousel">
    <div class="carousel-inner">
        <div class="carousel-item w-100 active page-banner">
            <div class="container pl-4">
                <span class="h4">센터소개</span>
            </div>
        </div>
    </div>
</div>
<!--TODO Banner End-->
<!--TODO Navigation-->
<div class="container navigation-container d-none d-sm-block">
    <div class="navigation mt-4 mb-5 pt-2 pb-3 text-right">
        <span>홈 > 센터 소개</span>
    </div>
</div>
<!--TODO Navigation End-->
<!--TODO Menu-->
<div class="container menu-container mt-4 mt-sm-none">
    <div class="menu">
        <div class="row mb-sm-5 mb-0 pb-sm-5 pb-4 justify-content-center">
            <div class="col-md-6 col-12 orange-menu">
                <div class="w-100 bg-main-green">
                    <div class="w-100 orange-button orange-active orange-button-line20" onclick="new function() {
                      location.href='/center.do';
                    }">
                        <span class="h4">센터 소개</span>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-12 orange-menu mt-md-0 mt-3">
                <div class="w-100 bg-main-green">
                    <div class="w-100 orange-button orange-button-line20" onclick="new function() {
                      location.href='/facility.do';
                    }">
                        <span class="h4">시설 소개</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--TODO Menu End-->
<!--TODO Video-->
<div class="container video-container">
    <div class="video pb-sm-5 pb-4 mb-2 mb-sm-0">
        <img class="img-fluid" src="../../resources/images/center_section_banner.jpg" alt="center-intro-image"/>
    </div>
</div>
<!--TODO Video End-->
<!--TODO Center Intro-->
<div class="container center-intro-container">
    <div class="mb-sm-5 pb-sm-5 mb-0 pb-4">
        <div class="text-center pb-sm-5 pb-4 center-intro-title h2">
            센터소개
        </div>
        <div class="text-center mb-sm-5 pb-sm-5 mb-1 pb-4 center-intro-content h3">
            “강동청년 WORK-PLAY 타운은 청년 창업 기업에게 입주공간과<br/>
            맞춤형 엑셀러레이팅 프로그램을 제공하여 기업의 성장을<br/>
            지원하는 강동구 청년창업 보육 공간입니다”<br/>
        </div>
        <div class="card-deck">
            <div class="card">
                <img class="card-img-top center-card-image" src="../../resources/images/center_section_item_img1.jpg"
                     alt="Card image cap">
                <div class="card-body align-items-center d-flex justify-content-center">
                    <span class="card-title h6 card-line-height">서울시 동남권 지역<br/><span
                            class="card-text h6">청년 창업 성장</span></span>
                </div>
            </div>
            <div class="card">
                <img class="card-img-top center-card-image" src="../../resources/images/center_section_item_img2.jpg"
                     alt="Card image cap">
                <div class="card-body align-items-center d-flex justify-content-center">
                    <span class="card-title h6 card-line-height">창업 공간 및<br/><span
                            class="card-text h6">창업 지원 서비스 제공</span></span>
                </div>
            </div>
            <div class="card">
                <img class="card-img-top center-card-image" src="../../resources/images/center_section_item_img3.jpg"
                     alt="Card image cap">
                <div class="card-body align-items-center d-flex justify-content-center">
                    <span class="card-title h6 card-line-height">창업 교류를 위한<br/><span
                            class="card-text h6">네트워크 공간 제공</span></span>
                </div>
            </div>
            <div class="card">
                <img class="card-img-top center-card-image" src="../../resources/images/center_section_item_img4.jpg"
                     alt="Card image cap">
                <div class="card-body align-items-center d-flex justify-content-center">
                    <span class="card-title h6 card-line-height">창업 유관기관과의<br/><span
                            class="card-text h6">협력 사업 운영</span></span>
                </div>
            </div>
        </div>
    </div>
</div>
<!--TODO Center Intro End-->
<!--TODO MAIN END-->
<!--TODO FOOTER-->
<jsp:include page="../common/footer.jsp" flush="false"/>
<!--TODO FOOTER END-->

<!--TODO JAVASCRIPT'S-->
<jsp:include page="../../common/import_js.jsp" flush="false"/>
<!--TODO JAVASCRIPT'S END-->

<!--TODO CUSTOM_JAVASCRIPT'S-->
<!--TODO CUSTOM_JAVASCRIPT'S END-->
</body>
</html>
