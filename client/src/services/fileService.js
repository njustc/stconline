import request from '@/utils/request';

/**
 * 获取文件名称
 * @author lfm
 * */
export async function getFilenames({pid}) {
  return request('api/project/files/name', {
    method: 'GET',
    params: {
      pid: pid
    }
  })
}

/**
 * 文件下载
 * */

export async function fileDownload({pid, filename}) {
  return request('api/project/files', {
    method: 'GET',
    params: {
      pid, filename
    }
  })
}

/**
 * 文件删除
 * */
export async function fileDelete({pid, filename}) {
  return request('api/project/files', {
    method: 'DELETE',
    params: {
      pid, filename
    }
  })
}

/**
 * 文件上传
 * */
export async function fileUpload({pid}) {
  return request('api/project/files', {
    method: 'POST',
    params: {
      pid
    }
  })
}
