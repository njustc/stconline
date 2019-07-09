import { getOneContract, updateConProcess, queryConState, addNewTestPlan} from '@/services/contract';
import router from 'umi/router';
export default {
  namespace:'contractDetail',
  state: {
    // data: [],
    check: {},
    checked: 0
    //0代表没审核过,1代表审核过了
  },
  effects: {
    //派发一个queryGetOneContract的action
    * queryGetOneContract({payload}, {call, put}) {
      //console.log("=================ssssss=====================");
      const response = yield call(getOneContract, payload);
      //console.log("get res",typeof response._links.self.length == "undefined");
      //true = undifined = 审核过了 = 置1
      if(typeof response._links.self.length == "undefined"){
        //console.log("执行到了赋值部分")
        yield put({type: 'updatechecked',payload: 1})
      }
      else{
        yield put({type: 'updatechecked',payload: 0})
      }
      //console.log(response);
      yield put({type: 'updateData', payload: response})
    },
    * UpdateProcess({payload}, {call}) {
      //console.log("看看payload")
      //console.log(payload)
      const res = yield call(updateConProcess, payload);
      //console.log(payload.operation)
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
    updatechecked(state,action){
      return{
        ...state,
        checked: action.payload
      }
    }
  },
};
