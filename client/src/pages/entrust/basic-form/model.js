import { message } from 'antd';
import { replaceEntrust,getOneEntrust ,deleteEntrust ,updateEntrustProcess,addNewEntrust} from '@/services/user';

export default {
  namespace: 'entrustForm',

  state: {
    data:{},
    pid:"",
    needJump:false
},

  effects: {
    *replaceEntrust({ payload }, { call ,put}) {
      yield call(replaceEntrust, payload);
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
    *submitForm({ payload }, { call ,put}) {
      console.log("submit",payload)
      if(payload.pid!=""){//已存在
        yield call(replaceEntrust, payload);
        console.log("sub old",payload.pid)
        const response=yield call(updateEntrustProcess, payload.pid);
      }
      else{
        const newform=yield call(addNewEntrust, payload);
        console.log("newForm",payload)
        const response=yield call(updateEntrustProcess, newform.pid);
      }
      yield put({type:'changeStatus'})
      message.success('提交成功');
    },
    *getOneEntrust({ payload }, { call , put}) {
      const response=yield call(getOneEntrust, payload);
      yield put({type:'initData',payload:response}) 
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
        pid:action.payload.pid
      }
    },
    changeStatus(state){
      return{
        ...state,
        needJump:true
      }
    }
  }
};
