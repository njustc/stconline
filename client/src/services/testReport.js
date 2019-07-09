import request from '@/utils/request';
// import { stringify } from 'querystring';

// export async function query() {
//   return request('/api/users');
// }

// export async function queryCurrent() {
//   return request('/api/currentUser');
// }

// export async function queryNotices() {
//   return request('/api/notices');
// }

export async function getAlltestReport() {
  return request(`api/project/testReport`);
}

export async function deleteTestReport(params) {
  //console.log(params.pid);
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
  //console.log("addnew",params)
  return request('api/project/testReport', {
    method: 'POST',
    data: params,
  });
}

// export async function updateTestReportProcess(params) {
//   console.log(typeof(params),params)
//   console.log("000")
//   return request(`api/project/process/update?type=TestReport`, {
//     method: 'POST',
//     data: params
//   });
// }



// export async function createTestReportProcess(params) {
//    console.log("6",params)
//   return request(`api/project/process/create?pid=${params.pid}&type=TestReport`, {
//     method: 'POST',
//     data: ""
//   });
// }

export async function getOneTestReport(params) {
    return request(`api/project/testReport/${params.pid}`);
}


export async function createTestReportProcess(params) {
  // console.log(typeof(params))
  return request(`api/project/process/create?pid=${params.pid}&type=TestReport`, {
    method: 'POST',
    data: ""
  });
}

export async function updateTestReportProcess(params) {
  //console.log(typeof(params),params)
  return request(`api/project/process/update?type=TestReport`, {
    method: 'POST',
    data: params
  });
}
// export async function updateEntrustProcess(params) {
//   // console.log(typeof(params))
//   return request(`api/project/entrust/submit?pid=${params}`, {
//     method: 'POST',
//     data: ""
//   });
// }

//待办事项
export async function getToDoTestReport() {
  return request(`api/project/testReport/todo`);
}
