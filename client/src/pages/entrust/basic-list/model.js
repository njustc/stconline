
// import { Divider, Tag,Menu} from 'antd';
import router from 'umi/router';
import { getAllEntrust,deleteEntrust} from '@/services/user';

export default {
    namespace: 'entrustlist',
    state: {
        data : [],
    },
    effects:{
      *GetAllEntrust(_,{call,put}){
        const response=yield call(getAllEntrust)
        if (!('_embedded' in response)) {
          yield put({type: 'addListData', payload: response})
        } else {
          yield put({type: 'addListData', payload: response._embedded.entrusts})
        }

      },
      *DeleteEntrust({payload},{call,put}){
        // console.log(payload)
        yield call(deleteEntrust,{pid:payload.pid})
        // console.log(response)
       const list=yield call(getAllEntrust)
        // console.log('GetAllEntrust')
        if(!('_embedded' in list)){
          yield put({type:'addListData',payload: list})
        }
        else{
          yield put({type:'addListData',payload: list._embedded.entrusts})
        }
      },
    },
    reducers:{
      addListData(state,action){
        return{
          ...state,
          data:action.payload,
        }
      }
    }
  };
