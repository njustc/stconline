import { message } from 'antd';
import { getOneContract ,replaceContract, updateConProcess, createConProcess} from '@/services/contract';
import router from 'umi/router';

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
        *querySaveCon({payload}, {call}) {
            console.log("================这里是payload================")
            console.log(payload);
            console.log("==================这是payload===================")
            yield call(replaceContract, payload);
            const response = yield call(getOneContract, payload);
            console.log("让我们康康res是什么");
            console.log(response);
            console.log("=================");
            //yield put({type: 'updataDate', payload: response});
            console.log("保存成功")
            message.success("保存成功，请刷新")
        },
        *submitCon({payload}, {call}){
            // console.log("============")
            // console.log(payload)
            // console.log("===============!!")
            if(payload.processInstanceId===""){
                const res = yield call(createConProcess,payload)
            }else{
                const res = yield call(updateConProcess,payload)
            }
            console.log("执行跳转")
            router.push("/contract_list.html")
        }
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