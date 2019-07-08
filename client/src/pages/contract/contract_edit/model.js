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
            //console.log("SaveCon的参数payload",payload);
            yield call(replaceContract, payload);
            const response = yield call(getOneContract, payload);
            //console.log("SaveCon的返回结果：",response);
            //yield put({type: 'updataDate', payload: response});
            //console.log("保存成功")
            message.success("保存成功，请刷新")
        },
        *submitCon({payload}, {call}){
            yield call(replaceContract, payload);
            //console.log("SubmitCon的参数:",payload);
            if(payload.processInstanceId===""){
                //console.log("执行到了createConProcess，参数：",payload);
                const res = yield call(createConProcess,payload);
                //console.log("createConProcess的返回结果",res);
            }else{
                //console.log("执行到了updateConProcess，参数：",payload);
                const res = yield call(updateConProcess,payload);
                //console.log("updateConProcess的返回结果,参数: ",res);
            }
            //console.log("执行跳转")
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