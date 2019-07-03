import { message } from 'antd';
import { replaceTestPlan, getOneTestPlan, deleteTestPlan, addNewTestPlan, submitTestPlan} from '@/services/testplan';
import router from "umi/router";

export default {
  namespace: 'testplanEdit',

  state: {
    editdata: {},
  },

  effects: {
    * queryReplacePlan({payload}, {call, put}) {
      console.log("replacePlan");
      yield call(replaceTestPlan, payload);
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
      console.log("submit",payload);
      if(payload.pid!=""){
        //添加属性
        console.log("SubmitTestPlan")
        yield call(replaceTestPlan, payload);
        yield call(submitTestPlan, payload.pid);
      }
      else {
        const newform = yield call(addNewTestPlan, payload);
        yield put({type: 'updateData', payload: newform});
        //console.log(newform.pid);
        const response = yield call(submitTestPlan, newform.pid);
      }
      router.push("/plan_list.html")

    },

    * queryGetOnePlan({payload}, {call, put}) {
      // console.log(payload);
      const response = yield call(getOneTestPlan, payload);
      yield put({type: 'updateData', payload: response});
    },

    *queryDeletePlan({payload},{call}){
      console.log("play",payload);
      if (payload.pid!="") {
        yield call(deleteTestPlan,{pid:payload.pid})
      }
      router.push("/plan_list.html")
    },
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
