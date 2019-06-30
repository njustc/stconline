import { getOneTestPlan} from '@/services/testplan';

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
