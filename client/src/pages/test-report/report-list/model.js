import { getAlltestReport, deleteTestReport} from '@/services/testReport';
import router from "umi/router";

export default {
  namespace:'test-report',
  
  state: {
    data: [],
  },

  effects:{
    *GetAlltestReport(_, {call,put}) {
      const response = yield call(getAlltestReport)
      // console.log(response)

      // console.log('_embedded' in response)
      if (!('_embedded' in response)) {
        // console.log("put []")
        yield put({type: 'addListData', payload: response})
      } else {
        yield put({type: 'addListData', payload: response._embedded.testReports})
      }

    },
    *DeleteTestReport({payload},{call,put}){
      yield call(deleteTestReport, {pid:payload.pid})
      const list = yield call(getAlltestReport)
      // console.log(list)
      // console.log('_embedded' in list)
      if(!('_embedded' in list)){
        // console.log("put []")
        yield put({type:'addListData',payload: list})
      }
      else{
        yield put({type:'addListData',payload: list._embedded.testReports})
      }
    },
  },

  //响应action并修改state
  reducers:{
    addListData(state, action) {
      return {
        ...state,
        data:action.payload,
      }
    }
  },
};
