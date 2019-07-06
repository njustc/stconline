import request from '@/utils/request';

/**
 * 用户登录
 * */
export async function userLogin(payload) {
  return request('/api/login', {
    method: 'POST',
    data: {
      username: payload.username,//用户名
      password: payload.password //密码
    }
  });
}

/**
 * 用户登出
 * */
export async function userLogout() {
  return request('/api/logout',{
    method: 'POST'
  })
}

export async function getFakeCaptcha(mobile) {
  return request(`/api/user-login/captcha?mobile=${mobile}`);
}
