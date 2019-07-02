import { message } from 'antd';
import router from 'umi/router';
import { replaceEntrust,getOneEntrust ,deleteEntrust ,updateEntrustProcess,addNewEntrust} from '@/services/user';

export default {
  namespace: 'entrustForm',

  state: {
    data:{},
    pid:""
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
    
    *submitForm({ payload }, {call}) {
      console.log("submit",payload)
      if(payload.pid!=""){//已存在
        //添加属性
        
        yield call(replaceEntrust, payload);
        const response=yield call(updateEntrustProcess, payload.pid);
      }
      else{
        const newform=yield call(addNewEntrust, payload);
        const response=yield call(updateEntrustProcess, newform.pid);
      }

      router.push("/basic-list.html")
      message.success('提交成功');
    },

    *getOneEntrust({ payload }, { call , put}) {
      const response=yield call(getOneEntrust, payload);
      yield put({type:'initData',payload:response}) 
    },

    *deleteEntrust({payload},{call,put}){
      console.log("play",payload)
      if (payload.pid!="") {
        console.log("in null")
        const response=yield call(deleteEntrust,{pid:payload.pid})
      }

      router.push("/basic-list.html")
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
  }
};
