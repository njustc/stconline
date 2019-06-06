import { message } from 'antd';
import { saveForm,initGetData ,deleteEntrust ,submitForm} from '@/services/user';

export default {
  namespace: 'basicForm',
  state:{data:{}},

  effects: {
    *saveForm({ payload }, { call ,put}) {
      // yield put({type:'upData',payload:payload})

      yield call(saveForm, payload);
      message.success('保存成功');
    },
    *submitform({ payload }, { call ,put}) {
      yield call(submitForm, payload);
      message.success('提交成功');
    },
    *initGetData({ payload }, { call , put}) {
      // console.log(payload)
      const response=yield call(initGetData, payload);
      yield put({type:'initData',payload:response})
    },
    *DeleteEntrust({payload},{call,put}){
      // console.log(payload.pid)
      const response=yield call(deleteEntrust,{cid:'cid',pid:payload.pid})
      yield put({type:'addListData',payload: response})
    },
  },
  reducers:{
    upData(state,action){
      var newdata=save(...state,action.payload)
      return{
        ...state,
        data:newdata,
      }
    },
    initData(state,action){
      // console.log(action.payload)
      return{
        ...state,
        data:action.payload,
      }
    }
  }
};

function save(data,req){
  data.entrustEntity=req.entrustEntity//
  data.testType=req.testType//测试类型
  data.softname=req.testType//软件名称
  data.version=req.version//版本号
  data.companyEn=req.companyEn//委托单位（英文）
  data.companyCh=req.companyCh///委托单位（中文）
  data.developer=req.developer//开发单位
  data.unitProperty=req.unitProperty//单位性质
  data.userDescription=req.userDescription//软件用户对象描述
  data.funcDescription=req.funcDescription//主要功能及用途简介
  data.testBasis=req.testBasis//测试依据
  data.testSpecification=req.testSpecification//需要测试的技术指标
  //软件规模
  data.funcNum=req.funcNum//功能数
  data.fpNum=req.fpNum//功能点数
  data.codeLine=req.codeLine//代码行数
  data.softwareType=req.softwareType//系统软件
  data.supportSoftware=req.supportSoftware//支持软件
  data.internetApplications=req.internetApplications//应用软件

  //客户端
  data.clientSystem=req.clientSystem//操作系统
  data.clientExStorage=req.clientExStorage//内存要求
  data.clientOther=req.clientOther//其他要求
  //服务器端 硬件
  data.serverHardFrame=req.serverHardFrame//硬件架构
  data.serverMemoryRequire=req.serverMemoryRequire//内存要求
  data.serverHardDiskRequire=req.serverHardDiskRequire//硬盘要求
  data.serverOther=req.serverOther//其他要求
  //服务器端 软件
  data.serverSystem=req.serverSystem//操作系统
  data.serverSoftVersion=req.serverSoftVersion//版本
  data.serverLanguage=req.serverLanguage//编程语言
  data.serverSoftFrame=req.serverSoftFrame//软件架构
  data.serverDataBase=req.serverDataBase//数据库
  data.serverSoftMidW=req.serverSoftMidW//中间件
  data.serverSupport=req.serverSupport//支持
  //网络环境
  data.webEnvironment=req.webEnvironment//主要功能及用途简介
  //样品和数量
  data.sampleType=req.sampleType//样品类型
  data.sampleFile=req.sampleFile//样品文件

  data.expectedDeadLine=req.expectedDeadLine//期望完成时间
  //软件介质
  data.CD=CD//光盘
  data.usbFlashDrive=req.usbFlashDrive//U盘
  data.softwareMediumOther=req.softwareMediumOther//其他
  data.sample_document=req.sample_document//文档资料
  data.sampleChocie=req.sampleChocie//提交的样品处理选择
  //委托单位信息
  data.infoTE=req.cusInfo.infoTE//cusInfo.电话
  data.infoFAX=req.cusInfo.infoFAX//cusInfo.传真
  data.infoAddr=req.cusInfo.infoAddr//cusInfo.地址
  data.infoPostcode=req.cusInfo.infoPostcode//cusInfo.邮编
  data.contactorName=req.cusInfo.contactorName//cusInfo.联系人
  data.infoMobilePhone=req.cusInfo.infoMobilePhone//cusInfo.手机
  data.infoEmail=req.cusInfo.infoEmail//cusInfo.
  data.infoURL=req.cusInfo.infoURL//cusInfo.网址
  data.encryptionLev=req.encryptionLev//密级
  data.antiVirus=req.antiVirus//查杀病毒
  data.checkSample=req.checkSample//测试样品
  data.reqword=req.reqword//重述
  data.userDocumentation=req.userDocumentation//用户文档
  data.operationDocument=req.operationDocument//操作文档
  data.confirmationOpinions=req.confirmationOpinions//确认意见
  data.acceptOpinions=req.acceptOpinions//受理意见
  data.test_number=req.test_number//测试项目编号
  data.remarks=req.remarks//备注
  data.acceptee_signature=req.acceptee_signature//受理人签名
  data.acceptee_signature_time=req.acceptee_signature_time//受理人签名日期
  data.completedByClient=req.completedByClient//委托人填写
  data.client_signature=req.client_signature//委托人签名
  data.client_signature_time=req.client_signature_time//委托人签名日期
  return data
}
