<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="models.Notice" %>
<%@ page import="models.Faq" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    ArrayList<Notice> notices = (ArrayList<Notice>) request.getAttribute("notices");
    ArrayList<Faq> faqs = (ArrayList<Faq>) request.getAttribute("faqs");
    request.setAttribute("notices", notices);
    request.setAttribute("faqs", faqs);
%>
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
<!--TODO Remocon-->
<jsp:include page="../common/remocon.jsp" flush="false"/>
<!--TODO Remocon End-->
<!--TODO HEADER-->
<jsp:include page="../common/header_mobile.jsp" flush="false"/>
<jsp:include page="../common/header.jsp" flush="false"/>
<!--TODO HEADER END-->
<!--TODO MAIN-->
<!--TODO Banner-->
<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators d-lg-flex d-md-none d-sm-none d-none">
        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
    </ol>
    <div class="carousel-inner">
        <div class="carousel-item active" data-interval="10000">
            <img src="../../resources/images/banner.jpg" class="d-block w-100" alt="first banner">
            <div class="position-absolute container text-left align-middle d-flex justify-content-center">
                <div class="main-banner-section p-5" style="min-width: 330px; max-width: 559px;">
                    <div class="p-2 pt-4">
                        <h1 class="main-banner-section-title h1">창업 유관기업과의 <br/>협력사업 운영</h1>
                        <h4 class="main-banner-section-subtitle h4 pt-2">강동청년 WORKPLAY타운의 사업소개</h4>
                        <div class="mt-5 pt-5 float-right d-none d-md-block d-sm-none">
                            <button class="btn btn-orange orange-button orange-button-line13" onclick="new function() {
                                location.href='/center.do';
                            }">
                                <span>상세정보 확인하기</span>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="carousel-item" data-interval="2000">
            <img src="../../resources/images/banner.jpg" class="d-block w-100" alt="first banner">
            <div class="position-absolute container text-left align-middle d-flex justify-content-center">
                <div class="main-banner-section p-5" style="min-width: 330px; max-width: 559px;">
                    <div class="p-2 pt-4">
                        <h1 class="main-banner-section-title h1">창업 유관기업과의 <br/>협력사업 운영</h1>
                        <h4 class="main-banner-section-subtitle h4 pt-2">강동청년 WORKPLAY타운의 사업소개</h4>
                        <div class="mt-5 pt-5 float-right d-none d-md-block d-sm-none">
                            <button class="btn btn-orange orange-button orange-button-line13" onclick="new function() {
                                location.href='/center.do';
                            }">
                                <span>상세정보 확인하기</span>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="carousel-item">
            <img src="../../resources/images/banner.jpg" class="d-block w-100" alt="first banner">
            <div class="position-absolute container text-left align-middle d-flex justify-content-center">
                <div class="main-banner-section p-5" style="min-width: 330px; max-width: 559px;">
                    <div class="p-2 pt-4">
                        <h1 class="main-banner-section-title h1">창업 유관기업과의 <br/>협력사업 운영</h1>
                        <h4 class="main-banner-section-subtitle h4 pt-2">강동청년 WORKPLAY타운의 사업소개</h4>
                        <div class="mt-5 pt-5 float-right d-none d-md-block d-sm-none">
                            <button class="btn btn-orange orange-button orange-button-line13" onclick="new function() {
                                location.href='/center.do';
                            }">
                                <span>상세정보 확인하기</span>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon opacity-0" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
        <span class="carousel-control-next-icon opacity-0" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>
