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
                <span class="h4">입주 안내</span>
            </div>
        </div>
    </div>
</div>
<!--TODO Banner End-->
<!--TODO Navigation-->
<div class="container navigation-container d-none d-sm-block">
    <div class="navigation mt-4 mb-5 pt-2 pb-3 text-right">
        <span>홈 > 입주안내</span>
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
                      location.href='/move_in.do';
                    }">
                        <span class="h4">입주 안내</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--TODO Menu End-->
<!--TODO Office Intro-->
<div class="container office-intro-container mb-md-4 pb-md-5">
    <div class="office row">
        <div class="col-md-6 col-12 order-1 m-p-0">
            <div class="office-card">
                <img src="../../resources/images/move_in_section1_item1.jpg" alt="move_in office" class="img-fluid"/>
            </div>
            <div class="office-card">
                <img src="../../resources/images/move_in_section1_item2.jpg" alt="move_in office" class="img-fluid"/>
            </div>
        </div>
        <div class="col-md-6 col-12 order-2 m-p-0">
            <div class="office-card">
                <img src="../../resources/images/move_in_section1_bg.jpg" alt="move_in office" class="img-fluid"/>
            </div>
        </div>
    </div>
</div>
<div class="container office-intro-container mb-md-5 pb-md-5 pb-4 mb-3">
    <div class="office row">
        <div class="col-md-6 col-12 order-2 m-p-0">
            <div class="office-card col-12">
                <img src="../../resources/images/move_in_section2_bg.jpg" alt="move_in office" class="img-fluid"/>
            </div>
        </div>
        <div class="col-md-6 col-12 order-1 order-md-2 m-p-0">
            <div class="office-card col-12">
                <%--<img src="http://via.placeholder.com/570x290" alt="move_in office" class="img-fluid"/>--%>
                <img src="../../resources/images/move_in_section1_item1.jpg" alt="move_in office" class="img-fluid"/>
            </div>
            <div class="office-card col-12">
                <img src="../../resources/images/move_in_section1_item2.jpg" alt="move_in office" class="img-fluid"/>
            </div>
        </div>
    </div>
</div>
<!--TODO Office Intro End-->
<!--TODO Support Method-->
<div class="support-method-container-root">
    <div class="support-method-container">
        <div class="support">
            <picture>
                <source media="(min-width:768px)" srcset="../../resources/images/move_in_method1_bg.jpg">
                <img id="move_in_method1" class="w-100" src="../../resources/images/move_in_method1_bg_m.jpg"
                     alt="support image"/>
            </picture>
        </div>
    </div>
</div>
<!--TODO Support Method End-->

<!--TODO Selection Method Method-->
<div class="selection-method-container-root pb-5">
    <div class="support-method-container">
        <div class="support">
            <picture>
                <source media="(min-width:768px)" srcset="../../resources/images/move_in_method2_bg.jpg">
                <img id="move_in_method2" class="w-100" src="../../resources/images/move_in_method2_bg_m.jpg"
                     alt="support image"/>
            </picture>
        </div>
    </div>
</div>
<!--TODO Selection Method End-->

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
