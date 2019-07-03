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
  // return request('dev/api/customers/cid/projects');
  return request(`api/project/entrust`);
}

export async function deleteEntrust(params) {
  // console.log(params.pid);
  return request(`api/project/entrust/${params.pid}`,{
    method: 'DELETE',
  });
}

export async function replaceEntrust(params) {
  // console.log(params)
  return request(`api/project/entrust/${params.pid}`, {
    method: 'PUT',
    data: params,
  });
}
export async function addNewEntrust(params) {
  // console.log("addnew",params)
  return request('api/project/entrust', {
    method: 'POST',
    data: params,
  });
}

export async function updateEntrustProcess(params) {
  // console.log(typeof(params))
  return request(`api/project/entrust/submit?pid=${params}`, {
    method: 'POST',
    data: ""
  });
}

export async function getOneEntrust(params) {
  // console.log(params)
  return request(`api/project/entrust/${params.pid}`);
}

export async function reviewEntrust(param1,param2) {
  {
    console.log('reviewEntrust');
    console.log(param1);
    console.log(param2);
    return request(`api/project/entrust/review`, {
      method: 'POST',
      params:{
        pid:param1.pid,
        operation:param2,
      },
      data: {
        comment:param1.comment,
      },
    });
  }

}
