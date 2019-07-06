import request from '@/utils/request';

/**
 * 新增测试记录
 * */
export async function addNewTestRecord(data) {
    return request(`dev/api/project/testRecord`, {
        method: 'POST',
        data: data,
    });
}

/**
 * 查看某一项目全部测试记录
 * */
export async function getProjectTestRecords({pid}) {
    return request(`api/project/testRecord?pid=${pid}`);
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
export async function replaceTesRecord(params) {
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
 * 查看全部测试记录
 * */
export async function getAllTestRecords() {
    return request('api/project/testRecord/all');
}

/**
 * 提交测试方案
 * */
// export async function submitTestPlan({pid}) {
//   return request(`api/project/testplan/submit`, {
//     method: 'POST',
//     params: {pid}
//   });
// }

// export async function updateTestPlanProcess(params) {
//   console.log(typeof(params),params)
//   return request(`api/project/process/update?type=TestPlan`, {
//     method: 'POST',
//     data: params
//   });
// }

// export async function createTestPlanProcess(params) {
//   // console.log(typeof(params))
//   return request(`api/project/process/create?pid=${params.pid}&type=TestPlan`, {
//     method: 'POST',
//     data: ""
//   });
// }


