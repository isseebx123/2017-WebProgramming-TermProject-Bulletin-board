
var isNotIdDuplicate = false;
var idInputTag; // id를 입력하는 input태그
var pwInputTag; // pw를 입력하는 input태그
var agreementInputTag;
var pwConfirmInputTag;
var nameInputTag;
var telephoneInputTag;
var emailInputTag;
var birthInputTag;
var formTag;

window.onload = function(){
	agreementInputTag = document.getElementById("agreementInput");
	idInputTag = document.getElementById("idInput");
	pwInputTag = document.getElementById("pwInput");
	pwConfirmInputTag = document.getElementById("pwConfirmInput");
	nameInputTag = document.getElementById("nameInput");
	telephoneInputTag = document.getElementById("telephoneInput");
	emailInputTag = document.getElementById("emailInput");
	birthInputTag = document.getElementById("birthInput");
	formTag = document.getElementById("form");
};

/* id의 중복체크를 수행하는 메소드 */
function idDuplicationCheck(){
	var stringId = idInputTag.value; //입력된 id를 받아옴
	var url = "./atSignupCheckIdDuplicate.jsp";
	
	if(stringId == ""){
		alert("아이디를 입력해주세요.");
	}
	else {
		$.post(url, {id: stringId},
			function (response) {
				if(response == "true"){
					alert("이미 존재하는 ID입니다. 다른 ID를 입력해주세요.");
					idInputTag.value = "";
				} 
				else {
					alert("사용 가능한 ID입니다.");
					isNotIdDuplicate = true;
				}
			}).fail(function() {
				alert("request에 실패하였습니다.");
			});
	}
}

/* 중복체크했더라도 id변경되면 다시 중복체크 필요 */
function setNeedCheckDuplicate(){
	isNotIdDuplicate = false;
}

function submitClickValidationCheck(){
	var url = "./atSignupCheckIdAndPwValidation.jsp";
	var stringId = idInputTag.value; //입력된 id를 받아옴
	var stringPW = pwInputTag.value; //입력된 pw를 받아옴
	
	if(isNotEmptyAllInputValue() && validationCheckIdAndPwWithResponse()){ //미 입력값 존재 여부 확인, id 중복체크 여부 확인
		/* 입력값 유효성 확인 */
		$.post(url, {id: stringId, pw:stringPW},
			function (response) {
				var result = validationCheckIdAndPwWithResponse(response);
				if(result == true){
					/* 모든 항목이 정상적으로 입력되었으면, 이메일 인증 안내 화면을 출력(submit) */
					insertMemberToMemberTable();
					formTag.submit();
				}
			}).fail(function() {
				alert("request에 실패하였습니다.");
			});
	}
}

/* 사용자가 입력한 회원가입 정보를 객체로 전달하여 DB에 activation=false 상태로 저장 */
function insertMemberToMemberTable(){
	var insertDBURL = "./InsertMemberToMemberTable.jsp";
	var data = getMemberInformationObject();
	$.post(insertDBURL, data,
			function (response) {
				
			}).fail(function() {
				alert("사용자 정보를 DB에 insert하는데 실패했습니다.");
			});
}

/* 사용자가 입력한 회원가입 정보를 객체로 만들어서 반환 */
function getMemberInformationObject(){
	return {
		id: idInputTag.value,
		pw: pwInputTag.value,
		name: nameInputTag.value,
		tel: telephoneInputTag.value,
		email: emailInputTag.value,
		birth: birthInputTag.value
	};
}

/* 미 입력값 존재 여부 확인 */
function isNotEmptyAllInputValue(){
	if(agreementInputTag.checked == false){
		alert("약관에 동의해주세요.");
	}
	else if(idInputTag.value == ""){
		alert("아이디를 입력해주세요.");
	}
	else if(pwInputTag.value == ""){
		alert("패스워드를 입력해주세요.");
	}
	else if(pwConfirmInputTag.value == ""){
		alert("패스워드 확인을 입력해주세요.");
	}
	else if(nameInputTag.value == ""){
		alert("이름을 입력해주세요.");
	}
	else if(telephoneInputTag.value == ""){
		alert("전화번호를 입력해주세요.");
	}
	else if(emailInputTag.value == ""){
		alert("이메일을 입력해주세요.");
	}
	else if(birthInputTag.value == ""){
		alert("생년월일을 입력해주세요.");
	}
	else {
		return true;
	}
	return false;
}

/* response를 가지고 id와 pw의 유효성을 검사하는 메소드 */
function validationCheckIdAndPwWithResponse(response){
	if(response == "idFalse"){
		alert("아이디 형식을 지켜주세요.");
	} 
	else if(isNotIdDuplicate == false){
		alert("아이디 중복체크를 해주세요.");
	}
	else if(response == "pwFalse"){
		alert("패스워드 형식을 지켜주세요.");
	}
	else {
		return true;
	}
	return false;
}

/* 비밀번호 확인의 입력이 비밀번호의 입력과 같은지 확인하는 메소드(onchange) */
function isEqualPasswordConfirm(){
	if(pwConfirmInputTag.value == ''){
		return ; //아직 패스워드 확인란에 아무것도 입력하지 않았다면 alert띄우지 않음
	}
	else if(pwInputTag.value != pwConfirmInputTag.value){
		pwConfirmInputTag.value = "";
		alert("위에 입력한 비밀번호와 값이 다릅니다. 다시 입력해주세요.")
		return false;
	}
	else {
		nameInputTag.focus();
		return true;
	}
}

/* 이름 유효성 검사(onchange) */
function isNameValidate(){
	var name = nameInputTag.value;
	var regExp1 = /[`~!@\#$%<>?/^&*\()\-=+_\’{};:,.\[\]\'\"\\|]/; //특수문자가 포함된 경우의 정규표현식
	var regExp2 = /[0-9]/; //숫자가 포함된 경우의 정규표현식
	if(regExp1.test(name) || regExp2.test(name)){
		nameInputTag.value = "";
		alert("이름 형식을 지켜주세요.");
		return false;
	}
	telephoneInputTag.focus();
	
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