import { routerRedux } from 'dva/router';
import { getPageQuery } from './utils/utils';
import { setAuthority } from './utils/authority';
import { message } from 'antd';
import { reloadAuthorized } from './utils/Authorized';
import { getOneTestReport, replaceTestReport, addNewTestReport, deleteTestReport , updateTestReportProcess, createTestReportProcess} from '@/services/testReport';
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
      console.log("456",payload)
      yield call(replaceTestReport, payload);
      console.log("123",payload)
      const response = yield call(getOneTestReport, payload);
      //console.log(response);
      //yield put({type: 'updateData', payload: response});
      //router.push("/report-list.html")
      message.success('保存成功');
    },

    *queryAddReport({payload}, {call, put}) {
      const response = yield call(addNewTestReport, payload);
      yield put({type: 'updateData', payload: response});
      message.success('新建成功');
    },


    * querySubmitReport({payload}, {call, put}) {
      console.log("submit555")
      //console.log(payload.processInstanceId)
      if (payload.pid !== "") {
        //添加属性
        //console.log("replaceTestPlan");
        const response = yield call(replaceTestReport, payload);
        //console.log(payload.processInstanceId)
        payload = response;
      } else {
        const newform = yield call(addNewTestReport, payload);
        payload = newform;
      }
      console.log(payload)
      
      if (payload.processInstanceId === "") {
        console.log("create");
        yield call(createTestReportProcess, payload);

      }
      else {
        console.log("update");
        yield call(updateTestReportProcess, payload);
      }
      
      location.replace("/report-list.html");
      //router.push("/report-list.html")
      console.log("888")

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
