<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
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
            <form action="/admin/faq.do" method="post">
                <c:if test="${divider eq 'detail'}">
                    <section class="updates">
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-header align-items-center faq">
                                    <h3 class="h4">FAQ(수정)</h3>
                                </div>
                                <div class="card-body">
                                    <div class="form-group row">
                                        <label class="form-control-label m-auto" style="width: 65px;">제목</label>
                                        <div class="col-sm-6">
                                            <input name="title" type="text" class="form-control" id="titlearea"
                                                   value="${faq.getTitle()}">
                                        </div>
                                        <label class="col-sm-3 form-control-label m-auto">${faq.getDate()}</label>
                                    </div>
                                    <div class="form-group row">
                                        <label class="form-control-label"
                                               style="width: 65px; margin: 0px 62.950px;">내용</label>
                                        <div class="col-sm-9">
                                                            <textarea name="content" type="text"
                                                                      class="form-control autosize"
                                                                      placeholder="Contents Placehold" id="txtarea"
                                                                      style="height: 400px;">${faq.getContent()}</textarea>
                                        </div>
                                    </div>
                                    <input type="text" name="no_c" value="${faq.getNo_c()}" style="display: none;">
                                    <input type="text" name="no" value="${faq.getNo()}" style="display: none;">
                                    <input type="text" name="type" value="save" style="display: none;">
                                    <div class="modal-footer" style="border: none">
                                        <button type="button" data-dismiss="modal"
                                                class="btn btn-secondary" onclick="canclebutton()">Close
                                        </button>
                                        <button type="submit" class="btn btn-primary">Save changes</button>
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
                                <div class="card-header align-items-center faq">
                                    <h3 class="h4">FAQ(추가)</h3>
                                </div>
                                <div class="card-body">
                                    <div class="form-group row">
                                        <label class="form-control-label m-auto" style="width: 65px;">제목</label>
                                        <div class="col-sm-6">
                                            <input name="title" type="text" class="form-control" id="titlearea"
                                                   value="">
                                        </div>
                                        <label class="col-sm-3 form-control-label m-auto">${date}</label>
                                    </div>
                                    <div class="form-group row">
                                        <label class="form-control-label"
                                               style="width: 65px; margin: 0px 62.950px;">내용</label>
                                        <div class="col-sm-9">
                                            <textarea name="content" type="text"
                                                      class="form-control autosize"
                                                      placeholder="Contents Placehold" id="txtarea"
                                                      style="height: 400px;"></textarea>
                                        </div>
                                    </div>

                                    <input type="text" name="date" value="${date}" style="display: none;">
                                    <input type="text" name="no_c" value="${no_c}" style="display: none;">
                                    <input type="text" name="type" value="add" style="display: none;">
                                    <div class="modal-footer" style="border: none">
                                        <button type="button" data-dismiss="modal"
                                                class="btn btn-secondary" onclick="canclebutton()">Close
                                        </button>
                                        <button type="submit" class="btn btn-primary">add faq</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </c:if>
            </form>
            <jsp:include page="../../common/admin/admin_footer.jsp"/>
        </div>
    </div>
</div>
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
        }
    })

    function canclebutton() {
        window.location.href = "/admin/faq.do";
    }
</script>
</body>
</html>