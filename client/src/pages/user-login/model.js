import {setAuthority} from './utils/authority';
import {userLogin, getFakeCaptcha, userLogout} from './service';

export default {
  namespace: 'userInfo',

  state: {
    data: {
      status: undefined,
      username: '',
      password: ''
    }
  },

  effects: {
    * login({payload}, {call, put}) {
      const response = yield call(userLogin, payload);
      return response;
    },
    * logout({payload}, {call, put}) {
      yield call(userLogout, payload)
    },

    * getCaptcha({payload}, {call}) {
      yield call(getFakeCaptcha, payload);
    },
  },

  reducers: {
    changeLoginStatus(state, {payload}) {
      setAuthority(payload.currentAuthority);
      return {
        ...state,
        status: payload.status,
        type: payload.type,
      };
    },
    // 更新用户信息
    flushUserInfo(state, {payload}) {
      this.state = payload;
    }
  },
};
