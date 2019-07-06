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
 * 更改流程状态
 * */
export async function updateTestReportProcess(params) {
    return request(`api/project/process/update?type=TestReport`, {
        method: 'POST',
        data: params
    });
}

export async function createTestReportProcess(params) {
    return request(`api/project/process/create?testId=${params.testId}&type=TestReport`, {
        method: 'POST',
        data: ""
    });
}


