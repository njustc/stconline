import { getOneTestReport, updateTestReportProcess } from '@/services/testReport';
import router from "umi/router";

export default {
  namespace:'report-detail',

  state: {
    data: {},
    checked: 0
  },

  effects: {
    *GetOneTestReport({payload}, {call, put}) {
      const response = yield call(getOneTestReport, payload);
     
      
      if(typeof response._links.self.length == "undefined"){
       
        yield put({type: 'updatechecked',payload: 1})
      }
      else{
        yield put({type: 'updatechecked',payload: 0})
      }


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
    updatechecked(state,action){
      return{
        ...state,
        checked: action.payload
      }
    }
  },
};
