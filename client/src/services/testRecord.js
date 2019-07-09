import request from '@/utils/request';

/**
 * 新增测试记录
 * */
export async function addNewTestRecord(data) {
  //console.log(data);
  return request(`api/project/testRecord`, {
    method: 'POST',
    data: data,
  });
}

/**
 * 查看某一项目全部测试记录
 * */
export async function getProjectTestRecords(param) {
  //console.log(param.pid);
  return request(`api/project/testRecord?pid=${param.pid}`);
}

/**
 * 查看单个测试记录
 * */
export async function getOneTestRecord({testId}) {
    return request(`api/project/testRecord/${testId}`);
}

/**
 * 修改单个测试记录
 * */
export async function replaceTestRecord(params) {
  //console.log(params);
  return request(`api/project/testRecord/${params.testId}`, {
    method: 'PUT',
    data: params,
  });
}

/**
 * 删除单个测试记录
 * */
export async function deleteTestRecord({testId}) {
    return request(`api/project/testRecord/${testId}`, {
        method: 'DELETE',
    });
}

/**
 * 更改流程状态
 * */

export async function createTestRecordProcess(params) {
    return request(`api/project/process/create?pid=${params.testId}&type=TestRecord`, {
        method: 'POST',
        data: ""
    });
}

export async function updateTestRecordProcess(params) {
  //console.log(typeof(params),params)
  return request(`api/project/process/update?type=TestRecord`, {
    method: 'POST',
    data: params
  });
}
