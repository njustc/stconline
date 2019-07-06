
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
        // console.log('GetAllEntrust')
        // console.log(response)

        // 处理未登录情况：重定向到登陆界面
        console.log(response.status)
        if (response.status === 401) {
          router.push("/user-login.html");
        }
        else {
          // console.log('_embedded' in response)
          if (!('_embedded' in response)) {
            console.log("put []")
            yield put({type: 'addListData', payload: response})
          } else {
            yield put({type: 'addListData', payload: response._embedded.entrusts})
          }
        }
      },
      *DeleteEntrust({payload},{call,put}){
        // console.log(payload)
        yield call(deleteEntrust,{pid:payload.pid})
        // console.log(response)
       const list=yield call(getAllEntrust)
        // console.log('GetAllEntrust')
        console.log(list)
        console.log('_embedded' in list)
        if(!('_embedded' in list)){
          console.log("put []")
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
