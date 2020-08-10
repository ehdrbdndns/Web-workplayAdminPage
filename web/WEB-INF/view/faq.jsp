<%@ page import="models.Faq" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    ArrayList<Faq> faqs = (ArrayList<Faq>) request.getAttribute("faqs");
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
                <span class="h4">FAQ</span>
            </div>
        </div>
    </div>
</div>
<!--TODO Banner End-->
<!--TODO Navigation-->
<div class="container navigation-container d-none d-sm-block">
    <div class="navigation mt-4 mb-5 pt-2 pb-3 text-right">
        <span>홈 > 고객센터 > FAQ</span>
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
                      location.href='/customer_center.do';
                    }">
                        <span class="h4">이용 안내</span>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-12 orange-menu mt-md-0 mt-3">
                <div class="w-100 bg-main-green">
                    <div class="w-100 orange-button orange-active orange-button-line20" onclick="new function() {
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
<!--TODO FAQ Menu-->
<div class="container faq-menu-container">
    <div class="list pb-md-5 mb-md-5 pb-3 mb-1">
        <div class="list-group list-group-horizontal justify-content-md-between justify-content-center row">
            <a href="/faq.do?category=0" id="all" class="list-group-item h2">전체</a>
            <a href="/faq.do?category=1" id="in" class="list-group-item h2">입주안내</a>
            <a href="/faq.do?category=2" id="use" class="list-group-item h2">시설이용</a>
            <a href="/faq.do?category=3" id="giving" class="list-group-item h2">대관안내</a>
            <a href="/faq.do?category=4" id="etc" class="list-group-item h2">기타</a>
        </div>
    </div>
</div>
<!--TODO FAQ Menu End-->
<!--TODO FAQ List-->
<div class="container">
    <div class="faq-list pb-md-5 mb-md-5 pb-3 mb-1">
        <div class="list-group mb-5" id="faq-body">
            <c:forEach items="${faqs}" var="faq" varStatus="status">
                <c:choose>
                    <c:when test="${status.count eq 1}">
                        <div class="faq-item d-none">
                        </div>
                        <div class="faq-item">
                            <a class="list-group-item list-group-item-action list-group-item-title d-flex w-100">
                                <img class="list-group-item-image" width="30" height="30" alt="button-image"
                                     src="../../resources/images/question.svg">
                                <span class="h4 text-left mb-0 list-group-item-title-content">${faq.title}</span>
                                <button class="btn m-0 p-0 ml-auto list-group-item-button" type="button"
                                        onclick="new function() {
                                                if($('#button-img${status.count}').hasClass('push')){
                                                $('#button-img${status.count}').removeClass('push');
                                                $('#button-img${status.count}').attr('src','../../resources/images/down_arrow.svg');
                                                }
                                                else{
                                                $('#button-img${status.count}').addClass('push');
                                                $('#button-img${status.count}').attr('src','../../resources/images/up_arrow.svg');
                                                }
                                                }"
                                        data-toggle="collapse" data-target="#collapseExample${status.count}"
                                        aria-expanded="true" aria-controls="collapseExample${status.count}">
                                    <img width="30" height="30" alt="button-image" id="button-img${status.count}"
                                         src="../../resources/images/down_arrow.svg">
                                </button>
                            </a>
                            <div class="list-group-item list-group-item-bg collapse h6"
                                 id="collapseExample${status.count}">
                                <div class="list-group-item-content">
                                        ${faq.content}
                                </div>
                            </div>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="faq-item">
                            <a class="list-group-item list-group-item-action list-group-item-title d-flex w-100">
                                <img class="list-group-item-image" width="30" height="30" alt="button-image"
                                     src="../../resources/images/question.svg">
                                <span class="h4 text-left mb-0 list-group-item-title-content">${faq.title}</span>
                                <button class="btn m-0 p-0 ml-auto list-group-item-button" type="button"
                                        onclick="new function() {
                                                if($('#button-img${status.count}').hasClass('push')){
                                                $('#button-img${status.count}').removeClass('push');
                                                $('#button-img${status.count}').attr('src','../../resources/images/down_arrow.svg');
                                                }
                                                else{
                                                $('#button-img${status.count}').addClass('push');
                                                $('#button-img${status.count}').attr('src','../../resources/images/up_arrow.svg');
                                                }
                                                }"
                                        data-toggle="collapse" data-target="#collapseExample${status.count}"
                                        aria-expanded="true" aria-controls="collapseExample${status.count}">
                                    <img width="30" height="30" alt="button-image" id="button-img${status.count}"
                                         src="../../resources/images/down_arrow.svg">
                                </button>
                            </a>
                            <div class="list-group-item list-group-item-bg collapse h6"
                                 id="collapseExample${status.count}">
                                <div class="list-group-item-content">
                                        ${faq.content}
                                </div>
                            </div>
                        </div>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </div>
        <nav aria-label="Page navigation example">
            <ul id="nav-ul" class="pagination justify-content-center">
            </ul>
        </nav>
    </div>
</div>
<!--TODO FAQ List End-->
<!--TODO MAIN END-->
<!--TODO FOOTER-->
<jsp:include page="../common/footer.jsp" flush="false"/>
<!--TODO FOOTER END-->

<!--TODO JAVASCRIPT'S-->
<jsp:include page="../../common/import_js.jsp" flush="false"/>
<!--TODO JAVASCRIPT'S END-->
<!--TODO CUSTOM_JAVASCRIPT'S-->
<script>
    $(document).ready(function () {
        if (${faqs.size()>=1}) {
            runTableFaq('nav-ul', 'faq-body');
        } else {
        }

    });
</script>
<!--TODO CUSTOM_JAVASCRIPT'S END-->
</body>
</html>
