import request from '@/utils/request';

/**
 * 获取所有的测试方案
 * */
export async function getAllTestPlan() {
  return request('api/project/testplan');
}

/**
 * 根据pid获取测试方案
 * */
export async function getOneTestPlan({pid}) {
  return request(`api/project/testplan/${pid}`);
}

/**
 * 新增测试方案
 * */
export async function addNewTestPlan(data) {
  return request(`api/project/testplan`, {
    method: 'POST',
    data: data,
  });
}

/**
 * 删除测试方案
 * */
export async function deleteTestPlan({pid}) {
  return request(`api/project/testplan/${pid}`, {
    method: 'DELETE',
  });
}

/**
 * 修改测试方案
 * */
export async function replaceTestPlan(params) {
  //console.log(params);
  return request(`api/project/testplan/${params.pid}`, {
    method: 'PUT',
    data: params,
  });
}

/**
 * 提交测试方案
 * */
export async function submitTestPlan({pid}) {
  return request(`api/project/testplan/submit`, {
    method: 'POST',
    params: {pid}
  });
}

export async function updateTestPlanProcess(params) {
  //console.log(typeof(params),params)
  return request(`api/project/process/update?type=TestPlan`, {
    method: 'POST',
    data: params
  });
}

export async function createTestPlanProcess(params) {
  // console.log(typeof(params))
  return request(`api/project/process/create?pid=${params.pid}&type=TestPlan`, {
    method: 'POST',
    data: ""
  });
}

//待办事项
export async function getToDoTestPlan() {
  return request(`api/project/testplan/todo`);
}
