import { getOneTestPlan,updateTestPlanProcess} from '@/services/testPlan';
import router from "umi/router";

export default {
  namespace:'testplanCheck',
  state: {
    // data: [],
    check: {},
    counter: 0,
  },
  effects: {
    //派发一个queryGetOnePlan的action
    * queryGetOnePlan({payload}, {call, put}) {
      const response = yield call(getOneTestPlan, payload);
      //console.log("get res");
      //console.log(response);
      yield put({type: 'getPlanData', payload: response})
    },
    * queryReviewTestPlan({payload},{call}) {
      console.log("ReviewEntrust");
      console.log("review",payload)
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
  },
};
