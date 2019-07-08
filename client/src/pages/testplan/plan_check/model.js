import { getOneTestPlan,updateTestPlanProcess} from '@/services/testPlan';
import router from "umi/router";

export default {
  namespace:'testplanCheck',
  state: {
    // data: [],
    check: {},
    checked: 0,
  },
  effects: {
    //派发一个queryGetOnePlan的action
    * queryGetOnePlan({payload}, {call, put}) {
      const response = yield call(getOneTestPlan, payload);
      if(typeof response._links.self.length == "undefined"){
        //link数为1，不能审批
        yield put({type: 'updatechecked',payload: 1})
      }
      else{
        //link数为2，可以审批
        yield put({type: 'updatechecked',payload: 0})
      }
      yield put({type: 'getPlanData', payload: response})
    },
    * queryReviewTestPlan({payload},{call}) {
      //console.log("ReviewEntrust");
      //console.log("review",payload)
      yield call(updateTestPlanProcess, payload);
      router.push("/plan_list.html")
    },

  },
  //响应action并修改state
  reducers:{
    getPlanData(state,action){
      return{
        ...state,
        check:action.payload,
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
