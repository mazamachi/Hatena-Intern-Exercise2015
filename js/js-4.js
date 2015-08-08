function ltsvParser (ltsv) {
  var lines = ltsv.split("\n");
  var linesLen = lines.length;
  console.log(linesLen);
  var logs = [];
  for(var i=0; i<linesLen; i++){
    console.log(i);
    var logStrs = lines[i].split("\t");
    var log = new Object();
    logStrsLen = logStrs.length
    for (var j = 0; j < logStrsLen; j++) {
      var ar = logStrs[j].match(/([^:]+):(.+)/);
      if(ar==null){
        continue;
      }
      var label = ar[1], value = ar[2];
      log[label] = value;
    }
    console.log(typeof log["req"]);
    if(typeof log["req"]!="undefined"){
      log["path"] = log["req"].split(" ")[1];
    }else{
      continue;
    }
    console.log(log);
    logs.push(log);
  }
  // console.log(logs);
  return logs;
}

var button = document.getElementById('submit-button');
button.addEventListener( "click" , function() {
  var logInput = document.getElementById('log-input');
  var logOutput = document.getElementById('table-container');
  var pathQuery = document.getElementById('input-path').value;
  var matchedLogs = [];
  var logs = ltsvParser(logInput.value);
  var logsLen = logs.length;
  for(i=0; i<logsLen; i++){
    if(logs[i]["path"].match(pathQuery)){
      matchedLogs.push(logs[i]);
    }
  }
  logOutput.innerHTML = "";
  createLogTable(logOutput, matchedLogs);
} , false );
