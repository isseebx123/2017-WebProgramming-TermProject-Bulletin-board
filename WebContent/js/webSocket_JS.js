/**
 * 
 */
var textarea;
var webSocket;
var inputMessage;
	
$(document).ready(function(){
	textarea = document.getElementById("messageWindow");
	webSocket = new WebSocket('ws://localhost:8181/TP2_201302450_SanghyeonLee/broadcasting');
	inputMessage = document.getElementById('inputMessage');

	webSocket.onerror = function(event) {
		onError(event);
	};

	webSocket.onopen = function(event) {
		onOpen(event);
	};

	webSocket.onmessage = function(event) {
		onMessage(event);
	};
});

function onMessage(event) {
	textarea.value += "Other: " + event.data + "\n";
}
    
function onOpen(event) {
	textarea.value += "어서오세요! 환영합니다.\n";
}
    
function onError(event) {
	alert(event.data);
}
    
function send() {
	textarea.value += "Me: " + inputMessage.value + "\n";
	webSocket.send(inputMessage.value);
	inputMessage.value = "";
}