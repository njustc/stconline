import { routerRedux } from 'dva/router';
import { getPageQuery } from './utils/utils';
import { setAuthority } from './utils/authority';
import { reloadAuthorized } from './utils/Authorized';
import { getOneTestReport, replaceTestReport, addNewTestReport, deleteTestReport } from '@/services/testReport';
import router from "umi/router";

export default {
  namespace: 'reportEdit',

  state: {
    reportdata: {},
  },

  effects: {
    *getTestReport({payload}, {call, put}) {
      console.log("getOneReport")
      console.log(payload);
      const response = yield call(getOneTestReport, payload);
      console.log(response)
      yield put({type: 'updateData', payload: response});
    },
    *queryReplaceReport({payload}, {call, put}) {
      yield call(replaceTestReport, payload);
      console.log(payload)
      const response = yield call(getOneTestReport, payload);
      console.log(response);
      yield put({type: 'updateData', payload: response});
      message.success('保存成功');
    },
    *queryAddReport({payload}, {call, put}) {
      const response = yield call(addNewTestReport, payload);
      yield put({type: 'updateData', payload: response});
      message.success('新建成功');
    },
    *queryDeleteReport({payload},{call}){
      console.log("play123",payload)
      if (payload.pid!="") {
        yield call(deleteTestReport,{pid:payload.pid})
      }
      //console.log("123")
      router.push("/report-list.html")
      //console.log("123")
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
