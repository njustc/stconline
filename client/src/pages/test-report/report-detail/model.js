import { getOneTestReport, updateTestReportProcess } from '@/services/testReport';
import router from "umi/router";

export default {
  namespace:'report-detail',

  state: {
    data: {},
  },

  effects: {
    *GetOneTestReport({payload}, {call, put}) {
      const response = yield call(getOneTestReport, payload);
      console.log(response)
      yield put({type: 'getReportData', payload: response})
    },
    * queryReviewTestReport({payload},{call}) {
      yield call(updateTestReportProcess, payload);
      router.push("/report-list.html")
    },

  },

  //响应action并修改state
  reducers:{
    getReportData(state,action){
      return{
        ...state,
        data:action.payload,
      }
    },
  },
};
