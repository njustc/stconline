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

export async function getAlltestReport() {
  return request(`api/project/testReport`);
}

export async function deleteTestReport(params) {
  console.log(params.pid);
  return request(`api/project/testReport/${params.pid}`,{
    method: 'DELETE',
  });
}

export async function replaceTestReport(params) {
  return request(`api/project/testReport/${params.pid}`, {
    method: 'PUT',
    data: params,
  });
}

export async function addNewTestReport(params) {
  console.log("addnew",params)
  return request('api/project/testReport', {
    method: 'POST',
    data: params,
  });
}

export async function getOneTestReport(params) {
    return request(`api/project/testReport/${params.pid}`);
}

// export async function updateEntrustProcess(params) {
//   // console.log(typeof(params))
//   return request(`api/project/entrust/submit?pid=${params}`, {
//     method: 'POST',
//     data: ""
//   });
// }