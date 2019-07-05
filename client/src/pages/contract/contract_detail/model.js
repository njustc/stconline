import { getOneContract, updateConProcess} from '@/services/contract';
import router from 'umi/router';

export default {
  namespace:'contractDetail',
  state: {
    // data: [],
    check: {},
  },
  effects: {
    //派发一个queryGetOneContract的action
    * queryGetOneContract({payload}, {call, put}) {
      //console.log("=================ssssss=====================");
      const response = yield call(getOneContract, payload);
      console.log("=================get res=====================");
      console.log(response);
      yield put({type: 'updateData', payload: response})
    },
    * UpdateProcess({payload}, {call}) {
      //console.log("=====================");
      //console.log(payload);
      //console.log("==================!");
      const res = yield call(updateConProcess, payload);
      //console.log("!!!!!!!!!!!!!!!!!!!");
      router.push("/contract_list.html")
    }
  },
  //响应action并修改state
  reducers:{
    updateData(state,action){
      return{
        ...state,
        check:action.payload,
      }
    },
  },
};
