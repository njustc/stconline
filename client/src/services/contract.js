import request from '@/utils/request';

/**
 * 根据pid获取合同
 * @param: pid:
 * */
export async function getOneContract({pid}) {
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
export async function deleteContract({pid}) {
  return request(`api/project/contract/${pid}`, {
    method: 'DELETE',
  });
}

/**
 * 修改合同内容
 * @param pid: project id
 * @param data: contract
 * */
export async function replaceContract({pid, data}) {
  return request(`api/project/contract/${pid}`, {
    method: 'PUT',
    data: data,
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
