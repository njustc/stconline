import { getOneTestRecord,updateTestRecordProcess} from '@/services/testRecord';
import router from "umi/router";

export default {
  namespace:'recordDetail',
  state: {
    // data: [],
    detail: {},
    counter: 0,
  },
  effects: {
    *returnRecordList({payload}){
      //debugger
      console.log(payload);
      router.push("/record-list.html?pid=" + payload.dataDetail.detail.pid);        
    },
    //派发一个queryGetOnePlan的action
    * queryGetOneRecord({payload}, {call, put}) {
      const response = yield call(getOneTestRecord, payload);
      //console.log("get res");
      console.log(response);
      yield put({type: 'getPlanData', payload: response})
    },
    * queryReviewTestRecord({payload},{call}) {
      console.log("review",payload)
      yield call(updateTestRecordProcess, payload);
      router.push("/record-list.html?pid=" + payload.pid);
    },

  },
  //响应action并修改state
  reducers:{
    getPlanData(state,action){
      return{
        ...state,
        detail:action.payload,
      }
    },
  },
};
