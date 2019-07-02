import { getOneContract} from '@/services/contract';

export default {
  namespace:'contractDetail',
  state: {
    // data: [],
    check: {},
  },
  effects: {
    //派发一个queryGetOneContract的action
    * queryGetOneContract({payload}, {call, put}) {
      const response = yield call(getOneContract, payload);
      //console.log("get res");
      console.log(response);
      yield put({type: 'updateData', payload: response})
    },

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
