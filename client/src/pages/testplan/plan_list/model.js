import { getAllTestPlan,addNewTestPlan,deleteTestPlan} from '@/services/testPlan';
import router from "umi/router";

export default {
  namespace:'testplanList',
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
  effects:{
    //派发一个queryInitPlans的action
    *queryInitPlans(_,{call,put}) {
      //获取服务器端数据
      const response = yield call(getAllTestPlan);
      // console.log('GetAllTestPlan')
      // console.log(response);

      //_embedded复制粘贴的委托
      // console.log('_embedded' in response);
      if (!('_embedded' in response)) {
        // console.log("put []");
        //执行getPlanData
        yield put({type: 'getPlanData', payload: response});
      } else {
        yield put({type: 'getPlanData', payload: response._embedded.testPlans});
      }

    },
    // *queryAddPlan({payload},{call,put}) {
    //   const response = yield call(addNewTestPlan, payload);
    //   //console.log(response);
    //   //执行addNewPlan
    //   yield put({type: 'addNewPlan', payload: response});
    // },
    *queryDeletePlan({payload},{call,put}){
      yield call(deleteTestPlan,{pid:payload.pid})
      // console.log(response)
      const list=yield call(getAllTestPlan);
      if(!('_embedded' in list)){
        //console.log("put []");
        yield put({type:'getPlanData',payload: list})
      }
      else{
        yield put({type:'getPlanData',payload: list._embedded.testPlans})
      }
    },

  },
  //响应action并修改state
  reducers:{
    // addNewPlan(state, { payload: newPlan }) {
    //   const nextCounter = state.counter + 1;
    //   const newPlanWithId = {...newPlan, id: nextCounter};
    //   const nextData = state.data.concat(newPlanWithId);
    //   return {
    //     data: nextData,
    //     counter: nextCounter,
    //   };
    // },
    getPlanData(state,action){
      return{
        ...state,
        data:action.payload,
      }
    },
  },
};
