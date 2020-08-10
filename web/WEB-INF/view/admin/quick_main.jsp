<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
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
            <section class="dashboard-header">
                <div class="container-fluid">
                    <div class="row">
                        <!--TODO Line Chart -->
                        <form method="post" id="fileUploadForm" enctype="multipart/form-data">
                        <div class="chart col-12" style="display: flex">
                            <c:forEach items="${img}" var="img" varStatus="i">
                            <div class="line-chart-example card">
                                <div class="card-header d-flex align-items-center">
                                    <h3 class="h4">퀵메뉴${i.index + 1}</h3>
                                    <div onclick="delbtn(${i.index})" class="btn btn-primary" style="margin-left: 20px;">x</div>
                                    <input id="quickNumber${i.index + 1}" type="text" style="display: none" value="${img.getNo()}">
                                </div>
                                <div class="card-body" style="width: 160px; height: 160px; position: relative;">
                                    <img class="position-absolute" data-toggle="modal"
                                         data-target="#myModal${i.index + 1}"
                                         style="width: 30px;height: 30px; top: 50%; left: 50%; transform: translate(-50%,-50%); cursor: pointer;"
                                         src="../../../resources/images/overlay_add_button.png"/>
                                    <!-- Modal-->
                                    <div id="myModal${i.index + 1}" tabindex="-1" role="dialog"
                                         aria-labelledby="exampleModalLabel${i.index + 1}"
                                         aria-hidden="true" class="modal fade text-left">
                                            <div role="document" class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h4 id="exampleModalLabel${i.index + 1}" class="modal-title">퀵메뉴 이미지 변경</h4>
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
                                                                       id="inputProfile${i.index + 1}" name="inputProfile"
                                                                       required="" value="${img.getImg().substring("/resources/files/quick/".length())}">
                                                            </div>
                                                            <span id="test" class="btn btn-primary"
                                                                  onclick="selectProfile(${i.index + 1})" style="margin-left: 130px;">업로드</span>
                                                            <input type="file" class="tag-hide" id="inputFile${i.index + 1}"
                                                                   name="inputFile"
                                                                   style="display: none"/>
                                                        </div>
                                                        <p>변경할 URL 기입</p>
                                                        <div class="form-group row">
                                                            <div class="col-sm-6">
                                                                <input type="text"
                                                                       class="form-control"
                                                                       style="width: 340px;"
                                                                       id="inputUrl${i.index + 1}" name="inputUrl"
                                                                       required="" value="${img.getUrl()}">
                                                            </div>
                                                        </div>
                                                        <p>변경할 텍스트 기입</p>
                                                        <div class="form-group row">
                                                            <div class="col-sm-6">
                                                                <input type="text"
                                                                       class="form-control"
                                                                       style="width: 340px;"
                                                                       id="inputText${i.index + 1}" name="inputText"
                                                                       required="" value="${img.getText()}">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" data-dismiss="modal"
                                                                class="btn btn-secondary">취소하기
                                                        </button>
                                                        <button id="savebtn${i.index + 1}" type="submit"
                                                                class="btn btn-primary">
                                                            저장하기
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                    </div>
                                    <div id="imgboxes${img.getNo()}">
                                        <c:choose>
                                            <c:when test="${img.getImg() eq null || img.getImg() eq ''}">
                                                <img id="imgbox${img.getNo()}" class="img-fluid card-img" src="/resources/images/1500x300.png"
                                                     alt="background image" style="height: 120px;"/>
                                            </c:when>
                                            <c:otherwise>
                                                <img id="imgbox${img.getNo()}" class="img-fluid card-img" src="${img.getImg()}"
                                                     alt="background image" style="height: 120px;"/>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                            </div>
                            </c:forEach>
                        </div>
                        </form>
                    </div>
                </div>
            </section>
            <jsp:include page="../../common/admin/admin_footer.jsp"/>
        </div>
    </div>
</div>
<!-- Main File-->
<script>
    var sel_file;
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

    <%for(int i = 1; i<=6; i++) {%>
    $('#savebtn<%=i%>').click(function (event) {
        //preventDefault 는 기본으로 정의된 이벤트를 작동하지 못하게 하는 메서드이다. submit을 막음
        event.preventDefault();
        console.log("아이디 가지고 오는 테스트" + $(this).attr('id'));
        // Get form
        var form = $('#fileUploadForm')[0];
        // Create an FormData object
        var data = new FormData(form);
        var filename = $('#inputProfile<%=i%>').val();
        var no = $('#quickNumber<%=i%>').val();
        var url = $('#inputUrl<%=i%>').val();
        var text = $('#inputText<%=i%>').val();
        quickChangeImg(data, filename, no, url, text);
    });
    <%}%>

    function delbtn(i){
        document.getElementById("imgbox"+(i+1)).src = "/resources/images/1500x300.png";
        quickdelete(i + 1);
    }
    // function test(a, b) {
    //     alert("test: " + a);
    //     alert("test: " + b);
    //     // Get form
    //     var form = $('#fileUploadForm')[0];
    //     // Create an FormData object
    //     var data = new FormData(form);
    //     var filename = $('#inputProfile').val();
    //     quickChangeImg(data, filename);
    // }
</script>
</body>
</html>