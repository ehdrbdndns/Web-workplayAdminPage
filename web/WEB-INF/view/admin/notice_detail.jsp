<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
            <c:if test="${divider eq 'detail'}">
                <section class="updates">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-header align-items-center faq" style="display: flex;">
                                <h3 class="h4">공지사항 수정</h3>
                                <div class="categoryBtn" style="position: absolute; margin-left: 1150px;">
                                    <div class="btn btn-primary" style="cursor: pointer;" data-toggle="modal"
                                         data-target="#Help">?
                                    </div>
                                    <div id="Help" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel1"
                                         aria-hidden="true" class="modal fade text-left">
                                        <div role="document" class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h4 id="exampleModalLabel1" class="modal-title">도움말</h4>
                                                    <button type="button" data-dismiss="modal" aria-label="Close"
                                                            class="close"><span aria-hidden="true">×</span></button>
                                                </div>
                                                <div class="modal-body">
                                                    <jsp:include page="../../common/admin/admin_notice_help.jsp" />
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" data-dismiss="modal"
                                                            class="btn btn-secondary">Close
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="form-group row">
                                    <label class="form-control-label m-auto" style="width: 65px;">제목</label>
                                    <div class="col-sm-6">
                                        <input id="noticeNumber" type="text" name="number" value="${notice.getNo()}"
                                               style="display: none">
                                        <input type="text" class="form-control" id="titlearea" name="title"
                                               value="${notice.getTitle()}">
                                    </div>
                                    <label class="col-sm-3 form-control-label m-auto">${date}</label>
                                    <input id="noticeDate" type="text" style="display: none;" value="${date}">
                                </div>
                                <div class="form-group row">
                                    <label class="form-control-label"
                                           style="width: 65px; margin: 0px 62.950px;">내용</label>
                                    <div class="col-sm-9"
                                         style="border: 1px solid #dee2e6; width: 920px; padding: 16px; margin: 0px 15px;">
                                        <form method="post" id="fileUploadForm" enctype="multipart/form-data">
                                            <c:forEach var="i" begin="1" end="6">
                                                <c:set var="getImg">getImg${i}</c:set>
                                                <c:set var="getContent">getContent${i}</c:set>
                                                <div class="notice-box"
                                                     style="margin-bottom: 8px; max-width: 916.4px; position: relative;">
                                                    <div id="imgboxes${i}" style="position: relative; width: 400px;">
                                                        <div id="imgbox${i}">
                                                            <c:choose>
                                                                <c:when test="${requestScope[getImg] eq null || requestScope[getImg] eq ''}">
                                                                    <img id="quickChange${i}" class="img-fluid card-img"
                                                                         src="/resources/images/1500x300.png"
                                                                         alt="background image"/>
                                                                    <input id="img${i}" type="text"
                                                                           style="display: none">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <img id="quickChange${i}" class="img-fluid card-img"
                                                                         src="${requestScope[getImg]}"
                                                                         alt="background image"/>
                                                                    <input id="img${i}" type="text"
                                                                           style="display: none"
                                                                           value="${requestScope[getImg]}">
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </div>
                                                        <img class="position-absolute" data-toggle="modal"
                                                             data-target="#myModal${i}"
                                                             style="width: 50px;height: 50px; top: 50%; left: 50%; transform: translate(-50%,-50%); cursor: pointer;"
                                                             src="../../../resources/images/overlay_add_button.png"/>
                                                    </div>
                                                    <!-- Modal-->
                                                    <div id="myModal${i}" tabindex="-1" role="dialog"
                                                         aria-labelledby="exampleModalLabel${i}"
                                                         aria-hidden="true" class="modal fade text-left">
                                                        <div role="document" class="modal-dialog">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <h4 id="exampleModalLabel${i}" class="modal-title">
                                                                        이미지
                                                                        변경</h4>
                                                                    <button type="button" data-dismiss="modal"
                                                                            aria-label="Close"
                                                                            class="close"><span
                                                                            aria-hidden="true">×</span>
                                                                    </button>
                                                                </div>
                                                                <div class="modal-body">
                                                                    <p>파일 기입</p>
                                                                    <div class="form-group row">
                                                                        <div class="col-sm-6">
                                                                            <input readonly disabled type="text"
                                                                                   class="form-control"
                                                                                   style="width: 340px;"
                                                                                   id="inputProfile${i}"
                                                                                   name="inputProfile"
                                                                                   required=""
                                                                                   value="${requestScope[getImg].substring("/resources/files/notice/".length())}">
                                                                        </div>
                                                                        <span id="test" class="btn btn-primary"
                                                                              onclick="selectProfile(${i})"
                                                                              style="margin-left: 130px;">업로드</span>
                                                                        <input type="file" class="tag-hide"
                                                                               id="inputFile${i}"
                                                                               name="inputFile"
                                                                               style="display: none"/>
                                                                    </div>
                                                                </div>
                                                                <div class="modal-footer">
                                                                    <div type="button" onclick="resetbtn(${i})"
                                                                         class="btn btn-secondary">초기화
                                                                    </div>
                                                                    <button id="savebtn${i}" type="submit"
                                                                            class="btn btn-primary">
                                                                        저장하기
                                                                    </button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <textarea type="text" class="form-control autosize"
                                                          placeholder="텍스트 입력란" id="txtarea${i}" name="content"
                                                          style="margin-bottom: 28px;">${requestScope[getContent]}</textarea>
                                            </c:forEach>
                                        </form>
                                        <form method="post" id="fileUploadForm2" enctype="multipart/form-data">
                                            <div class="fileboxes">
                                                <c:forEach var="i" begin="1" end="4">
                                                    <c:set var="showFile">showFile${i}</c:set>
                                                    <c:set var="getFile">getFile${i}</c:set>
                                                    <div id="filebox${i}" style="display: flex; margin-bottom: 8px;">
                                                        <input id="sfile${i}" readonly disabled type="text"
                                                               style="background-color: #ffffff; border: 1px solid #dee2e6; width: 520px;"
                                                               placeholder="파일 입력란" value="${requestScope[showFile]}"/>
                                                        <input id="file${i}" type="text" style="display: none" ;
                                                               value="${requestScope[getFile]}"/>
                                                        <div id="fdelbtn${i}" onclick="delbtn(${i})"
                                                             class="btn btn-primary">x
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                            <div class="modal-footer file-box">
                                                <div class="btn btn-primary" data-toggle="modal"
                                                     data-target="#fileModal"
                                                     style="cursor:pointer; border: none;">파일 추가
                                                </div>
                                                <!-- Modal-->
                                                <div id="fileModal" tabindex="-1" role="dialog"
                                                     aria-labelledby="exampleModalLabel"
                                                     aria-hidden="true" class="modal fade text-left">
                                                    <div role="document" class="modal-dialog">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h4 id="exampleModalLabel" class="modal-title">파일
                                                                    추가</h4>
                                                                <button type="button" data-dismiss="modal"
                                                                        aria-label="Close"
                                                                        class="close"><span aria-hidden="true">×</span>
                                                                </button>
                                                            </div>
                                                            <div class="modal-body">
                                                                <p>변경할 이미지 기입</p>
                                                                <div class="form-group row">
                                                                    <div class="col-sm-6">
                                                                        <input readonly disabled type="text"
                                                                               class="form-control"
                                                                               style="width: 340px;"
                                                                               id="showFile" name="showFile"
                                                                               required="" value="">
                                                                    </div>
                                                                    <span class="btn btn-primary"
                                                                          onclick="selectFile()"
                                                                          style="margin-left: 130px;">업로드</span>
                                                                    <input type="file" class="tag-hide" id="inputFiles"
                                                                           name="inputFiles"
                                                                           style="display: none"/>
                                                                </div>
                                                            </div>
                                                            <div class="modal-footer">
                                                                <button type="button" data-dismiss="modal"
                                                                        class="btn btn-secondary">취소하기
                                                                </button>
                                                                <button id="savebtn" type="submit"
                                                                        class="btn btn-primary">
                                                                    저장하기
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" data-dismiss="modal"
                                            class="btn btn-secondary" onclick="canclebutton()">Close
                                    </button>
                                    <button type="button" class="btn btn-primary" onclick="setbutton()">Save changes
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </c:if>
            <c:if test="${divider eq 'add'}">
                <section class="updates">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-header align-items-center faq" style="display: flex;">
                                <h3 class="h4">공지사항 추가</h3>
                                <div class="categoryBtn" style="position: absolute; margin-left: 1150px;">
                                    <div class="btn btn-primary" style="cursor: pointer;" data-toggle="modal"
                                         data-target="#Help">?
                                    </div>
                                    <div id="Help" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel1"
                                         aria-hidden="true" class="modal fade text-left">
                                        <div role="document" class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h4 id="exampleModalLabel1" class="modal-title">도움말</h4>
                                                    <button type="button" data-dismiss="modal" aria-label="Close"
                                                            class="close"><span aria-hidden="true">×</span></button>
                                                </div>
                                                <div class="modal-body">
                                                    <jsp:include page="../../common/admin/admin_notice_help.jsp" />
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" data-dismiss="modal"
                                                            class="btn btn-secondary">Close
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="form-group row">
                                    <label class="form-control-label m-auto" style="width: 65px;">제목</label>
                                    <div class="col-sm-6">
                                        <input type="text" name="number" value="" style="display: none">
                                        <input type="text" class="form-control" id="titlearea" name="title" value="">
                                    </div>
                                    <label class="col-sm-3 form-control-label m-auto">${date}</label>
                                    <input id="noticeDate" type="text" style="display: none;" value="${date}">
                                </div>
                                <div class="form-group row">
                                    <label class="form-control-label"
                                           style="width: 65px; margin: 0px 62.950px;">내용</label>
                                    <div class="col-sm-9"
                                         style="border: 1px solid #dee2e6; width: 920px; padding: 16px; margin: 0px 15px;">
                                        <form method="post" id="fileUploadForm" enctype="multipart/form-data">
                                            <% for (int i = 1; i <= 6; i++) { %>
                                            <div class="notice-box"
                                                 style="margin-bottom: 8px; max-width: 916.4px; position: relative;">
                                                <div id="imgboxes<%=i%>" style="position: relative; width: 400px;">
                                                    <div id="imgbox<%=i%>">
                                                        <img id="quickChange<%=i%>" class="img-fluid card-img"
                                                             src="/resources/images/1500x300.png"
                                                             alt="background image"/>
                                                        <input id="img<%=i%>" type="text" style="display: none">
                                                    </div>
                                                    <img class="position-absolute" data-toggle="modal"
                                                         data-target="#myModal<%=i%>"
                                                         style="width: 50px;height: 50px; top: 50%; left: 50%; transform: translate(-50%,-50%); cursor: pointer;"
                                                         src="../../../resources/images/overlay_add_button.png"/>
                                                </div>
                                                <!-- Modal-->
                                                <div id="myModal<%=i%>" tabindex="-1" role="dialog"
                                                     aria-labelledby="exampleModalLabel<%=i%>"
                                                     aria-hidden="true" class="modal fade text-left">
                                                    <div role="document" class="modal-dialog">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h4 id="exampleModalLabel<%=i%>" class="modal-title">이미지
                                                                    변경</h4>
                                                                <button type="button" data-dismiss="modal"
                                                                        aria-label="Close"
                                                                        class="close"><span aria-hidden="true">×</span>
                                                                </button>
                                                            </div>
                                                            <div class="modal-body">
                                                                <p>변경할 이미지 기입</p>
                                                                <div class="form-group row">
                                                                    <div class="col-sm-6">
                                                                        <input readonly disabled type="text"
                                                                               class="form-control"
                                                                               style="width: 340px;"
                                                                               id="inputProfile<%=i%>"
                                                                               name="inputProfile"
                                                                               required="" value="">
                                                                    </div>
                                                                    <span id="test" class="btn btn-primary"
                                                                          onclick="selectProfile(<%=i%>)"
                                                                          style="margin-left: 130px;">업로드</span>
                                                                    <input type="file" class="tag-hide"
                                                                           id="inputFile<%=i%>"
                                                                           name="inputFile"
                                                                           style="display: none"/>
                                                                </div>
                                                            </div>
                                                            <div class="modal-footer">
                                                                <button type="button" onclick="resetbtn(<%=i%>)"
                                                                        class="btn btn-secondary">초기화
                                                                </button>
                                                                <button id="savebtn<%=i%>" type="submit"
                                                                        class="btn btn-primary">
                                                                    저장하기
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <textarea type="text" class="form-control autosize"
                                                      placeholder="텍스트 입력란" id="txtarea<%=i%>" name="content"
                                                      style="margin-bottom: 28px;"></textarea>
                                            <% } %>
                                        </form>
                                        <form method="post" id="fileUploadForm2" enctype="multipart/form-data">
                                            <div class="fileboxes">
                                                <c:forEach var="i" begin="1" end="4">
                                                    <div id="filebox${i}" style="display: flex; margin-bottom: 8px;">
                                                        <input id="sfile${i}" readonly disabled type="text"
                                                               style="background-color: white; border: 1px solid #dee2e6; width: 520px;"
                                                               placeholder="파일 입력란" value=""/>
                                                        <input id="file${i}" type="text" style="display: none" ;
                                                               value=""/>
                                                        <div id="fdelbtn${i}" onclick="delbtn(${i})"
                                                             class="btn btn-primary">x
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                            <div class="modal-footer file-box">
                                                <div class="btn btn-primary" data-toggle="modal"
                                                     data-target="#fileModal"
                                                     style="cursor:pointer; border: none;">파일 추가
                                                </div>
                                                <!-- Modal-->
                                                <div id="fileModal" tabindex="-1" role="dialog"
                                                     aria-labelledby="exampleModalLabel"
                                                     aria-hidden="true" class="modal fade text-left">
                                                    <div role="document" class="modal-dialog">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h4 id="exampleModalLabel" class="modal-title">파일
                                                                    추가</h4>
                                                                <button type="button" data-dismiss="modal"
                                                                        aria-label="Close"
                                                                        class="close"><span aria-hidden="true">×</span>
                                                                </button>
                                                            </div>
                                                            <div class="modal-body">
                                                                <p>변경할 이미지 기입</p>
                                                                <div class="form-group row">
                                                                    <div class="col-sm-6">
                                                                        <input readonly disabled type="text"
                                                                               class="form-control"
                                                                               style="width: 340px;"
                                                                               id="showFile" name="showFile"
                                                                               required="" value="">
                                                                    </div>
                                                                    <span class="btn btn-primary"
                                                                          onclick="selectFile()"
                                                                          style="margin-left: 130px;">업로드</span>
                                                                    <input type="file" class="tag-hide" id="inputFiles"
                                                                           name="inputFiles"
                                                                           style="display: none"/>
                                                                </div>
                                                            </div>
                                                            <div class="modal-footer">
                                                                <button type="button" data-dismiss="modal"
                                                                        class="btn btn-secondary">취소하기
                                                                </button>
                                                                <button id="savebtn" type="submit"
                                                                        class="btn btn-primary">
                                                                    저장하기
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" data-dismiss="modal"
                                            class="btn btn-secondary" onclick="canclebutton()">Close
                                    </button>
                                    <button type="button" class="btn btn-primary" onclick="setbutton()">Save changes
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </c:if>
            <jsp:include page="../../common/admin/admin_footer.jsp"/>
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
        <%for(int i = 1; i<=6; i++) {%>
        $('#inputFile' + <%=i%>).on("change", handleImageFileSelect);
        <% }%>
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

    function selectProfile(index) {
        $('#inputFile' + index).change(function () {
            var fileValue = $('#inputFile' + index).val().split("\\");
            var fileName = fileValue[fileValue.length - 1];
            $('#inputProfile' + index).val(fileName);
        });
        $('#inputFile' + index).click();
    }

    function selectFile() {
        $('#inputFiles').change(function () {
            var fileValue = $('#inputFiles').val().split("\\");
            var fileName = fileValue[fileValue.length - 1];
            $('#showFile').val(fileName);
        });
        $('#inputFiles').click();
    }

    <%for(int i = 1; i<=6; i++) {%>
    $('#savebtn<%=i%>').click(function (event) {
        //preventDefault 는 기본으로 정의된 이벤트를 작동하지 못하게 하는 메서드이다. submit을 막음
        event.preventDefault();
        // Get form
        var form = $('#fileUploadForm')[0];
        // Create an FormData object
        var data = new FormData(form);
        var filename = $('#inputProfile<%=i%>').val();
        var no = $('#noticeNumber').val();
        var index = <%=i%>;
        noticeChangeImg(no, index, filename, data);
    });
    <%}%>

    $('#savebtn').click(function (event) {
        //preventDefault 는 기본으로 정의된 이벤트를 작동하지 못하게 하는 메서드이다. submit을 막음
        event.preventDefault();
        var form = $('#fileUploadForm2')[0];
        var data = new FormData(form);
        var filename = $('#showFile').val();
        $('#showfile').val('');

        if ($('#sfile1').val() === '') {
            noticeChangeFile(1, filename, data);
        } else if ($('#sfile2').val() === '') {
            noticeChangeFile(2, filename, data);
        } else if ($('#sfile3').val() === '') {
            noticeChangeFile(3, filename, data);
        } else if ($('#sfile4').val() === '') {
            noticeChangeFile(4, filename, data);
        } else {
            alert('4개 이상의 파일을 저장할 수 없습니다.');
        }
    })

    function setbutton() {
        var date = $('#noticeDate').val();
        var no = $('#noticeNumber').val();
        var title = $('#titlearea').val();
        var file = new Array();
        for (var i = 1; i <= 4; i++) {
            file[i] = $('#file' + i).val();
            if (file[i] === "") {
                file[i] = null;
                console.log("파일 체크" + file[i]);
            }
        }
        var img = new Array();
        for (var i = 1; i <= 6; i++) {
            img[i] = $('#quickChange' + i).attr('src');
            if (img[i] === "/resources/images/1500x300.png") {
                console.log("이미지 체크" + img[i]);
                img[i] = null;
            }
        }
        var content = new Array();
        for (var i = 1; i <= 6; i++) {
            content[i] = $('#txtarea' + i).val();
            if (content[i] === "") {
                console.log("count 체크" + content[i]);
                content[i] = null;
            }
        }
        noticeSave(no, title, file, img, content, date);
    }

    function delbtn(i) {
        $('#sfile' + i).val(null);
        $('#file' + i).val(null);
    }

    function canclebutton() {
        window.location.href = "/admin/notice.do";
    }

    function resetbtn(i) {
        $('#inputFile' + i).val('');
        $('#inputProfile' + i).val('');
        $('#img' + i).val('');
        document.getElementById("quickChange" + i).src = "/resources/images/1500x300.png";
    }
</script>
</body>
</html>