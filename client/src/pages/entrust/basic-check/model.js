import {getOneEntrust} from "../../../services/user";

export default {
  namespace: 'checkentrust',
  state: {
    data:[],
  },
  effects:{
    //may be wrong
    *GetOneEntrust({payload},{call,put}){
      const response=yield call(getOneEntrust,'pid')
      yield put({type:'addListData',payload:response})
    },
  },
  reducers: {
    addListData(state, action) {
      return {
        ...state,
        date: action.payload,
      }
    }
  }
};
