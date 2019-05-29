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
  return request(`/dev/api/customers/${cid}/projects`);
}

export async function deleteEntrust(params) {
  console.log(params.pid);
  return request(`/dev/api/customers/projects/entrust?${stringify(params)}`);
}