import request from '@/utils/request';


export async function getOneContract(params) {
  console.log(params);
  return request(`api/project/contract/${params.pid}`);
}
