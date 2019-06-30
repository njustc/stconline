import { message } from 'antd';
import { replaceTestPlan, getOneTestPlan, deleteTestPlan, addNewTestPlan, getAllTestPlan} from '@/services/testplan';

export default {
  namespace: 'testplanEdit',

  state: {
    editdata: {},
  },

  effects: {
    * queryReplacePlan({payload}, {call, put}) {
      yield call(replaceTestPlan, payload);
      // console.log(payload)
      const response = yield call(getOneTestPlan, payload);
      yield put({type: 'updateData', payload: response});
      message.success('保存成功');
    },
    * queryAddPlan({payload}, {call, put}) {
      const response = yield call(addNewTestPlan, payload);
      yield put({type: 'updateData', payload: response});
      message.success('新建成功');
    },
    *querySubmitPlan({ payload }, { call ,put}) {
      yield call(updateTestPlanProcess, payload);
      console.log(payload);
      message.success('提交成功');
    },
    * queryGetOnePlan({payload}, {call, put}) {
      // console.log(payload);
      const response = yield call(getOneTestPlan, payload);
      yield put({type: 'updateData', payload: response});
    },
    *queryDeletePlan({payload},{call,put}){
      yield call(deleteTestPlan,{cid: 'cid', pid: payload.pid})
      // console.log(response)
      const list=yield call(getAllTestPlan);
      if(!('_embedded' in list)){
        console.log("put []");
        yield put({type:'updateData',payload: list})
      }
      else{
        yield put({type:'updateData',payload: list._embedded.testPlans})
      }
      message.success('删除成功');
    },
    // * queryDeletePlan({payload}, {call, put}) {
    //   // console.log(payload.pid)
    //   const response = yield call(deleteTestPlan, {cid: 'cid', pid: payload.pid});
    //   yield put({type: 'updateData', payload: response});
    //   message.success('删除成功');
    // },
  },
  reducers: {
    updateData(state, action) {
      // console.log(action.payload)
      return {
        ...state,
        editdata: action.payload,
      }
    }
  }
};
