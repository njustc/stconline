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

export async function getAllEntrust(cid) {
  console.log(cid)
  // return request(`/dev/api/customers/${cid}/projects`);
  return request('/api/project/entrust');
}

export async function deleteEntrust(params) {
  console.log(params.pid);
  // return request(`/dev/api/customers/projects/entrust?${stringify(params)}`);
  return request('/api/project/entrust/${params.pid}');
}

export async function saveForm(params) {
  return request('/api/basic-form/save', {
    method: 'POST',
    data: params,
  });
}

export async function initGetData(params) {
  // console.log(params)
  return request('/api/basic-form/initGetData', {
    method: 'POST',
    data: params,
  });
}

export async function submitForm(params) {
  return request('/api/basic-form/submit', {
    method: 'POST',
    data: params,
  });
}

export async function getOneEntrust(pid) {
  return request('api/project/entrust');

}
