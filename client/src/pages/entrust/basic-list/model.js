
// import { Divider, Tag,Menu} from 'antd';
import { getAllEntrust,deleteEntrust} from '@/services/user';

export default {
    namespace: 'entrustlist',
    state: {
        data : [],
    },
    effects:{
      *GetAllEntrust(_,{call,put}){
        const response=yield call(getAllEntrust)
        // console.log('GetAllEntrust')
        yield put({type:'addListData',payload: response._embedded.entrusts})
      },
      *DeleteEntrust({payload},{call,put}){
        // console.log(payload)
        const response=yield call(deleteEntrust,{pid:payload.pid})
        yield put({type:'addListData',payload: response})
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