/*runTable 할때 무조건 없는 행 하나 만들어야 한다.
* <layout>
    <div> empty
    <div> 실제 데이터 들어가는 부분 <-- 하지만 이 부분은 지우고 runtable하면 된다. empty는 무조건 냉겨 놔야됨
* </layout>
* */
var runTableNotice  = function (pageNationId, layoutId) {
    var layout = '#' + layoutId;
    $('#' + pageNationId).html('');
    var trnum = 0;
    var maxRows = 10; //행 제한 횟수

    var totalRows = $(layout + ' tr').length - 1;
    $(layout + ' tr:gt(0)').each(function () {
        trnum++
        if (trnum > maxRows) {
            $(this).hide()
        }
        if (trnum <= maxRows) {
            $(this).show()
        }
    });
    var pagenum = 0;
    if (totalRows > maxRows) {
        $('#' + pageNationId).append('<li class="first page-item">\n' +
            '                    <a class="page-link bg-main-white h6" href="#" aria-label="Previous">\n' +
            '                        <span aria-hidden="true" class="h6">&laquo;</span>\n' +
            '                        <span class="sr-only">Previous</span>\n' +
            '                    </a>\n' +
            '                </li>');
        pagenum = Math.ceil(totalRows / maxRows);
        for (var i = 1; i <= pagenum;) {
            $('#' + pageNationId).append('<li class="page-item" data-page="' + i + '"><a class="page-link bg-main-white h6" href="#">' + i++ + '</a></li>').show();
        }
        $('#' + pageNationId).append('<li class="last page-item">\n' +
            '                    <a class="page-link bg-main-white h6" href="#" aria-label="Next">\n' +
            '                        <span class="h6" aria-hidden="true">&raquo;</span>\n' +
            '                        <span class="sr-only">Next</span>\n' +
            '                    </a>\n' +
            '                </li>');
    }
    $('#' + pageNationId + ' li:nth-of-type(2)').addClass('active');
    $('#' + pageNationId + ' li').on('click', function () {
        if ($(this).hasClass('first')) {
            var pageNum = 1;
            var rowIndex = 0;
            $('#' + pageNationId + ' li').removeClass('active');
            $('#' + pageNationId + ' li:nth-of-type(2)').addClass('active');
            $(layout + ' tr:gt(0)').each(function () {
                rowIndex++;
                if (rowIndex > (maxRows * pageNum) || rowIndex <= ((maxRows * pageNum) - maxRows)) {
                    $(this).hide();
                } else {
                    $(this).show();
                }
            })
        } else if ($(this).hasClass('last')) {
            console.log(pagenum);
            var pageNum = pagenum - 1;
            var rowIndex = 0;
            $('#' + pageNationId + ' li').removeClass('active');
            $('#' + pageNationId + ' li:nth-last-of-type(2)').addClass('active');
            $(layout + ' tr:gt(0)').each(function () {
                rowIndex++;
                if (rowIndex > (maxRows * pageNum) || rowIndex <= ((maxRows * pageNum) - maxRows)) {
                    $(this).hide();
                } else {
                    $(this).show();
                }
            })
        } else {
            var pageNum = $(this).attr('data-page');
            var rowIndex = 0;
            $('#' + pageNationId + ' li').removeClass('active');
            $(this).addClass('active');
            $(layout + ' tr:gt(0)').each(function () {
                rowIndex++;
                if (rowIndex > (maxRows * pageNum) || rowIndex <= ((maxRows * pageNum) - maxRows)) {
                    $(this).hide();
                } else {
                    $(this).show();
                }
            })
        }
    });
}
var runTableFaq = function (pageNationId, layoutId) {
    var layout = '#' + layoutId;
    $('#' + pageNationId).html('');
    var trnum = 0;
    var maxRows = 10; //행 제한 횟수
    var totalRows = $(layout + ' div.faq-item').length - 1;
    $(layout + ' div.faq-item:gt(0)').each(function () {
        trnum++
        if (trnum > maxRows) {
            $(this).hide()
        }
        if (trnum <= maxRows) {
            $(this).show()
        }
    });
    var pagenum = 0;
    if (totalRows > maxRows) {
        $('#' + pageNationId).append('<li class="first page-item">\n' +
            '                    <a class="page-link bg-main-white h6" href="#" aria-label="Previous">\n' +
            '                        <span aria-hidden="true" class="h6">&laquo;</span>\n' +
            '                        <span class="sr-only">Previous</span>\n' +
            '                    </a>\n' +
            '                </li>');
        pagenum = Math.ceil(totalRows / maxRows);
        for (var i = 1; i <= pagenum;) {
            $('#' + pageNationId).append('<li class="page-item" data-page="' + i + '"><a class="page-link bg-main-white h6" href="#">' + i++ + '</a></li>').show();
        }
        $('#' + pageNationId).append('<li class="last page-item">\n' +
            '                    <a class="page-link bg-main-white h6" href="#" aria-label="Next">\n' +
            '                        <span class="h6" aria-hidden="true">&raquo;</span>\n' +
            '                        <span class="sr-only">Next</span>\n' +
            '                    </a>\n' +
            '                </li>');
    }
    $('#' + pageNationId + ' li:nth-of-type(2)').addClass('active');
    $('#' + pageNationId + ' li').on('click', function () {
        if ($(this).hasClass('first')) {
            var pageNum = 1;
            var rowIndex = 0;
            $('#' + pageNationId + ' li').removeClass('active');
            $('#' + pageNationId + ' li:nth-of-type(2)').addClass('active');
            $(layout + ' div.faq-item:gt(0)').each(function () {
                rowIndex++;
                if (rowIndex > (maxRows * pageNum) || rowIndex <= ((maxRows * pageNum) - maxRows)) {
                    $(this).hide();
                } else {
                    $(this).show();
                }
            })
        } else if ($(this).hasClass('last')) {
            console.log(pagenum);
            var pageNum = pagenum - 1;
            var rowIndex = 0;
            $('#' + pageNationId + ' li').removeClass('active');
            $('#' + pageNationId + ' li:nth-last-of-type(2)').addClass('active');
            $(layout + ' div.faq-item:gt(0)').each(function () {
                rowIndex++;
                if (rowIndex > (maxRows * pageNum) || rowIndex <= ((maxRows * pageNum) - maxRows)) {
                    $(this).hide();
                } else {
                    $(this).show();
                }
            })
        } else {
            var pageNum = $(this).attr('data-page');
            var rowIndex = 0;
            $('#' + pageNationId + ' li').removeClass('active');
            $(this).addClass('active');
            $(layout + ' div.faq-item:gt(0)').each(function () {
                rowIndex++;
                if (rowIndex > (maxRows * pageNum) || rowIndex <= ((maxRows * pageNum) - maxRows)) {
                    $(this).hide();
                } else {
                    $(this).show();
                }
            })
        }
    });
}