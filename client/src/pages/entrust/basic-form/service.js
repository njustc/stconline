import request from '@/utils/request';

/**
 * 获取文件名称
 * */
export async function getFilenames(pid) {
  return request('api/project/files/name', {
    method: 'GET',
    params: {
      pid: pid
    }
  })
}
