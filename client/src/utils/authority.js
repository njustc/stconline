// use localStorage to store the authority info, which might be sent from server in actual project.
import {getRole} from "./cookieUtils";

export function getAuthority(str) {
  //console.log(getRole()[0]);
  return getRole()[0];
  // return localStorage.setItem('antd-pro-authority',getRole()[0]);
  //
  // // return localStorage.getItem('antd-pro-authority') || ['admin', 'user'];
  // const authorityString =
  //   typeof str === 'undefined' ? localStorage.getItem('antd-pro-authority') : str;
  // // authorityString could be admin, "admin", ["admin"]
  // let authority;
  // try {
  //   authority = JSON.parse(authorityString);
  // } catch (e) {
  //   authority = authorityString;
  // }
  // if (typeof authority === 'string') {
  //   return [authority];
  // }
  // console.log("authority",authority);
  // return authority || ['admin'];
}

// export function setAuthority(authority) {
//   return localStorage.setItem('antd-pro-authority',JSON.stringify(getRole()[0]));
//   // const proAuthority = typeof authority === 'string' ? [authority] : authority;
//   // return localStorage.setItem('antd-pro-authority', JSON.stringify(proAuthority));
// }
