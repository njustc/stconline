import { message } from 'antd';
import { replaceTestPlan, getOneTestPlan, deleteTestPlan, addNewTestPlan, updateTestPlanProcess,createTestPlanProcess} from '@/services/testPlan';
import router from "umi/router";

export default {
  namespace: 'testplanEdit',

  state: {
    editdata: {},
  },

  effects: {
    * queryReplacePlan({payload}, {call, put}) {
      //console.log("replacePlan");
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

    * querySubmitPlan({payload}, {call, put}) {
      //console.log("submit", payload);
      if (payload.pid !== "") {
        //添加属性
        //console.log("replaceTestPlan");
        const response = yield call(replaceTestPlan, payload);
        payload = response;
      } else {
        const newform = yield call(addNewTestPlan, payload);
        payload = newform;
      }
      if (payload.processInstanceId === "") {
        //console.log("create");
        yield call(createTestPlanProcess, payload);
      }
      else {
        //console.log("update");
        yield call(updateTestPlanProcess, payload);
      }
      router.push("/plan_list.html")

    },

    * queryGetOnePlan({payload}, {call, put}) {
      // console.log(payload);
      const response = yield call(getOneTestPlan, payload);
      yield put({type: 'updateData', payload: response});
    },

    * queryDeletePlan({payload}, {call}) {
      //console.log("play", payload);
      if (payload.pid != "") {
        yield call(deleteTestPlan, {pid: payload.pid})
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