<!--TODO Banner End-->
<!--TODO Information Section-->
<div class="section-mt-64 section-mb-64 container">
    <div class="row information">
        <div class="col-md-6 col-12 post-padding">
            <!--TODO Notice-->
            <div class="post-border">
                <div class="p-4 main-section-container bg-white">
                    <div class="d-flex justify-content-between align-items-center w-100 main-section-header">
                        <strong class="text-gray-dark main-section-title h3">공지 사항</strong>
                        <a class="main-section-more h6 small" href="/announce.do">더보기</a>
                    </div>
                    <div class="main-section-contents-all">
                        <c:choose>
                            <c:when test="${notices.size()>=1}">
                                <c:forEach items="${notices}" var="notice" varStatus="status">
                                    <div class="main-section-contents d-flex justify-content-between align-items-center w-100 cursor-pointer"
                                         onclick="new function() {
                                                 location.href = '/announce_detail.do?announce=${notice.no}';
                                                 }">
                                        <span class="main-section-content-item-title h6 mr-3 mr-md-5">${notice.title}</span>
                                        <span class="main-section-content-item-date h6">${notice.str_date}</span>
                                    </div>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <div class="main-section-contents d-flex justify-content-center align-items-center w-100">
                                    <span class="main-section-content-item-title h6 text-center pb-5 pt-5">공지사항 없음</span>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-6 col-12 post-padding">
            <!--TODO FAQ-->
            <div class="post-border">
                <div class="p-4 main-section-container bg-white">
                    <div class="d-flex justify-content-between align-items-center w-100 main-section-header">
                        <strong class="text-gray-dark main-section-title h3">FAQ</strong>
                        <a class="main-section-more h6 small" href="/faq.do">더보기</a>
                    </div>
                    <div class="main-section-contents-all">
                        <c:choose>
                            <c:when test="${faqs.size()>=1}">
                                <c:forEach items="${faqs}" var="faq" varStatus="status">
                                    <div class="main-section-contents d-flex justify-content-between align-items-center w-100">
                                <span class="main-section-content-item-title h6 mr-3 mr-md-5 cursor-pointer"
                                      onclick="new function() {
                                              location.href = '/faq.do?category=0';
                                              }">${faq.title}</span>
                                        <span class="main-section-content-item-date h6">
                                                ${faq.date}
                                        </span>
                                    </div>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <div class="main-section-contents d-flex justify-content-center align-items-center w-100">
                                    <span class="main-section-content-item-title h6 text-center pb-5 pt-5">FAQ 없음</span>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-3 col-6 post-padding">
            <!--TODO 센터 소개-->
            <div class="w-100 p-4 bg-main-orange-light main-small-section">
                <span class="h5 title">센터 소개</span>
                <div class="pt-5">
                    <span class="h6 description">네트워킹 플랫폼 역할 및 기초적인 창업 서비스를 제공하는 열린 공간</span>
                </div>
                <div class="button" onclick="new function() {
                    location.href='/center.do';
                }">
                    <span class="more h6 small">More &gt;&gt;</span>
                </div>
            </div>
        </div>

        <div class="col-md-3 col-6 post-padding">
            <!--TODO 시설 소개-->
            <div class="w-100 p-4 bg-main-orange-green main-small-section">
                <span class="h5 title">시설 소개</span>
                <div class="pt-5">
                    <span class="h6 description">창업 서비스 개발을 위한 센터의 지원 및 이용 공간</span>
                </div>
                <div class="button" onclick="new function() {
                    location.href='/facility.do';
                }">
                    <span class="more h6 small">More &gt;&gt;</span>
                </div>
            </div>
        </div>

        <div class="col-md-3 col-6 post-padding">
            <!--TODO 입주 안내-->
            <div class="w-100 p-4 bg-main-green main-small-section">
                <span class="h5 title">입주 안내</span>
                <div class="pt-5">
                    <span class="h6 description">창업 서비스 네트워킹과 개발 등 지원 혜택을 받기 위한 입주 안내</span>
                </div>
                <div class="button" onclick="new function() {
                    location.href='/move_in.do';
                }">
                    <span class="more h6 small">More &gt;&gt;</span>
                </div>
            </div>
        </div>

        <div class="col-md-3 col-6 post-padding">
            <!--TODO 이용 안내-->
            <div class="w-100 p-4 bg-main-blue main-small-section">
                <span class="h5 title">이용 안내</span>
                <div class="pt-5">
                    <span class="h6 description">센터를 이용하기 위한 요약 정보</span>
                </div>
                <div class="button" onclick="new function() {
                    location.href='/customer_center.do';
                }">
                    <span class="more h6 small">More &gt;&gt;</span>
                </div>
            </div>
        </div>
    </div>
