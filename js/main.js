// 課題 JS-1: 関数 `parseLTSVLog` を記述してください
function parseLTSVLog(str) {
  var reg = /path:(.+)\t.*epoch:(\d+)\n/g
  var array=[];
  var ar;
  while(ar = reg.exec(str)){
    var hash = {};
    hash["path"]= ar[1];
    hash["epoch"]= Number(ar[2]);
    array.push(hash);
  }
  return array;
}
// 課題 JS-2: 関数 `createLogTable` を記述してください
function createLogTable (dom, ltsvLog) {
  var table = document.createElement("table");
  dom.appendChild(table);

  var thead = document.createElement("thead");
  table.appendChild(thead);

  var thRow = thead.insertRow(-1);

  var thPath = document.createElement("th");
  thPath.innerHTML = "path"
  thRow.appendChild(thPath);

  var thEpoch = document.createElement("th");
  thEpoch.innerHTML = "epoch"
  thRow.appendChild(thEpoch);

  var tbody = document.createElement("tbody");
  table.appendChild(tbody);

  for (i=0; i<ltsvLog.length; i++) {
    var rows = tbody.insertRow(-1);
    var pathCell = rows.insertCell(-1);
    pathCell.innerHTML = ltsvLog[i].path;
    var epochCell = rows.insertCell(-1);
    epochCell.innerHTML = ltsvLog[i].epoch;
  }
}