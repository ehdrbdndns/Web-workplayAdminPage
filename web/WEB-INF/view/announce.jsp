<%@ page import="models.Notice" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    ArrayList<Notice> notices = (ArrayList<Notice>) request.getAttribute("notices");
    request.setAttribute("notices", notices);
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
<!--TODO Notice List-->
<div class="container notice-list-container">
    <!-- Load icon library -->
    <!-- The form -->
    <div class="float-right col-md-3 col-12 input-group pb-5 pl-0 pr-0">
        <input type="text" class="form-control notice-search 6h"
               onkeyup="onEnterKeyEventListener($('.notice-search').val())" placeholder="Search for...">
        <span class="input-group-btn notice-search-btn">
            <button class="btn btn-search" type="button"
                    onclick="search($('.notice-search').val())">
                <i class="fa fa-search fa-fw"></i>
            </button>
        </span>
    </div>

    <div class="notice pb-5">
        <div class="table-responsive">
            <table style="table-layout: fixed"
                   class="table table-hover table-sm text-center notice-border-top notice-border-bottom">
                <thead>
                <tr>
                    <th class="d-none d-md-table-cell h5">번호</th>
                    <th class="table-th-title h5">제목</th>
                    <th class="d-none d-md-table-cell h5">파일</th>
                    <th class="h5">날짜</th>
                    <th class="d-none d-md-table-cell h5">조회수</th>
                </tr>
                </thead>
                <tbody id="tbody-notices">
                <tr class="h4"></tr>
                </tbody>
            </table>
        </div>
    </div>
    <div class="notice-navigation pb-sm-5 mb-sm-5 pb-4 mb-1">
        <nav aria-label="Page navigation example">
            <ul id="nav-ul" class="pagination justify-content-center">
                <li class="page-item">
                    <a class="page-link bg-main-white h6" href="#" aria-label="Previous">
                        <span aria-hidden="true" class="h6">&laquo;</span>
                        <span class="sr-only">Previous</span>
                    </a>
                </li>
                <li class="page-item active"><a class="page-link active h6" href="#">1</a></li>
                <li class="page-item"><a class="page-link bg-main-white h6" href="#">2</a></li>
                <li class="page-item"><a class="page-link bg-main-white h6" href="#">3</a></li>
                <li class="page-item">
                    <a class="page-link bg-main-white h6" href="#" aria-label="Next">
                        <span class="h6" aria-hidden="true">&raquo;</span>
                        <span class="sr-only">Next</span>
                    </a>
                </li>
            </ul>
        </nav>
    </div>