</div>
<!--TODO Information Section End-->
<!--TODO Map Section-->
<div class="bg-main-blue w-100 bg-map">
    <div class="container map-container pl-0 pr-0">
        <div id="map" style="width:100%;height:600px;">
            <div class="position-absolute map-section-container p-5">
                <div class="map-section">
                    <span class="map-title h5">오시는길</span>
                    <div class="row m-p-0 map-content-section pt-5 pb-5">
                        <div class="col-12 col-md-3 map-header">
                            <span>Address.</span>
                        </div>
                        <div class="col-12 col-md-9 map-description">
                            <span>서울특별시 강동구 올림픽로 796 4층 강동청년 workplay 타운</span>
                        </div>
                        <div class="col-12 col-md-3 map-header">
                            <span>Tel.</span>
                        </div>
                        <div class="col-12 col-md-9 map-description">
                            <span>070 - 7709 -2033</span>
                        </div>
                        <div class="col-12 col-md-3 map-header">
                            <span>Fax.</span>
                        </div>
                        <div class="col-12 col-md-9 map-description">
                            <span>02 - 429 - 2030</span>
                        </div>
                        <div class="col-12 col-md-3 map-header">
                            <span>Email.</span>
                        </div>
                        <div class="col-12 col-md-9 map-description">
                            <span>haenaemcenter@gmail.com</span>
                        </div>
                    </div>
                    <button onclick="new function() {
                      location.href='/customer_center.do';
                    }" class="btn btn-orange orange-button orange-button-line-6 float-right">
                        <span class="small">자세히보기
                            <img class="align-bottom pb-2 pl-2"
                                 src="../../resources/images/button_right_arrow.svg" alt="button image"/>
                        </span>
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>
<!--TODo Map Section End-->
<!--TODO MAIN END-->
<!--TODO FOOTER-->
<jsp:include page="../common/footer.jsp" flush="false"/>
<!--TODO FOOTER END-->
<!--TODO JAVASCRIPT'S-->
<jsp:include page="../../common/import_js.jsp" flush="false"/>
<jsp:include page="../../common/import_map_js.jsp" flush="false"/>
<!--TODO JAVASCRIPT'S END-->
<!--TODO CUSTOM_JAVASCRIPT'S-->
<script>
    $(document).ready(function () {
        $('#inputGroupSelect01').change(function () {
            location.href=this.value;
        });
        $('#inputGroupSelect02').change(function () {
            location.href=this.value;
        });
        var mapContainer = document.getElementById('map'), // 지도를 표시할 div
            mapOption = {
                center: new kakao.maps.LatLng(37.552039, 127.128521), // 지도의 중심좌표
                level: 3 // 지도의 확대 레벨
            };
        // 지도를 생성합니다
        var map = new kakao.maps.Map(mapContainer, mapOption);
        // 주소-좌표 변환 객체를 생성합니다
        var geocoder = new kakao.maps.services.Geocoder();
        // 주소로 좌표를 검색합니다
        geocoder.addressSearch('서울특별시 강동구 올림픽로 796 4층 강동청년 workplay 타운', function (result, status) {
            // 정상적으로 검색이 완료됐으면
            if (status === kakao.maps.services.Status.OK) {
                var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
                // 결과값으로 받은 위치를 마커로 표시합니다
                var marker = new kakao.maps.Marker({
                    map: map,
                    position: coords
                });
                // 인포윈도우로 장소에 대한 설명을 표시합니다
                var infowindow = new kakao.maps.InfoWindow({
                    content: '<div style="width:150px;text-align:center;padding:6px 0;">회사 위치</div>'
                });
                infowindow.open(map, marker);

                // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                map.setCenter(coords);
            } else {
                mapContainer = document.getElementById('map'), // 지도를 표시할 div
                    mapOption = {
                        center: new kakao.maps.LatLng(30.450701, 11.570667), // 지도의 중심좌표
                        level: 3 // 지도의 확대 레벨
                    };
                map = new kakao.maps.Map(mapContainer, mapOption);
            }
        });
    });
</script>
<!--TODO CUSTOM_JAVASCRIPT'S END-->
</body>
</html>
