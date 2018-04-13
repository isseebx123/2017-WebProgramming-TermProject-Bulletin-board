/* 전역변수 */
var emailInputTag;
var telephoneInputTag;
var birthInputTag;

$(document).ready(function() {
	/* 전역변수 초기화 */
	emailInputTag = document.getElementById("email");
	telephoneInputTag = document.getElementById("tel");
	birthInputTag = document.getElementById("birth");
	
});

/* 이메일 유효성 검사(onchange) */
function isEmailValidate(){
	var email = emailInputTag.value;
	var regExp = /[0-9a-zA-Z][_0-9a-zA-Z-]*@[_0-9a-zA-Z-]+(\.[_0-9a-zA-Z-]+){1,2}/;
	if(!regExp.test(email)){
		emailInputTag.value = "";
		alert("이메일 형식을 지켜주세요.");
		return false;
	}
	birthInputTag.focus();
}

/* 전화번호 유효성 검사(onchange) */
function isTelephoneValidate(){
	var telephone = telephoneInputTag.value;
	var regExp = /^01(0|6|7|8)-[0-9]{3,4}-[0-9]{4}$/;
	if(!regExp.test(telephone)){
		telephoneInputTag.value = "";
		alert("전화번호 형식을 지켜주세요.");
		return false;
	}
	emailInputTag.focus();
}

/* 정보수정버튼을 눌렀을 때 공백인 input이 있는지 확인하고 없으면 submit함 */
function checkInformationIsNotEmpty(){
	var formElement = document.getElementsByTagName("form")[0];
	
	if(emailInputTag.value != "" && telephoneInputTag.value != "" && birthInputTag.value != ""){
		formElement.submit();
	}
	else{
		alert("수정할 정보를 입력해주세요.")
	}
}