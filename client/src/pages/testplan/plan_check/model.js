import { getOneTestPlan} from '@/services/user';

export default {
  namespace:'testplanCheck',
  state: {
    data: [],
    counter: 0,
    // data: [
    //   {
    //     id: 1,
    //     testplan_name: 'mmm',
    //     client: "林黛玉",
    //     tags: ['审核通过'],
    //   },
    //   {
    //     id: 2,
    //     testplan_name: 'kkk',
    //     client: 123,
    //     tags: ['未通过'],
    //   },
    //   {
    //     id: 3,
    //     testplan_name: 'xxx',
    //     client: '李逵',
    //     tags: ['待提交审核'],
    //   },
    // ],
    // counter:100,
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
