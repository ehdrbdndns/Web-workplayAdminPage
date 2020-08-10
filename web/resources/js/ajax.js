function replySubmit(no) {
    var object = new Object();
    var str = document.getElementById("modal-reply-content").value;
    str = str.replace(/(?:\r\n|\r|\n)/g, '<br />');

    object.no = no;
    object.comment = str;
    var jsonObject = JSON.stringify(object);
    $.ajax({
        type: "GET", //전송방식을 지정한다 (POST,GET)
        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
        url: "/reply.ajax",//호출 URL을 설정한다. GET방식일경우 뒤에 파라티터를 붙여서 사용해도된다.
        data: {
            "type": 'reply',
            "value": jsonObject,
        },
        dataType: "text",//호출한 페이지의 형식이다. xml,json,html,text등의 여러 방식을 사용할 수 있다.
        error: function () {
            console.log('Auth Ajax Failed');
            alert('Error');
        },
        success: function (Parse_data) {
            console.log(Parse_data);
            if (Parse_data != null) {
                var string = Parse_data + '';
                if (string.indexOf("error") >= 0) {
                    alert('Error');
                } else if (string.indexOf("true") >= 0) {
                    alert('코멘트 등록 성공');
                    location.href = '#'
                } else {
                    alert('코멘트 등록 실패');
                    location.href = '#'
                }
            } else {
                alert('서버에러');
                location.href = '#'
            }
        }
    });
}

function pageajax(tp, num) {
    $.ajax({
        type: "GET", //전송방식을 지정한다 (POST,GET)
        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
        url: "/admin/pagenav.ajax",//호출 URL을 설정한다. GET방식일경우 뒤에 파라티터를 붙여서 사용해도된다.
        data: {
            "type": tp,
            "value": num
        },
        dataType: "json",//호출한 페이지의 형식이다. xml,json,html,text등의 여러 방식을 사용할 수 있다.
        error: function () {
            console.log('qna Ajax Failed');
            alert('Error');
        },
        success: function (Parse_data) {
            if (Parse_data != null) {
                //console.log(moment(Parse_data.qna[0].req_Date).format("YYYY-MM-DD"));
                var pageContent = document.getElementById("pageContent");
                var pageNav = document.getElementById("pagenav");
                var pagehtml = "";
                var pagenavhtml = "";
                // qna length 만큼 테이블 작성
                for (var i = 0; i < Parse_data.notice.length; i++) {
                    pagehtml += '<tr>' +
                        '<th>' + Parse_data.notice[i].str_date + '</th>' +
                        '<td>' + Parse_data.notice[i].title + '</td>' +
                        '<td><a href="/admin/notice.do?type=del&num=' + Parse_data.notice[i].no + '"' +
                        'class="btn btn-primary"><span>삭제</span></a></td>' +
                        '<td><a href="/admin/notice.do?type=detail&num=' + Parse_data.notice[i].no + '"' +
                        'class="btn btn-primary"><span>수정</span></a></td>' +
                        '<tr>'
                }
                if (Parse_data.pageMakerPrev == true) {
                    console.log("존재")
                    pagenavhtml += '<li class="page-item"><a onclick=pageajax("' + tp + '",1) class="page-link">First</a></li>' +
                        '<li class="page-item">' +
                        '<a onclick=pageajax("' + tp + '",' + (Parse_data.pageMakerStartpage - 1) + ') class="page-link" aria-label="Previous">' +
                        '<span aria-hidden="true">&laquo;</span>' +
                        '<span class="sr-only">Previous</span>' +
                        '</a>' +
                        '</li>'
                } else {
                    console.log("안 존재")
                    pagenavhtml += '<li class="page-item disabled"><a class="page-link">First</a></li>' +
                        '<li class="page-item disabled">' +
                        '<a class="page-link" aria-label="Previous">' +
                        '<span aria-hidden="true">&laquo;</span>' +
                        '<span class="sr-only">Previous</span>' +
                        '</a>' +
                        '</li>'
                }

                for (var j = Parse_data.pageMakerStartpage; j <= Parse_data.pageMakerEndpage; j++) {
                    if (j == Parse_data.pageMakerCripage) {
                        pagenavhtml += '<li class="page-item active"><a class="page-link">' + j + '</a></li>';
                    } else {
                        pagenavhtml += '<li class="page-item"><a onclick=pageajax("' + tp + '",' + j + ') class="page-link">' + j + '</a></li>';
                    }
                }

                if (Parse_data.pageMakerNext && (Parse_data.pageMakerEndpage > 0)) {
                    pagenavhtml += '<li class="page-item">' +
                        '<a onclick=pageajax("' + tp + '",' + (Parse_data.pageMakerEndpage + 1) + ') class="page-link" aria-label="Next">' +
                        '<span aria-hidden="true">&raquo;</span>' +
                        '<span class="sr-only">Next</span>' +
                        '</a>' +
                        '</li>' +
                        '<li class="page-item"><a onclick=pageajax("' + tp + '",-1) class="page-link">Last</a></li>'
                } else {
                    pagenavhtml += '<li class="page-item disabled">' +
                        '<a class="page-link" aria-label="Next">' +
                        '<span aria-hidden="true">&raquo;</span>' +
                        '<span class="sr-only">Next</span>' +
                        '</a>' +
                        '</li>' +
                        '<li class="page-item disabled"><a class="page-link">Last</a></li>'
                }

                pageContent.innerHTML = pagehtml;
                pageNav.innerHTML = pagenavhtml;
            } else {
                alert('서버에러');
            }
        }
    });
}

