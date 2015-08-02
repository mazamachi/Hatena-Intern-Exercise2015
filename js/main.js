// 課題 JS-1: 関数 `parseLTSVLog` を記述してください
function parseLTSVLog(str) {
  var reg = /path:(.+)\tepoch:(.+)\n/g
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
