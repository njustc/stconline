import { getOneEntrust, reviewEntrust,replaceEntrust,queryEntrustState,addNewContract} from '@/services/user'
import router from "umi/router";
import {message} from "antd";
import { EnArr2Str,EnStr2Arr} from '@/utils/utils';

export default {
  namespace: 'checkentrust',
  state: {
    entrust: {},
  },
  effects: {
    * getOneEntrust({payload}, {call, put}) {
      console.log(payload)
      const response = yield call(getOneEntrust,payload);
      yield put({type: 'initData', payload: EnStr2Arr(response)})
    },
    * ReviewEntrust({payload},{call}) {
      // console.log("ReviewEntrust");
      // console.log("res",payload)
      payload=EnArr2Str(payload)
      yield call(reviewEntrust, payload);
      if(payload.operation=="ReviewPass"){
        // console.log("Pass")
        const res = yield call(queryEntrustState,payload)
        // console.log("getREsult")
        // console.log(res)
        if(res.state=="Approve"){
        console.log("get")
          const contract=yield call(addNewContract,payload)
          console.log(contract)
          alert("已创建对应的合同")
        }
      }
      
      router.push("/basic-list.html")
    },


  },
  reducers: {
    initData(state, action) {
      console.log(action.payload)
      return {
        ...state,
        entrust: action.payload,
      }
    }
  }

};
