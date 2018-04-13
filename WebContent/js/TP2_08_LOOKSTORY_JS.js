/**
 * 
 */


$(document).ready(function(){
	/* 전역 변수 */
	
});

function modifyStory(){
	var timeElement = document.getElementById("time");
	var boardNameElement = document.getElementById("boardname");
	
	var postTime = timeElement.innerHTML;
	var boardName = boardNameElement.value;
	
	var URL = "./TP2_09_ModifyStory.jsp?time="+postTime+"&boardname="+boardName;
	location.href = URL;
}

function removeStory(){
	if(!confirm("정말로 삭제하시겠습니까?")) return ;
	
	var timeElement = document.getElementById("time");
	var boardNameElement = document.getElementById("boardname");
	
	var postTime = timeElement.innerHTML;
	var boardName = boardNameElement.value;
	
	var URL = "./DeleteStory.jsp?time="+postTime+"&boardname="+boardName;
	location.href = URL;
}

/* 수정이나 삭제를 할 수 있는 호스트인지 확인 */
function isHost(modifyOrRemove){
	var timeElement = document.getElementById("time");
	var boardNameElement = document.getElementById("boardname");
	var postTime = timeElement.innerHTML;
	var boardName = boardNameElement.value;
	var URL = "./CheckIsHost.jsp";
	
	$.post(URL, { time: postTime },function(response, status){
		if (response == "false"){
			alert('권한이 없습니다.');
			return ;
		}
		if(modifyOrRemove == "modify") modifyStory();
		if(modifyOrRemove == "remove") removeStory();
	}).fail(function() {
		console.log("페이지를 받아오는데 오류가 발생했습니다.");
	});
	
	
}