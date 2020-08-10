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
                <span class="h4">이용 안내</span>
            </div>
        </div>
    </div>
</div>
<!--TODO Banner End-->
<!--TODO Navigation-->
<div class="container navigation-container d-none d-sm-block">
    <div class="navigation mt-4 mb-5 pt-2 pb-3 text-right">
        <span>홈 > 고객센터 > 이용안내</span>
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
                      location.href='/customer_center.do';
                    }">
                        <span class="h4">이용 안내</span>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-12 orange-menu mt-md-0 mt-3">
                <div class="w-100 bg-main-green">
                    <div class="w-100 orange-button orange-button-line20" onclick="new function() {
                      location.href='/faq.do?category=0';
                    }">
                        <span class="h4">FAQ</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--TODO Menu End-->
<!--TODO Map-->
<div class="container pb-md-5 pb-3 mb-md-5 mb-3">
    <div class="map">
        <div id="map" class="kakao-map-style">
        </div>
    </div>
</div>
<!--TODO Map End-->
<!--TODO Map Information-->
<div class="container mb-md-5 pb-md-5 pb-3 mb-3">
    <div class="row mb-md-5 pb-md-5 pb-3 mb-3">
        <div class="col-md-5 col-12">
            <div class="mr-md-5 map-info-title h2">
                이용 시간
            </div>
            <div class="d-flex justify-content-between align-items-center mr-md-5 pt-3 map-info-content">
                <span class="pl-5 h5">평일</span>
                <span class="h5">09:00 ~ 21:00</span>
            </div>
            <div class="d-flex justify-content-between align-items-center mr-md-5 pt-3 map-info-content">
                <span class="pl-5 h5">주말</span>
                <span class="h5">10:00 ~ 18:00</span>
            </div>
            <div class="d-flex justify-content-between align-items-center mr-md-5 pt-3 map-info-content accent">
                <span class="pl-5 h5"></span>
                <span class="h6">*일요일, 공휴일 휴무</span>
            </div>
        </div>
        <div class="col-md-7 col-12">
            <div class="map-info-title h2">
                오시는 길
            </div>
            <div class="d-flex justify-content-between align-items-center pt-3 map-info-content">
                <span class="pl-md-5 pl-3 h5 mb-auto">주소</span>
                <span class="h5 text-right w-75">서울특별시 강동구 올림픽로 796 4층 강동청년 WORK-PLAY 타운</span>
            </div>
            <div class="d-flex justify-content-between align-items-center pt-3 map-info-content">
                <span class="pl-md-5 pl-3 h5 mb-auto">지하철</span>
                <span class="h5 text-right w-75">지하철 8호선 암사역 1번 출구 (도보 5분)</span>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-12 text-right">
            <a class="btn orange-button orange-button-line20 btn-none"><span class="pr-5 h4">대표 번호</span><span
                    class="h4">070-7709-2033</span></a>
        </div>
    </div>
</div>
<!--TODO Map Information End-->
<!--TODO MAIN END-->
<!--TODO FOOTER-->
<jsp:include page="../common/footer.jsp" flush="false"/>
<!--TODO FOOTER END-->

<!--TODO JAVASCRIPT'S-->
<jsp:include page="../../common/import_js.jsp" flush="false"/>
<jsp:include page="../../common/import_map_js.jsp" flush="false"/>
<!--TODO JAVASCRIPT'S END-->
<script>
    $(document).ready(function () {
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
<!--TODO CUSTOM_JAVASCRIPT'S-->
<!--TODO CUSTOM_JAVASCRIPT'S END-->
</body>
</html>
