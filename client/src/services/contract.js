import request from '@/utils/request';

/**
 * 根据pid获取合同
 * @param: pid:
 * */
export async function getOneContract({pid}) {
  //console.log(params)
  //console.log("执行到了service层的getoneContract，参数：",{pid});
  //console.log({pid});
  return request(`api/project/contract/${pid}`);
}

/**
 * 获取所有的合同内容
 * */
export async function getAllContract() {
  return request('api/project/contract');
}

/**
 * 根据pid删除合同
 * */ 
export async function deleteContract(params) {
  return request(`api/project/contract/${params.pid}`, {
    method: 'DELETE',
  });
}

/**
 * 修改合同内容
 * @param pid: project id
 * @param data: contract
 * */
export async function replaceContract(params) {
  //console.log("=======================")
  //console.log("执行到了service层的replaceCon，参数：",params)
  //console.log(params)
  return request(`api/project/contract/${params.pid}`, {
    method: 'PUT',
    data: params,
  });
}

/**
 * 新增合同,由市场部工作人员执行
 * @param data: contract
 * */
export async function newContract(data) {
  return request('api/project/contract', {
    data: data
  })
}

export async function updateConProcess(params) {
  //console.log("++++++++++++++++++++++");
  return request(`api/project/process/update?type=Contract`, {
    method: 'POST',
    data: params
  });
}

export async function createConProcess(params) {
  //console.log("=========================service========================");
  return request (`api/project/process/create?pid=${params.pid}&type=Contract`, {
    method: 'POST',
    data: ""
  });
}
//get当前进程的状态
export async function queryConState(param){
  return request('api/project/process/query',{
    method:'POST',
    data:param
  })
}

export async function addNewTestPlan(params){
  return request(`/api/project/testplan/${param.pid}?uid=${param.userId}`,{
    method: 'POST',
    data: ''
  })
}
// export async function addNewContract(param){
//   return request(`api/project/contract/${param.pid}?uid=${param.userId}`,{
//     method:'POST',
//     data:''
//   })
// }

//待办事项
export async function getToDoContract() {
  return request(`api/project/contract/todo`);
}
