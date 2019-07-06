import { getOneEntrust, reviewEntrust,replaceEntrust,queryEntrustState,addNewContract} from '@/services/user'
import router from "umi/router";
import {message} from "antd";
import { EnArr2Str,EnStr2Arr} from '@/utils/utils';


export default {
  namespace: 'checkentrust',
  state: {
    selectedKey: '/basic-list',
    entrust: {},
  },
  effects: {
    * getOneEntrust({payload}, {call, put}) {
      const response = yield call(getOneEntrust, payload);
      console.log(response);
      yield put({type: 'initData', payload: EnStr2Arr(response)})
    },
    * ReviewEntrust({payload},{call}) {
      payload=EnArr2Str(payload)
      yield call(reviewEntrust, payload);
      if(payload.operation=="ReviewPass"){
        const res = yield call(queryEntrustState,payload)
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
      return {
        ...state,
        entrust: action.payload,
      }
    }
  }

};
