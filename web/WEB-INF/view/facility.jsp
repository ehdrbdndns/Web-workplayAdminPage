<%@ page import="models.FacilityMenu" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="models.Facility" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    ArrayList<FacilityMenu> facilityMenus = (ArrayList<FacilityMenu>) request.getAttribute("facilityMenus");
    ArrayList<Facility> facilities = (ArrayList<Facility>) request.getAttribute("facilities");
    Facility facility = (Facility) request.getAttribute("facility");
    request.setAttribute("facilityMenus", facilityMenus);
    request.setAttribute("facility", facility);
    request.setAttribute("facilities", facilities);
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
                <span class="h4">시설 소개</span>
            </div>
        </div>
    </div>
</div>
<!--TODO Banner End-->
<!--TODO Navigation-->

<div class="container navigation-container d-none d-sm-block">
    <div class="navigation mt-4 mb-5 pt-2 pb-3 text-right">
        <span>홈 > 시설소개</span>
    </div>
</div>
<!--TODO Navigation End-->
<!--TODO Menu-->

<div class="container menu-container mt-4 mt-sm-none">
    <div class="menu">
        <div class="row mb-sm-5 mb-0 pb-sm-5 pb-4 justify-content-center">
            <div class="col-md-6 col-12 orange-menu">
                <div class="w-100 bg-main-green">
                    <div class="w-100 orange-button orange-button-line20" onclick="new function() {
                      location.href='/center.do';
                    }">
                        <span class="h4">센터 소개</span>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-12 orange-menu mt-md-0 mt-3">
                <div class="w-100 bg-main-green">
                    <div class="w-100 orange-button orange-active orange-button-line20" onclick="new function() {
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
<!--TODO Facility Menu-->

<div class="container faq-menu-container">
    <div class="list pb-md-5 mb-md-5 pb-3 mb-1">
        <div class="list-group list-group-horizontal justify-content-lg-center justify-content-center row facility-menu">
            <c:forEach items="${facilityMenus}" var="menu" varStatus="status">
                <a href="/facility.do?type=${menu.no}" class="list-group-item h2 text-decoration-none">${menu.menu}</a>
            </c:forEach>
        </div>
    </div>
</div>
<!--TODO Facility Menu End-->
<div class="container-fluid">
    <div class="facility-container mb-md-5 pb-md-5 mb-1 pb-3">
        <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
            <div class="container">
                <div class="carousel-inner">
                    <c:set var="facility_devider" value="${(facility.no+1)/4}"/>
                    <c:forEach varStatus="status" begin="0" end="${(facility_devider+(1-(facility_devider%1))%1)-1}">
                        <c:choose>
                            <c:when test="${status.count eq 1}">
                                <%--0 ~ 4--%>
                                <div class="carousel-item active">
                                    <div class="row">
                                        <c:forEach items="${facilities}" var="facility" begin="${(status.count-1) *4}"
                                                   end="${((status.count) *4)-1}" varStatus="statusImage">
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
                                        <c:forEach items="${facilities}" var="facility" begin="${(status.count-1) *4}"
                                                   end="${((status.count) *4)-1}" varStatus="statusImage">
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
            <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
    </div>
</div>
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
