import { message } from 'antd';
import { replaceTestRecord, getOneTestRecord, deleteTestRecord, addNewTestRecord, updateTestRecordProcess,createTestRecordProcess} from '@/services/testRecord';
import router from "umi/router";

export default {
  namespace: 'testRecordEdit',

  state: {
    editdata: {},
  },

  effects: {
    // *returnRecordList() {
    //   router.push("/record-list.html?pid=" + payload.pid);
    // },
    *returnRecordList({payload}){
      //debugger
      console.log(payload);
      router.push("/record-list.html?pid=" + payload.dataEdit.editdata.pid);        
    },
    * queryReplaceRecord({payload}, {call, put}) {
      console.log(payload);
      yield call(replaceTestRecord, payload);
      const response = yield call(getOneTestRecord, payload);
      yield put({type: 'updateData', payload: response});
      message.success('保存成功');
    },

    * queryAddRecord({payload}, {call, put}) {
      console.log(payload);
      const response = yield call(addNewTestRecord, payload);
      console.log(response);
      yield put({type: 'updateData', payload: response});
      message.success('新建成功');
    },
    * queryUpdateData(_,{call,put}){
      yield put({type: 'updateData', payload: {}});
    },
    * querySubmitRecord({payload}, {call, put}) {
      console.log("submit", payload);
      if (payload.testId !== "") {
        //添加属性
        console.log("replaceTestRecord");
        const response = yield call(replaceTestRecord, payload);
        payload = response;
      } else {
        const newform = yield call(addNewTestRecord, payload);
        payload = newform;
      }
      if (payload.processInstanceId === "") {
        console.log("create");
        yield call(createTestRecordProcess, payload);
      } else {
        console.log("update");
        yield call(updateTestRecordProcess, payload);
      }
      // console.log("/record-list.html?pid=" + payload.pid);
      router.push("/record-list.html?pid=" + payload.pid);

    },
    * queryGetOneRecord({payload}, {call, put}) {
      // console.log(payload);
      const response = yield call(getOneTestRecord, payload);
      yield put({type: 'updateData', payload: response});
    },
    * queryDeleteRecord({payload}, {call}) {
      console.log("delete", payload);
      if (payload.testId !== "") {
        console.log("delete", payload.testId);
        yield call(deleteTestRecord, {testId: payload.testId})
      }
      router.push("/record-list.html?pid=" + payload.pid);
    }
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
