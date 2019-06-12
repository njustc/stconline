import request from '@/utils/request';
import { stringify } from 'querystring';
export async function query() {
  return request('/api/users');
}

export async function queryCurrent() {
  return request('/api/currentUser');
}

export async function queryNotices() {
  return request('/api/notices');
}

// export async function getAllEntrust(cid) {
//   // console.log(cid)
//   return request(`/dev/api/customers/${cid}/projects`);
// }

export async function getAllEntrust() {
  return request(`api/project/entrust`);
}

// export async function deleteEntrust(params) {
//   // console.log(params.pid);
//   return request(`api/project/entrust/?${stringify(params)}`);
// }

export async function deleteEntrust(params) {
  // console.log(params.pid);
  return request(`api/project/entrust/${stringify(params.pid)}`,{
    method: 'POST',
    data: params,
  });
}

export async function replaceEntrust(params) {
  return request(`api/basic-form/save/${stringify(params.pid)}`, {
    
  });
}
export async function addNewEntrust(params) {
  return request('api/project/entrust/new', {
    method: 'POST',
    data: params,
  });
}
// export async function getOneEntrust(params) {
//   // console.log(params)
//   return request('/api/basic-form/initGetData', {
//     method: 'POST',
//     data: params,
//   });
// }

export async function updateEntrustProcess(params) {
  return request('/api/process/entrust', {
    method: 'POST',
    data: params,
  });
}

export async function getOneEntrust(params) {
  // console.log(params)
  return request(`api/project/entrust/${stringify(params.pid)}`);
}