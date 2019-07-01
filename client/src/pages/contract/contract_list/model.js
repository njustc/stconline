import { getAllContract,deleteContract} from '@/services/contract';

export default {
  namespace:'contractList',
  state: {
    data: [],
    counter: 0,
  },
  effects:{
    //派发一个queryInitPlans的action
    *queryInitContracts(_,{call,put}) {
      //获取服务器端数据
      const response = yield call(getAllContract);
      // console.log('GetAllContract')
      console.log(response);
      //_embedded复制粘贴的委托
      console.log('_embedded' in response);
      if (!('_embedded' in response)) {
        // console.log("put []");
        //执行getPlanData
        yield put({type: 'getData', payload: response});
      } else {
        yield put({type: 'getData', payload: response._embedded.contracts});
      }
    },

    *queryDeleteCon({payload},{call,put}){
      console.log("到这里啦")
      yield call(deleteContract,{pid:payload.pid})
      console.log(response)
      const list=yield call(getAllContract)
      console.log(list)
      console.log('_embedded' in list)
      if(!('_embedded' in list)){
        console.log("put []")
        yield put({type:'addListData',payload: list})
      }
      else{
        yield put({type:'addListData',payload: list._embedded.entrusts})
      }
    }

  },
  //响应action并修改state
  reducers:{
    getData(state,action){
      return{
        ...state,
        data:action.payload,
      }
    },
  },
};
