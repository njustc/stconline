/***
 *读取指定的Cookie值 readCookie("id");
 *@param {string} cookieName Cookie名称
 */
export function readCookie(cookieName) {
  const theCookie = "" + document.cookie;
  const ind = theCookie.indexOf(cookieName);
  if (ind === -1 || cookieName === "") return "";
  let ind1 = theCookie.indexOf(';', ind);
  if (ind1 === -1) ind1 = theCookie.length;
  /*读取Cookie值*/
  return unescape(theCookie.substring(ind + cookieName.length + 1, ind1));
}

/***
 * 设置Cookie值 setCookie("id",1);
 * @param {string} cookieName Cookie名称
 * @param {string} cookieValue Cookie值
 */
export function setCookie(cookieName, cookieValue) {
  /*当前日期*/
  const today = new Date();
  /*Cookie过期时间*/
  const expire = new Date();
  /*如果未设置nDays参数或者nDays为0，取默认值1*/
  //if(nDays == null || nDays == 0) nDays = 1;
  /*计算Cookie过期时间【 3600000 * 24  为一天】*/
  expire.setTime(today.getTime() + 400000); //5分钟
  document.cookie = cookieName + "=" + escape(cookieValue) + ";expires=" + expire.toGMTString();
}

/***
 * 删除cookie中指定变量函数
 * @param {string} $name Cookie名称
 */
export function deleteCookie($name) {
  const myDate = new Date();
  myDate.setTime(-1000);//设置时间
  document.cookie = $name + "=''; expires=" + myDate.toGMTString();
}

/***
 * 删除cookie中所有定变量函数
 * @param {string} cookieName Cookie名称
 * @param {string} cookieValue Cookie值
 * @param {number} nDays Cookie过期天数
 */
function clearCookie() {
  const myDate = new Date();
  myDate.setTime(-1000);//设置时间
  const data = document.cookie;
  const dataArray = data.split("; ");
  for (let i = 0; i < dataArray.length; i++) {
    const varName = dataArray[i].split("=");
    document.cookie = varName[0] + "=''; expires=" + myDate.toGMTString();
  }
}

export function getRole(){
  let roleList=[]
  if(readCookie('roles').indexOf(",")>0){
    roleList=readCookie('roles').split(",")
  }
  else{
    roleList[0]="ADMIN"
    roleList[1]=readCookie('roles')
  }
  // console.log(roleList)
  return roleList
}
