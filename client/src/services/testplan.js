import request from '@/utils/request';

export async function getAllTestPlan() {
  return request('api/project/testplan');
  //return request('/dev/api/project/testplan');
}

export async function getOneTestPlan(params) {
  console.log(params);
  return request(`api/project/testplan/${params.pid}`);
  //return request(`/dev/api/project/testplan/${params.pid}`);
}


export async function addNewTestPlan(params) {
  console.log(params);
  return request(`dev/api/project/testplan/`, {
    method: 'POST',
    data: params,
  });
}

export async function deleteTestPlan(params) {
  console.log(params.pid);
  return request(`api/project/testplan/${params.pid}`,{
    method: 'DELETE',
  });
}

export async function replaceTestPlan(params) {
  // console.log(params)
  return request(`api/project/testplan/${params.pid}`, {
    method: 'PUT',
    data: params,
  });
}

// export async function updateTestPlanProcess(params) {
//   return request('/api/process/testplan', {
//     method: 'POST',
//     data: params,
//   });
// }

