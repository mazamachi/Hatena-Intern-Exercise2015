// 課題 JS-3 の実装をここに記述してください。
var button = document.getElementById('submit-button');
button.addEventListener( "click" , function() {
	var logInput = document.getElementById('log-input');
	var logOutput = document.getElementById('table-container');
	logOutput.innerHTML = "";
	createLogTable(logOutput, parseLTSVLog(logInput.value));
} , false );