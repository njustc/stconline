import {getOneEntrust, reviewEntrust, replaceEntrust, queryEntrustState, addNewContract} from '@/services/user'
import router from "umi/router";
import {message} from "antd";
import {EnArr2Str, EnStr2Arr} from '@/utils/utils';

export default {
  namespace: 'checkentrust',
  state: {
    entrust: {
      testType: [], 
      testBasis:[],
      testSpecification:[],
      clientSystem:[],
      serverHardFrame:[],
      serverSoftFrame:[],
      checkSample:[]

    },
  },
  effects: {
    * getOneEntrust({payload}, {call, put}) {
      // console.log(payload)
      const response = yield call(getOneEntrust, payload);
      const entrust= EnStr2Arr(response)
      console.log("ent",entrust)
      yield put({type: 'initData', payload: entrust})
    },
    * ReviewEntrust({payload}, {call}) {
      payload = EnArr2Str(payload)
      yield call(reviewEntrust, payload);
      if (payload.operation == "ReviewPass") {
        const res = yield call(queryEntrustState, payload)
        if (res.state == "Approve") {
          const contract = yield call(addNewContract, payload)
        }
      }
      payload=EnStr2Arr(payload)
      router.push("/basic-list.html")
    },


  },
  reducers: {
    initData(state, action) {
      console.log(action.payload);
      return {
        ...state,
        entrust: action.payload,
      }
    }
  }

};
