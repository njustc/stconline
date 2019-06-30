import { message } from 'antd';
import { replaceEntrust,getOneEntrust ,deleteEntrust ,updateEntrustProcess,addNewEntrust} from '@/services/user';

export default {
  namespace: 'entrustForm',

  state: {data:{}},

  effects: {
    *replaceEntrust({ payload }, { call ,put}) {
      yield call(replaceEntrust, payload);
      // console.log(payload)
      const response=yield call(getOneEntrust, payload);
      yield put({type:'initData',payload:response})
      message.success('保存成功');
    },
    *addNewEntrust({ payload }, { call ,put}) {
      const response=yield call(addNewEntrust, payload);
      console.log("newid=",response)
      yield put({type:'initData',payload:response})
      message.success('新建成功');
    },
    *submitform({ payload }, { call ,put}) {
      yield call(updateEntrustProcess, payload);
      console.log(payload)
      message.success('提交成功');
    },
    *getOneEntrust({ payload }, { call , put}) {
      console.log(payload)
      const response=yield call(getOneEntrust, payload);
      yield put({type:'initData',payload:response})
      console.log("fetch",response)
    
    },
    *DeleteEntrust({payload},{call,put}){
      // console.log(payload.pid)
      const response=yield call(deleteEntrust,{cid:'cid',pid:payload.pid})
      yield put({type:'addListData',payload: response})
      message.success('删除成功');
    },
  },
  reducers:{
    initData(state,action){
      // console.log(action.payload)
      return{
        ...state,
        data:action.payload,
      }
    }
  }
};