function inputajax(tp, value) {
    $.ajax({
        type: "GET", //전송방식을 지정한다 (POST,GET)
        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
        url: "/admin/inputdata.ajax",//호출 URL을 설정한다. GET방식일경우 뒤에 파라티터를 붙여서 사용해도된다.
        data: {
            "type": tp,
            "value": value
        },
        dataType: "json",//호출한 페이지의 형식이다. xml,json,html,text등의 여러 방식을 사용할 수 있다.
        error: function () {
            console.log('qna Ajax Failed');
            alert('Error');
        },
        success: function (Parse_data) {
            console.log("뭐셔");
            if (Parse_data != null) {
                //console.log(moment(Parse_data.qna[0].req_Date).format("YYYY-MM-DD"));
                $('#' + tp + 'url1').val("");
                $('#' + tp + 'url0').val(value);
            } else {
                alert('서버에러');
            }
        }
    });
}

function inputsajax(tp, value, url) {
    $.ajax({
        type: "GET", //전송방식을 지정한다 (POST,GET)
        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
        url: "/admin/inputdata.ajax",//호출 URL을 설정한다. GET방식일경우 뒤에 파라티터를 붙여서 사용해도된다.
        data: {
            "type": tp,
            "value": value,
            "url": url
        },
        dataType: "json",//호출한 페이지의 형식이다. xml,json,html,text등의 여러 방식을 사용할 수 있다.
        error: function () {
            console.log('qna Ajax Failed');
            alert('Error');
        },
        success: function (Parse_data) {
            if (Parse_data != null) {
                //console.log(moment(Parse_data.qna[0].req_Date).format("YYYY-MM-DD"));
                $('#' + tp + 'url1').val("");
                $('#' + tp + 'url2').val("");
                $('#' + tp + 'url0').val(value);   //name
                $('#' + tp + 'url3').val(url);   //url
            } else {
                alert('서버에러');
            }
        }
    });
}

function inputInstitutionajax(tp, value, url) {
    $.ajax({
        type: "GET", //전송방식을 지정한다 (POST,GET)
        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
        url: "/admin/inputdata.ajax",//호출 URL을 설정한다. GET방식일경우 뒤에 파라티터를 붙여서 사용해도된다.
        data: {
            "type": tp,
            "value": value,
            "url": url
        },
        dataType: "json",//호출한 페이지의 형식이다. xml,json,html,text등의 여러 방식을 사용할 수 있다.
        error: function () {
            console.log('qna Ajax Failed');
            alert('Error');
        },
        success: function (Parse_data) {
            if (Parse_data != null) {
                window.location.href = "/admin/footer.do";
            } else {
                alert('서버에러');
            }
        }
    });
}