</div>
<!--TODO Notice List End-->
<!--TODO MAIN END-->
<%--TODO Modal--%>
<!-- Button trigger modal -->
<button type="button" class="btn btn-primary d-none modal-trigger" data-toggle="modal"
        data-target="#exampleModal"></button>
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">첨부 파일</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-orange" data-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>
</div>
<%--TODO Modal End--%>
<!--TODO FOOTER-->
<jsp:include page="../common/footer.jsp" flush="false"/>
<!--TODO FOOTER END-->
<!--TODO JAVASCRIPT'S-->
<jsp:include page="../../common/import_js.jsp" flush="false"/>
<!--TODO JAVASCRIPT'S END-->
<!--TODO CUSTOM_JAVASCRIPT'S-->
<script>
    var notices;
    $(document).ready(function () {
        /*client search engin을 위해 notices -> js object화 진행*/
        noticeSetting();
    });

    /**
     * 검색창 엔터키 리스너
     * str = 검색문자열
     * 향후 Search(str) 함수 실행
     * */
    function onEnterKeyEventListener(str) {
        if (window.event.keyCode == 13) {
            if (str.length >= 2) {
                search(str);
            } else {
                alert('검색하실 문장 또는 단어가 너무 짧습니다.');
            }
        }
    }

    /**검색
     * str = 검색 문자열
     * 향후 searchSetting 실행
     * */
    function search(str) {
        var notices_temp = notices.slice();
        if (notices_temp != null) {
            var objects = new Array(notices_temp.length);/*개수 파악 하기 위해 javascript는 동적으로 못늘림*/
            var j = 0;
            for (var i = 0; i < notices_temp.length; i++) {
                var object = notices_temp.pop();
                if (object.title == str || object.title.indexOf(str) >= 0) {
                    objects.push(object);
                    j++;
                }
            }
            var searched_objects = new Array(j);/*정확한 검색 개수*/
            for (var i = 0; i < objects.length; i++) {
                var object = objects.pop();
                if (object != undefined) {
                    searched_objects.push(object);
                }
            }
            searchSetting(searched_objects);
        } else {
            alert('검색을 할 수 없는 브라우저 상태입니다. 새로고침을 해주세요.');
        }
    }

    /**검색한걸 View에 넣음
     * searchObjects = 검색한 object들 즉 검색에서 발견된 테이블의 행
     * 향후 removeNotices()와 writeNoticeScreen() 마지막으로 runTable()진행
     * */
    function searchSetting(searchObjects) {
        removeNotices();
        for (var i = 0; i < searchObjects.length; i++) {
            var object = searchObjects.pop();
            writeNoticeScreen(object, i + 1);
        }
        runTableNotice('nav-ul', 'tbody-notices');
    }

    /**초기 테이블 세팅
     * 향후 removeNotices()와 writeNoticeScreen() 마지막으로 runTable()진행
     * */
    function noticeSetting() {
        /*Object ==*/
        /*# no	title	date	file1	file2	file3	file4	img1	img2	img3	img4	img5	img6	content1	content2	content3	content4	content5	content6 count*/
        removeNotices();
        notices = new Array(${notices.size()});
        if (${notices.size() eq 0}) {

        } else {
            <c:forEach items="${notices}" var="notice" varStatus="status">
            var object = new Object();
            object.no = ${notice.no};
            object.title = '${notice.title}';
            object.date = '${notice.str_date}';
            object.file1 = '${notice.file1}';
            object.file2 = '${notice.file2}';
            object.file3 = '${notice.file3}';
            object.file4 = '${notice.file4}';
            object.img1 = '${notice.img1}';
            object.img2 = '${notice.img2}';
            object.img3 = '${notice.img3}';
            object.img4 = '${notice.img4}';
            object.img5 = '${notice.img5}';
            object.img6 = '${notice.img6}';
            object.content1 = '${notice.content1}';
            object.content2 = '${notice.content2}';
            object.content3 = '${notice.content3}';
            object.content4 = '${notice.content4}';
            object.content5 = '${notice.content5}';
            object.content6 = '${notice.content6}';
            object.count = ${notice.count};
            notices.push(object);
            writeNoticeScreen(object, ${status.count});
            </c:forEach>
        }
        runTableNotice('nav-ul', 'tbody-notices');
    }

    /**object 하나를 View에 뿌려줌*/
    function writeNoticeScreen(object, count) {
        var tr_element = document.createElement('tr');
        tr_element.setAttribute('class', 'h4 cursor-pointer');

        var td_number_element = document.createElement('td');
        td_number_element.setAttribute('class', 'd-none d-md-block');
        td_number_element.textContent = '' + count;
        td_number_element.setAttribute('onclick', 'enter(' + object.no + ')');
        tr_element.appendChild(td_number_element);

        var td_title_element = document.createElement('td');
        td_title_element.setAttribute('class', 'text-left table-td-title');
        td_title_element.textContent = '' + object.title;
        td_title_element.setAttribute('onclick', 'enter(' + object.no + ')');
        tr_element.appendChild(td_title_element);

        var td_file_element = document.createElement('td');
        td_file_element.setAttribute('class', 'd-none d-md-block');
        if (object.file1 != '' || object.file2 != '' || object.file3 != '' || object.file4 != '') {
            /*TODO 파일이 있을 때*/
            var img_element = document.createElement('img');
            img_element.setAttribute('src', '../../resources/images/file.svg');
            img_element.setAttribute('alt', 'icon-image');
            img_element.setAttribute('onclick', 'fileClick(\'' + object.file1 + ',' + object.file2 + ',' + object.file3 + ',' + object.file4 + '\')');
            td_file_element.appendChild(img_element);
        } else {
            /*TODO 파일이 없을 때*/
        }
        tr_element.appendChild(td_file_element);

        var td_date_element = document.createElement('td');
        td_date_element.textContent = '' + object.date;
        td_date_element.setAttribute('onclick', 'enter(' + object.no + ')');
        tr_element.appendChild(td_date_element);

        var td_count_element = document.createElement('td');
        td_count_element.setAttribute('class', 'd-none d-md-block');
        td_count_element.setAttribute('onclick', 'enter(' + object.no + ')');
        td_count_element.textContent = '' + object.count;
        tr_element.appendChild(td_count_element);

        var tbody_element = document.getElementById('tbody-notices');
        tbody_element.appendChild(tr_element);
    }

    /**Table을 초기상태로 만들어줌 View에 뿌려지기 직전에, 즉 Clear상태*/
    function removeNotices() {
        var tbody_element = document.getElementById('tbody-notices');
        while (tbody_element.hasChildNodes()) {
            tbody_element.removeChild(tbody_element.firstChild);
        }
        var empty_element = document.createElement('tr');
        empty_element.setAttribute('class', 'h4');
        tbody_element.appendChild(empty_element);
    }

    /**첨부파일 클릭시 일어나는 이벤트*/
    function fileClick(fileStr) {
        $('.modal-body').html('');
        var jsSplit = fileStr.split(',');
        for (var i in jsSplit) {
            if (jsSplit[i] == '' || jsSplit[i] == null || jsSplit[i] == undefined) {
            } else {
                var j = i;
                writeToModalDownloadForm(jsSplit[i], j);
            }
        }
        $('.modal-trigger').click();
    }

    function enter(no) {
        location.href = '/announce_detail.do?announce=' + no;
    }

    function writeToModalDownloadForm(fileStr, j) {
        var html_str = $('.modal-body').html();
        ++j;
        $('.modal-body').html(html_str + '<form class="input-group download p-2" action="/filedownloader.do" method="POST" id="' + 'download-list' + j + '">\n' +
            '            <input readonly type="text" type="text" id="' + 'file' + j + '" name="' + 'file' + j + '"\n' +
            '        value="' + fileStr + '" class="form-control notice-search 6h" placeholder="Recipient\'s username"\n' +
            '        aria-label="Recipient\'s username" aria-describedby="basic-addon2">\n' +
            '            <div class="input-group-append">\n' +
            '            <button class="btn btn-orange" type="submit">다운로드</button>\n' +
            '            </div>\n' +
            '            </form>');
    }
</script>
<!--TODO CUSTOM_JAVASCRIPT'S END-->
</body>
</html>
