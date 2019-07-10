import router from 'umi/router';
import { getAllEntrust, getprocess} from '@/services/user';
import {getToDoEntrust} from "../../services/user";
import {getToDoTestReport} from "../../services/testReport";
import {getToDoTestPlan} from "../../services/testPlan";
import {getToDoContract} from "../../services/contract";

export default {
  namespace: 'staff_first',
  state: {
    data : [],
    entrustData:[],
    contractData:[],
    planData:[],
    reportData:[],

  },
  effects:{
    *InitWorkplace({payload},{call,put}) {

      if (payload === "TS" || payload === "QM" || payload === "TM") {
        const resPlan = yield call(getToDoTestPlan);
        const resReport = yield call(getToDoTestReport);
        if (!('_embedded' in resPlan)) {
          yield put({type: 'updatePlanData',payload: resPlan});
        } else {
          yield put({type: 'updatePlanData',payload: resPlan._embedded.testPlans});
        }
        if (!('_embedded' in resReport)) {
          yield put({type: 'updateReportData',payload: resReport});
        } else {
          yield put({type: 'updateReportData',payload: resReport._embedded.testReports});
        }

      }
      if (payload === "SS") {
        const resEntrust = yield call(getToDoEntrust);
        if (!('_embedded' in resEntrust)) {
          yield put({type: 'updateEntrustData',payload: resEntrust});
        } else {
          yield put({type: 'updateEntrustData',payload: resEntrust._embedded.entrusts});
        }

      }
      if (payload === "SM" || payload === "QM" || payload === "SS") {
        const resContract = yield call(getToDoContract);
        if (!('_embedded' in resContract)) {
          yield put({type: 'updateContractData',payload: resContract});
        } else {
          yield put({type: 'updateContractData',payload: resContract._embedded.contracts});
        }
      }
    },
  },
  reducers:{
    updateEntrustData(state,action){
      return{
        ...state,
        entrustData: action.payload,
      }
    },
    updateContractData(state,action){
      return{
        ...state,
        contractData: action.payload,
      }
    },
    updatePlanData(state,action){
      return{
        ...state,
        planData: action.payload,
      }
    },
    updateReportData(state,action){
      return{
        ...state,
        reportData: action.payload,
      }
    },

  }
}