function checkDeletInstitution(tp, number) {
    $.ajax({
        type: "GET", //전송방식을 지정한다 (POST,GET)
        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
        url: "/admin/deletedata.ajax",//호출 URL을 설정한다. GET방식일경우 뒤에 파라티터를 붙여서 사용해도된다.
        data: {
            "type": tp,
            "number": number
        },
        dataType: "json",//호출한 페이지의 형식이다. xml,json,html,text등의 여러 방식을 사용할 수 있다.
        error: function () {
            console.log('qna Ajax Failed');
            alert('Error');
        },
        success: function (Parse_data) {
            if (Parse_data != null) {
                window.location.href = "/admin/footer.do";
            } else {
                alert('서버에러');
            }
        }
    });
}

function quickChangeImg(data, filename, no, url, text) {
    $.ajax({
        type: "POST",
        enctype: 'multipart/form-data',
        url: "/admin/quickImg.ajax",
        data: data,
        processData: false,
        contentType: false,
        cache: false,
        timeout: 600000,
        dataType: "json",
        error: function () {
            console.log("ERROR : ", '');
            alert("위야...? quick ajax err");
        },
        success: function (data) {
            $.ajax({
                type: "POST", //전송방식을 지정한다 (POST,GET)
                contentType: "application/x-www-form-urlencoded; charset=UTF-8",
                url: "/admin/quickImg.ajax",//호출 URL을 설정한다. GET방식일경우 뒤에 파라티터를 붙여서 사용해도된다.
                data: {
                    "type": "restore",
                    "file": filename,
                    "no": no,
                    "url": url,
                    "text": text
                },
                dataType: "json",//호출한 페이지의 형식이다. xml,json,html,text등의 여러 방식을 사용할 수 있다.
                error: function () {
                    console.log('qna Ajax Failed');
                    alert('아래야? Error');
                },
                success: function (Parse_data) {
                    var imgbox = document.getElementById("imgboxes" + Parse_data.no);
                    var pagehtml = "";
                    pagehtml += '<img id="imgbox' + Parse_data.no + '" class="img-fluid card-img" src="" alt="background image" style="height: 120px;"/>';
                    imgbox.innerHTML = pagehtml;
                    console.log("파일 이름: " + filename);
                    $('#imgbox' + Parse_data.no).attr('src', Parse_data.filename + '');
                }
            });
        }
    });
}


function quickdelete(no){
    $.ajax({
        type: "POST", //전송방식을 지정한다 (POST,GET)
        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
        url: "/admin/quickImg.ajax",//호출 URL을 설정한다. GET방식일경우 뒤에 파라티터를 붙여서 사용해도된다.
        data: {
            "type": "del",
            "no": no
        },
        dataType: "json",//호출한 페이지의 형식이다. xml,json,html,text등의 여러 방식을 사용할 수 있다.
        error: function () {
            console.log('qna Ajax Failed');
            alert('아래야? Error');
        },
        success: function (Parse_data) {
            $('#inputProfile' + no).val("");
            $('#inputFile' + no).val("");
            $('#inputUrl' + no).val("");
            $('#inputText' + no).val("");
        }
    });
}

function noticeChangeFile(no, filename, data){
    $.ajax({
        type: "POST",
        enctype: 'multipart/form-data',
        url: "/admin/noticeImg.ajax",
        data: data,
        processData: false,
        contentType: false,
        cache: false,
        timeout: 600000,
        dataType: "json",
        error: function () {
            console.log("ERROR : ");
            alert("위야...? notice ajax err");
        },
        success: function (data) {
            var filebox = document.getElementById("filebox" + no);
            var pagehtml = "";
            pagehtml += '<input id="sfile' + no + '" readonly disabled type="text"' +
                'style="background-color: white; border: 1px solid #dee2e6; width: 520px;" placeholder="파일 입력란" value=""/>';
            pagehtml += '<input id="file' + no + '" type="text" style="display: none"; value=""/>';
            pagehtml += '<div id="fdelbtn${'+ no +'}" onclick="delbtn('+ no +')" class="btn btn-primary">x</div>'
            filebox.innerHTML = pagehtml;
            $('#sfile' + no).attr('value', filename);
            $('#file' + no).attr('value', "/resources/files/notice/" + filename);
        }
    });
}

