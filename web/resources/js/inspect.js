function inspection(inputId, what) {
    /*TODO <FORM method="POST" action="/handler.do" onsubmit="return checkValue()">*/

    var inspect_id = /^[a-zA-Z0-9]{4,12}$/; // 아이디와 패스워드가 적합한지 검사할 정규식
    var inspect_pass = /^(?=.*[a-z])(?=.*[0-9])[0-9A-Za-z$&+,:;=?@#|'<>.^*()%!-]{8,16}$/
    var inspect_email = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
    var inspect_phone = /^[+]*[(]{0,1}[0-9]{1,3}[)]{0,1}[-\s\./0-9]*$/g;
    var inspect_search = /^[ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|\*]+$/;
    var inspect_name = /^[ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|\*]{2,16}$/
    switch (what) {
        case 'name':
            var id = document.getElementById(inputId);
            alert('anme');
            if (!check(inspect_name, id, "이름은 2~16자의 영문,한글과 숫자로만 입력하셔야 합니다.")) {
                return false;
            }
            break;
        case 'id':
            var id = document.getElementById(inputId);
            if (!check(inspect_id, id, "아이디는 4~12자의 영문 대소문자와 숫자로만 입력")) {
                return false;
            }
            break;
        case 'password':
            var pw = document.getElementById(inputId);
            if (!check(inspect_pass, pw, " 8자 이상 16자 이하, 소문자에 숫자하나 필수지만 대문자나 특수문자가 들어갈 수 있는 비밀번호")) {
                return false;
            }
            break;
        case 'email':
            var email = document.getElementById(inputId);
            if (!check(inspect_email, email, "적합하지 않은 이메일 형식입니다.")) {
                return false;
            }
            break;
        case 'phone':
            var phone = document.getElementById(inputId);
            if (!check(inspect_phone, phone, "알 수 없는 전화번호 입니다.")) {
                return false;
            }
            break;
        case 'search':
            var search = document.getElementById(inputId);
            if (!check(inspect_search, search, "한글, 영어, 숫자만 허용됩니다.")) {
                return false;
            }
            break;
    }
    return true;
};

function check(inspect, what, message) {
    if (inspect.test(what.value)) {
        return true;
    }
    alert(message);
    what.value = "";
    what.focus();
};

function lengthCheck(id,count){
    var str = document.getElementById(id);
    if(str.value.length>=count){
        return true;
    }else{
        alert('최소 '+count+'자리 만큼 채우셔야 합니다.');
        return false;
    }
};