import request from '@/utils/request';

export async function fakeSubmitForm() {
  return request('api/customers/'+'1'+'/projects', {
    method: 'GET',
  }).then((res)=>{
    //console.log(res)
  });
}
