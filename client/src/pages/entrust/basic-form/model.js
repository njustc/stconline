import {message} from 'antd';
import router from 'umi/router';
import {
  addNewEntrust,
  createEntrustProcess,
  deleteEntrust,
  getOneEntrust,
  replaceEntrust,
  updateEntrustProcess
} from '@/services/user';
import {EnArr2Str, EnStr2Arr} from '@/utils/utils';

export default {
  namespace: 'entrustForm',

  state: {
    data: {},
    pid: ""
  },

  effects: {
    * replaceEntrust({payload}, {call, put}) {
      payload = EnArr2Str(payload)
      yield call(replaceEntrust, payload);
      const response = yield call(getOneEntrust, payload);
      yield put({type: 'initData', payload: EnStr2Arr(response)})
      message.success('保存成功');
    },

    * addNewEntrust({payload}, {call, put}) {
      payload = EnArr2Str(payload)
      const response = yield call(addNewEntrust, payload);
      // console.log("new",response)
      yield put({type: 'initData', payload: EnStr2Arr(response)})
      message.success('新建成功');
    },

    * submitForm({payload}, {call}) {
      // console.log("submit",payload.pid!="")
      payload = EnArr2Str(payload)
      // console.log("beforesub",payload)
      if (payload.pid === "") {//不存在
        payload = yield call(addNewEntrust, payload)
      } else {
        // console.log("save")
        const res = yield call(replaceEntrust, payload);
        // console.log(res)
        payload = res
      }
      // console.log(payload)
      // console.log(payload.processInstanceId==="")
      if (payload.processInstanceId === "") {
        const response = yield call(createEntrustProcess, payload)
      } else {
        const response = yield call(updateEntrustProcess, payload);
      }

      router.push("/basic-list.html")
      message.success('提交成功');
    },

    * getOneEntrust({payload}, {call, put}) {
      const response = yield call(getOneEntrust, payload);
      yield put({type: 'initData', payload: EnStr2Arr(response)})
    },

    * deleteEntrust({payload}, {call, put}) {
      console.log("play", payload)
      if (payload.pid != "") {
        const response = yield call(deleteEntrust, {pid: payload.pid})
      }

      router.push("/basic-list.html")
      message.success('删除成功');
    },


  },
  reducers: {
    initData(state, action) {
      console.log(action.payload)
      return {
        ...state,
        data: action.payload,
        pid: action.payload.pid
      }
    },
  }
};