function noticeChangeImg(no, index, filename, data) {
    $.ajax({
        type: "POST",
        enctype: 'multipart/form-data',
        url: "/admin/noticeImg.ajax",
        data: data,
        processData: false,
        contentType: false,
        cache: false,
        timeout: 600000,
        dataType: "json",
        error: function () {
            console.log("ERROR : ");
            alert("위야...? notice ajax err");
        },
        success: function (data) {
            var imgbox = document.getElementById("imgbox" + index);
            var pagehtml = "";
            pagehtml += '<img id="quickChange' + index + '" class="img-fluid card-img" src="" alt="background image" style="max-width: 916.4px;"/>';
            imgbox.innerHTML = pagehtml;
            $('#quickChange' + index).attr('src', "/resources/files/notice/" + filename);
        }
    });
}

function noticeSave(no, title, file, img, content, date){
    if(no != null) {
        console.log("img: " + img);
        console.log("content: " + content);
        $.ajax({
            type: "GET", //전송방식을 지정한다 (POST,GET)
            contentType: "application/x-www-form-urlencoded; charset=UTF-8",
            url: "/admin/noticeImg.ajax",//호출 URL을 설정한다. GET방식일경우 뒤에 파라티터를 붙여서 사용해도된다.
            data: {
                "type": "save",
                "no": no,
                "title": title,
                "file[1]": file[1],
                "file[2]": file[2],
                "file[3]": file[3],
                "file[4]": file[4],
                "img[1]": img[1],
                "img[2]": img[2],
                "img[3]": img[3],
                "img[4]": img[4],
                "img[5]": img[5],
                "img[6]": img[6],
                "content[1]": content[1],
                "content[2]": content[2],
                "content[3]": content[3],
                "content[4]": content[4],
                "content[5]": content[5],
                "content[6]": content[6]
            },
            dataType: "json",//호출한 페이지의 형식이다. xml,json,html,text등의 여러 방식을 사용할 수 있다.
            error: function () {
                alert('Error');
            },
            success: function (Parse_data) {
                if (Parse_data != null) {
                    console.log("안녕하쇼!");
                    window.location.href = "/admin/notice.do";
                } else {
                    alert('서버에러');
                }
            }
        });
    } else{
        $.ajax({
            type: "GET", //전송방식을 지정한다 (POST,GET)
            contentType: "application/x-www-form-urlencoded; charset=UTF-8",
            url: "/admin/noticeImg.ajax",//호출 URL을 설정한다. GET방식일경우 뒤에 파라티터를 붙여서 사용해도된다.
            data: {
                "type": "add",
                "date": date,
                "title": title,
                "file[1]": file[1],
                "file[2]": file[2],
                "file[3]": file[3],
                "file[4]": file[4],
                "img[1]": img[1],
                "img[2]": img[2],
                "img[3]": img[3],
                "img[4]": img[4],
                "img[5]": img[5],
                "img[6]": img[6],
                "content[1]": content[1],
                "content[2]": content[2],
                "content[3]": content[3],
                "content[4]": content[4],
                "content[5]": content[5],
                "content[6]": content[6]
            },
            dataType: "json",//호출한 페이지의 형식이다. xml,json,html,text등의 여러 방식을 사용할 수 있다.
            error: function () {
                alert('Error');
            },
            success: function (Parse_data) {
                if (Parse_data != null) {
                    console.log("안녕하쇼!");
                    window.location.href = "/admin/notice.do";
                } else {
                    alert('서버에러');
                }
            }
        });
    }
}

function fmChangeImg(no, data, filename, no_c){
    $.ajax({
        type: "POST",
        enctype: 'multipart/form-data',
        url: "/admin/fm.ajax",
        data: data,
        processData: false,
        contentType: false,
        cache: false,
        timeout: 600000,
        dataType: "json",
        error: function () {
            alert("quick ajax err");
        },
        success: function (data) {
            $.ajax({
                type: "GET", //전송방식을 지정한다 (POST,GET)
                contentType: "application/x-www-form-urlencoded; charset=UTF-8",
                url: "/admin/fm.ajax",
                data: {
                    "type": "upload",
                    "no": no,
                    "file": filename
                },
                dataType: "json",//호출한 페이지의 형식이다. xml,json,html,text등의 여러 방식을 사용할 수 있다.
                error: function () {
                    alert("fmChangeImg");
                },
                success: function (data) {
                    window.location.href = "/admin/fm.do?type=change" + "&no_c="+no_c;
                }
            });
        }
    });
}