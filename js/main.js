// 課題 JS-1: 関数 `parseLTSVLog` を記述してください
function parseLTSVLog(str) {
  var reg = /([^:]+):(.+)\t([^:]+):(.+)\n/g
  var array=[];
  var ar;
  while(ar = reg.exec(str)){
    var hash = {};
    hash[ar[1]]= ar[2];
    hash[ar[3]]= ar[4];
    array.push(hash);
  }
  return array;
}
// 課題 JS-2: 関数 `createLogTable` を記述してください
