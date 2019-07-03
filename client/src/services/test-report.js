import request from '@/utils/request';
import { stringify } from 'querystring';

export async function getAlltestReport() {
  return request(`api/project/testReport`);
}

export async function deleteTestReport(params) {
  // console.log(params.pid);
  return request(`api/project/testReport/${params.pid}`, {
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
  //console.log("addnew", params)
  return request('api/project/testReport', {
    method: 'POST',
    data: params,
  });
}

export async function getOneTestReport(params) {
    return request(`api/project/testReport/${params.pid}`);
}