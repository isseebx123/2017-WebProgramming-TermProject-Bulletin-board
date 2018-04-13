var idInputElement;
var pwInputElement;

window.onload = function(){
	idInputElement = document.getElementById("idInput");
	pwInputElement = document.getElementById("pwInput");
};

function checkIdAndPw(){
	var stringId = idInputElement.value;
	var stringPw = pwInputElement.value;
	
	var url = "./atLoginCheckMember.jsp";
	$.post(url, {id: stringId, pw: stringPw},
		function (response) {
			if(response == "idNeedActivation"){
				alert("메일 인증이 필요한 아이디입니다.");
			}
			else if(response == "idNotExist"){
				alert("아이디가 존재하지 않습니다.");
			} 
			else if(response == "pwNotCorrect"){
				alert("패스워드가 올바르지 않습니다.");
			}
			else{
				location.href = "../TP2_00_Main.jsp"
			}
		}).fail(function() {
			alert("request에 실패하였습니다.");
		});
}