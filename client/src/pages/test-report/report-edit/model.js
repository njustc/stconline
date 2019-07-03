import { routerRedux } from 'dva/router';
import { getPageQuery } from './utils/utils';
import { setAuthority } from './utils/authority';
import { reloadAuthorized } from './utils/Authorized';
import { getOneTestReport } from '@/services/test-report';

export default {
  namespace: 'reportEdit',

  state: {
    reportdata: {},
  },

  effects: {
    * getTestReport({payload}, {call, put}) {
      console.log("getOneReport")
      console.log(payload);
      const response = yield call(getOneTestReport, payload);
      console.log(response)
      yield put({type: 'updateData', payload: response});
    },
  },

  reducers: {
    updateData(state, action) {
      // console.log(action.payload)
      return {
        ...state,
        reportdata: action.payload,
      }
    }
  },
};
