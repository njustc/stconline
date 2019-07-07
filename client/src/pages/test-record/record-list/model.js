import { getProjectTestRecords, addNewTestRecord, deleteTestRecord } from '@/services/testRecord';

export default {
  namespace: 'testRecordList',

  state: {
    data: [],
  },

  effects: {
    * queryInitRecords({payload}, {call, put}) {
      //获取服务器端数据
      console.log(payload);
      const response = yield call(getProjectTestRecords, payload);
      if (!('_embedded' in response)) {
        yield put({type: 'getRecordData', payload: response});
      } else {
        yield put({type: 'getRecordData', payload: response._embedded.testRecords});
      }
    },
    * queryAddRecord({payload}, {call, put}) {
      const response = yield call(addNewTestRecord, payload);
      yield put({type: 'addNewRecord', payload: response});
    },
    * queryDeleteRecord({payload}, {call, put}) {
      console.log(payload);
      yield call(deleteTestRecord, {testId: payload.testId})
      const list = yield call(getProjectTestRecords, payload);
      if (!('_embedded' in list)) {
        yield put({type: 'getRecordData', payload: list})
      } else {
        yield put({type: 'getRecordData', payload: list._embedded.testRecords})
      }
    },
  },

  //响应action并修改state
  reducers: {
    getRecordData(state, action) {
      return {
        ...state,
        data: action.payload,
      }
    },
  },
};
