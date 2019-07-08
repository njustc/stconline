import router from 'umi/router';
import { getAllEntrust, getprocess} from '@/services/user';

export default {
    namespace: 'user_first',
    state: {
        data : [],
        pstate1:0,
        pstate2:0,
        pstate3:0,
    },
    effects:{
      *GetAllEntrust(_,{call,put}){
        const response=yield call(getAllEntrust)
        //console.log('GetAllEntrust')
        // console.log(response)
        // 处理未登录情况：重定向到登陆界面
        //console.log("我也不知道这是啥但是输出看看",response)
        if (response.status === 401) {
          router.push("/user-login.html");
        }
        else {
          // console.log('_embedded' in response)
          if (!('_embedded' in response)) {
            //console.log("put []")
            yield put({type: 'addListData', payload: response})
          } else {
            yield put({type: 'addListData', payload: response._embedded.entrusts})
            console.log("看看",response._embedded.entrusts.length)
            if(response._embedded.entrusts.length > 2){
              console.log("成功输出大于等于3")
              const res0 = yield call(getprocess,response._embedded.entrusts[0].pid)
              const res1 = yield call(getprocess,response._embedded.entrusts[1].pid)
              const res2 = yield call(getprocess,response._embedded.entrusts[2].pid)
              yield put({type: 'addP1',payload: res0})
              yield put({type: 'addP2',payload: res1})
              yield put({type: 'addP3',payload: res2})
            }
            else if(response._embedded.entrusts.length == 2){
              console.log("成功输出等于2")
              const res0 = yield call(getprocess,response._embedded.entrusts[0].pid)
              const res1 = yield call(getprocess,response._embedded.entrusts[1].pid)
              yield put({type: 'addP1',payload: res0})
              yield put({type: 'addP2',payload: res1})
            }
            else if(response._embedded.entrusts.length == 1){
              console.log("成功输出等于1")
              const res0 = yield call(getprocess,response._embedded.entrusts[0].pid)
              yield put({type: 'addP1',payload: res0})
            }
            else{
              console.log("成功输出0")
            }
          }
        }
      },
      *GetProcess(payload,{call,put}){
        //console.log("传给model的参数:",payload)
        const res = yield call(getprocess, payload)
        //console.log("返回的结果:",res)
        yield put({type: 'addP', payload: res});
      }
    },
    reducers:{
      addListData(state,action){
        //console.log("这是不是不输出啊")
        return{
          ...state,
          data:action.payload,
        }
      },
      addP1(state,action){
        //console.log("看看action1",action)
        return{
          ...state,
          pstate1:action.payload
        }
      },
      addP2(state,action){
        //console.log("看看action2",action)
        return{
          ...state,
          pstate2:action.payload
        }
      },
      addP3(state,action){
        //console.log("看看action3",action)
        return{
          ...state,
          pstate3:action.payload
        }
      }
    }
}
