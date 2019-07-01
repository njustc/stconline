import request from '@/utils/request';


export async function getOneContract(params) {
  console.log(params);
  return request(`api/project/contract/${params.pid}`);
}

export async function getAllContract() {
  //console.log("getAllContract");
  return request('api/project/contract');
  //return request('/dev/api/project/contract');
}

export async function deleteContract(params) {
  console.log(params);
  return request(`api/project/contract/${params.pid}`,{
    method: 'DELETE',
  });
}
