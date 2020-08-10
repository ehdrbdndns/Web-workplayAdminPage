<%@ page import="models.Notice" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    Notice notice = (Notice) request.getAttribute("notice");
    request.setAttribute("notice", notice);
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
                <span class="h4">공지 사항</span>
            </div>
        </div>
    </div>
</div>
<!--TODO Banner End-->
<!--TODO Navigation-->
<div class="container navigation-container d-none d-sm-block">
    <div class="navigation mt-4 mb-5 pt-2 pb-3 text-right">
        <span>홈 > 공지사항</span>
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
                      location.href='/announce.do';
                    }">
                        <span class="h4">공지 사항</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--TODO Menu End-->
<!--TODO Notice Detail-->
<div class="container notice-detail-container">
    <!--TODO Title-->
    <div class="mb-md-5 mb-3">
        <div class="bg-main-orange notice-detail-title h3">
            ${notice.title}
        </div>
    </div>
    <!--TODO Title End-->
    <!--TODO Date-->
    <div class="navigation mt-md-4 pt-2 mb-md-4 mb-4 pt-md-2 pb-md-2 text-right">
        <span>등록일자</span><span class="pl-2">${notice.str_date}</span>
        <span class="pl-4">조회수</span><span class="pl-2">${notice.count}</span>
        <c:if test="${not empty notice.file1}">
            <span class="mt-2 pl-4 row"></span>
            <form action="/filedownloader.do" method="POST" id="download-list1">
                <input readonly type="text" type="text" id="file1" name="file1"
                       value="${notice.file1}" class="form-control notice-search 6h d-none"
                       placeholder="Recipient's username"
                       aria-label="Recipient's username" aria-describedby="basic-addon2">
                <span class="fas fa-file pl-2 cursor-pointer" onclick="filedownload(1)">
                    <span class="pl-2">${fn:substring(notice.file1,13,notice.file1.length())}</span>
                </span>
            </form>
        </c:if>
        <c:if test="${not empty notice.file2}">
            <span class="pl-4 row"></span>
            <form action="/filedownloader.do" method="POST" id="download-list2">
                <input readonly type="text" type="text" id="file2" name="file2"
                       value="${notice.file2}" class="form-control notice-search 6h d-none"
                       placeholder="Recipient's username"
                       aria-label="Recipient's username" aria-describedby="basic-addon2">
                <span class="fas fa-file pl-2 cursor-pointer" onclick="filedownload(2)">
                    <span class="pl-2">${fn:substring(notice.file2,13,notice.file2.length())}</span>
                </span>
            </form>
        </c:if>
        <c:if test="${not empty notice.file3}">
            <span class="pl-4 row"></span>
            <form action="/filedownloader.do" method="POST" id="download-list3">
                <input readonly type="text" type="text" id="file3" name="file3"
                       value="${notice.file3}" class="form-control notice-search 6h d-none"
                       placeholder="Recipient's username"
                       aria-label="Recipient's username" aria-describedby="basic-addon2">
                <span class="fas fa-file pl-2 cursor-pointer" onclick="filedownload(3)">
                    <span class="pl-2">${fn:substring(notice.file3,13,notice.file3.length())}</span>
                </span>
            </form>
        </c:if>
        <c:if test="${not empty notice.file4}">
            <span class="pl-4 row"></span>
            <form action="/filedownloader.do" method="POST" id="download-list4">
                <input readonly type="text" type="text" id="file4" name="file4"
                       value="${notice.file4}" class="form-control notice-search 6h d-none"
                       placeholder="Recipient's username"
                       aria-label="Recipient's username" aria-describedby="basic-addon2">
                <span class="fas fa-file pl-2 cursor-pointer" onclick="filedownload(4)">
                    <span class="pl-2">${fn:substring(notice.file4,13,notice.file4.length())}</span>
                </span>
            </form>
        </c:if>
    </div>
    <!--TODO Date End-->
    <!--TODO Img-->
    <div class="announce_detail_scroll">
        <c:if test="${not empty notice.img1}">
            <div class="pb-md-5 pb-4 mb-md-5">
                <img class="w-100" src="<%=request.getContextPath()%>${notice.img1}"/>
            </div>
        </c:if>
        <c:if test="${not empty notice.content1}">
            <div class="pb-md-5 mb-md-5 pb-4">
                    ${notice.content1}
            </div>
        </c:if>
        <c:if test="${not empty notice.img2}">
            <div class="pb-md-5 pb-4 mb-md-5">
                <img class="w-100" src="<%=request.getContextPath()%>${notice.img2}"/>
            </div>
        </c:if>
        <c:if test="${not empty notice.content2}">
            <div class="pb-md-5 mb-md-5 pb-4">
                    ${notice.content2}
            </div>
        </c:if>
        <c:if test="${not empty notice.img3}">
            <div class="pb-md-5 pb-4 mb-md-5">
                <img class="w-100" src="<%=request.getContextPath()%>${notice.img3}"/>
            </div>
        </c:if>
        <c:if test="${not empty notice.content3}">
            <div class="pb-md-5 mb-md-5 pb-4">
                    ${notice.content3}
            </div>
        </c:if>
        <c:if test="${not empty notice.img4}">
            <div class="pb-md-5 pb-4 mb-md-5">
                <img class="w-100" src="<%=request.getContextPath()%>${notice.img4}"/>
            </div>
        </c:if>
        <c:if test="${not empty notice.content4}">
            <div class="pb-md-5 mb-md-5 pb-4">
                    ${notice.content4}
            </div>
        </c:if>
        <c:if test="${not empty notice.img5}">
            <div class="pb-md-5 pb-4 mb-md-5">
                <img class="w-100" src="<%=request.getContextPath()%>${notice.img5}"/>
            </div>
        </c:if>
        <c:if test="${not empty notice.content5}">
            <div class="pb-md-5 mb-md-5 pb-4">
                    ${notice.content5}
            </div>
        </c:if>
        <c:if test="${not empty notice.img6}">
            <div class="pb-md-5 pb-4 mb-md-5">
                <img class="w-100" src="<%=request.getContextPath()%>${notice.img6}"/>
            </div>
        </c:if>
        <c:if test="${not empty notice.content6}">
            <div class="pb-md-5 mb-md-5 pb-4">
                    ${notice.content6}
            </div>
        </c:if>
        <!--TODO Img End-->
        <!--TODO Text Section-->
        <%--<div class="pb-md-5 mb-md-5 pb-4">
            [강동구 청년해냄센터 입주기업 모집]
            • 모집기간 : 마감되었습니다.
            • 선발규모 : 독립형 입주공간 3개 기업/코워킹 스페이스 입주공간 1개 기업
            • 신청자격 : 1)공통자격 : 청년 (만 19세 ~ 만 39세 이하)
            2)독립형 입주공간 : 예비창업자 ~ 3년 미만 기창업자
            3)코워킹 스페이스 입주공간 : 예비창업자 ~ 1년 미만 기창업자
            4)공고일 현재 주민등록상 주소지가 서울인 자
            • 공간안내 : www.창업카페천호.com
            • 문의처 : 02-488-6881
            [강동구 청년해냄센터 입주기업 모집]
            • 모집기간 : 마감되었습니다.
            • 선발규모 : 독립형 입주공간 3개 기업/코워킹 스페이스 입주공간 1개 기업
            • 신청자격 : 1)공통자격 : 청년 (만 19세 ~ 만 39세 이하)
            2)독립형 입주공간 : 예비창업자 ~ 3년 미만 기창업자
            3)코워킹 스페이스 입주공간 : 예비창업자 ~ 1년 미만 기창업자
            4)공고일 현재 주민등록상 주소지가 서울인 자
            • 공간안내 : www.창업카페천호.com
            • 문의처 : 02-488-6881
        </div>--%>
    </div>
    <!--TODO Text Section End-->
</div>
<!--TODO Notice Detail End-->
<!--TODO MAIN END-->
<!--TODO FOOTER-->
<jsp:include page="../common/footer.jsp" flush="false"/>
<!--TODO FOOTER END-->

<!--TODO JAVASCRIPT'S-->
<jsp:include page="../../common/import_js.jsp" flush="false"/>
<!--TODO JAVASCRIPT'S END-->

<!--TODO CUSTOM_JAVASCRIPT'S-->
<script>
    function filedownload(type) {
        $('#download-list'+type).submit();
    }
</script>
<!--TODO CUSTOM_JAVASCRIPT'S END-->
</body>
</html>
