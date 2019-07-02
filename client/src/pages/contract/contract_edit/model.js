import { message } from 'antd';
import { getOneContract ,replaceContract} from '@/services/contract';

export default {
    namespace : 'contractEdit',

    state: {
        editdata: {},
    },
    effects: {
        *queryGetOneCon({payload}, {call,put}) {
            const response = yield call(getOneContract, payload);
            console.log(response);
            yield put({type: 'updataData', payload: response});
        },
        // *replaceEntrust({ payload }, { call ,put}) {
        //     yield call(replaceEntrust, payload);
        //     const response=yield call(getOneEntrust, payload);
        //     yield put({type:'initData',payload:response})
        //     message.success('保存成功');
        // },
        *querySaveCon({payload}, {call,put}) {
            yield call(replaceContract, payload);
            const response = yield call(getOneContract, payload);
            yield put({type: 'updataDate', payload: response});
        },
    },
    reducers: {
        updataData(state, action) {
            return {
                ...state,
                editdata: action.payload,
            }
        }
    }
};