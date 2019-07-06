import { getProjectTestRecords, addNewTestRecord, deleteTestRecord } from '@/services/testRecord';

export default {
    namespace:'testRecordList',

    state: {
        data: [],
        counter = 0,
    },

    effects:{
        *queryInitRecords(_, {call, put}) {
            //获取服务器端数据
            const response = yield call(getProjectTestRecords);
            if (!('_embedded' in response)) {
                yield put({type: 'getRecordData', payload: response});
            } 
            else {
                yield put({type: 'getRecordData', payload: response._embedded.testRecords});
            }
        },
        *queryAddRecord({payload},{call,put}) {
            const response = yield call(addNewTestRecord, payload);
            yield put({type: 'addNewRecord', payload: response});
        },
        *queryDeleteRecord({payload}, {call, put}){
            yield call(deleteTestRecord, {testId:payload.testId})
            const list = yield call(getProjectTestRecords);
            if(!('_embedded' in list)){
                yield put({type:'getRecordData',payload: list})
            }
            else {
                yield put({type:'getRecordData',payload: list._embedded.testPlans})
            }
        },
    },

    //响应action并修改state
    reducers:{
        addNewRecord(state, { payload: newRecord }) {
            const nextCounter = state.counter + 1;
            const newRecordWithId = {...newPlan, id: nextCounter};
            const nextData = state.data.concat(newRecordWithId);
            return {
                data: nextData,
                counter: nextCounter,
            };
        },
        getRecordData(state, action) {
            return{
                ...state,
                data:action.payload,
            }
        },
    },
};
