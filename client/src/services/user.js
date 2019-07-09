import request from '@/utils/request';
import { stringify } from 'querystring';
import { async } from 'q';
export async function query() {
  return request('/api/users');
}

export async function queryCurrent() {
  return request('/api/currentUser');
}

export async function queryNotices() {
  return request('/api/notices');
}

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
  // console.log(typeof(params),params)
  return request(`api/project/process/update?type=Entrust`, {
    method: 'POST',
    data: params
  });
}

export async function createEntrustProcess(params) {
  // console.log(typeof(params))
  return request(`api/project/process/create?pid=${params.pid}&type=Entrust`, {
    method: 'POST',
    data: ""
  });
}

export async function getOneEntrust(params) {
  // console.log(params)
  return request(`api/project/entrust/${params.pid}`);
}

export async function reviewEntrust(param) {
  {
    // console.log('reviewEntrust');
    // console.log(param);
    return request(`api/project/process/update?type=Entrust`, {
      method: 'POST',
      data: param
    });
  }

}

export async function addNewContract(param){
  return request(`api/project/contract/${param.pid}?uid=${param.userId}`,{
    method:'POST',
    data:''
  })
}

export async function queryEntrustState(param){
  return request('api/project/process/query',{
    method:'POST',
    data:param
  })
}

export async function getprocess(param){

  //console.log("传给后端的参数:",param)
  //return 3
  return request(`api/project/process?pid=${param}`,{
    method:'POST',
    data: ''
  })
}

export async function deleteFile(pid, filename) {
  return request(`api/project/files?pid=${pid}&filename=${filename}`,{
    method:'DELETE',
    data: { pid, filename }
  })
}

//待办事项
export async function getToDoEntrust() {
  return request(`api/project/entrust/todo`);
}


