const data1= [
  {
    key: '1',
    name: '中美合拍',
    address: '2019-09-21 08:50:65',
    tags: ['委托审核未通过'],
    entrustEntity:'',//
    testType:'basic-form.radio.test',//测试类型
    softname:'电脑管家',//软件名称
    version:'',//版本号
    companyEn:'',//委托单位（英文）
    companyCh:'',///委托单位（中文）
    developer:'',//开发单位
    unitProperty:'',//单位性质
    userDescription:'',//软件用户对象描述
    funcDescription:'',//主要功能及用途简介
    testBasis:'',//测试依据
    testSpecification:'',//需要测试的技术指标
    //软件规模
    funcNum:'',//功能数
    fpNum:'',//功能点数
    codeLine:'',//代码行数
    softwareType:'',//系统软件
    supportSoftware:'',//支持软件
    internetApplications:'',//应用软件

    //客户端
    clientSystem:'',//操作系统
    clientExStorage:'',//内存要求
    clientOther:'',//其他要求
    //服务器端 硬件
    serverHardFrame:'',//硬件架构
    serverMemoryRequire:'',//内存要求
    serverHardDiskRequire:'',//硬盘要求
    serverOther:'',//其他要求
    //服务器端 软件
    serverSystem:'',//操作系统
    serverSoftVersion:'',//版本
    serverLanguage:'',//编程语言
    serverSoftFrame:'',//软件架构
    serverDataBase:'',//数据库
    serverSoftMidW:'',//中间件
    serverSupport:'',//支持
    //网络环境
    webEnvironment:'',//主要功能及用途简介
    //样品和数量
    sampleType:'',//样品类型
    sampleFile:'',//样品文件

    expectedDeadLine1:'2015-01-08T16:00:00.000Z',//期望完成时间
    expectedDeadLine2:'2015-02-11T16:00:00.000Z',//期望完成时间
    //软件介质
    CD:'',//光盘
    usbFlashDrive:'',//U盘
    softwareMediumOther:'',//其他
    sample_document:'',//文档资料
    sampleChocie:'',//提交的样品处理选择
    //委托单位信息
    infoTE:'',//cusInfo.电话
    infoFAX:'',//cusInfo.传真
    infoAddr:'',//cusInfo.地址
    infoPostcode:'',//cusInfo.邮编
    contactorName:'',//cusInfo.联系人
    infoMobilePhone:'',//cusInfo.手机
    infoEmail:'',//cusInfo.
    infoURL:'',//cusInfo.网址
    encryptionLev:'',//密级
    antiVirus:'',//查杀病毒
    checkSample:'',//测试样品
    reqword:'',//重述
    userDocumentation:'',//用户文档
    operationDocument:'',//操作文档
    confirmationOpinions:'',//确认意见
    acceptOpinions:'',//受理意见
    test_number:'',//测试项目编号
    remarks:'你好，我叫李智聪',//备注
    acceptee_signature:'',//受理人签名
    acceptee_signature_time:'',//受理人签名日期
    completedByClient:'',//委托人填写
    client_signature:'',//委托人签名
    client_signature_time:'',//委托人签名日期
  },
  {
    key: '2',
    name: '两开花',
    address: '2019-09-21 08:50:65',
    tags: ['委托审核通过'],
  },
  {
    key: '3',

    name: '我爸是李刚',
    address: '2019-09-21 08:50:65',
    tags: ['委托待审核'],
  },
  {
    key: '4',

      name: '总有刁民想害朕',
      address: '2019-09-21 08:50:65',
      tags: ['委托审核未通过'],
    },
    {
      key: '5',

      name: '漏油奔',
      address: '2019-09-21 08:50:65',
      tags: ['委托审核通过'],
    },
    {
      key: '6',

      name: '隔壁老王',
      address: '2019-09-21 08:50:65',
      tags: ['委托待审核'],
    },
    {
      key: '7',

      name: '蔡徐坤',
      address: '2019-09-21 08:50:65',
      tags: ['委托审核未通过'],
    },
    {
      key: '8',
      name: '鸡你太美',
      address: '2019-09-21 08:50:65',
      tags: ['委托审核通过'],
    },
    {
      key: '9',

      name: '特朗普',
      address: '2019-09-21 08:50:65',
      tags: ['委托待审核'],
    },
    {
      key: '10',

      name: '奥巴马',
      address: '2019-09-21 08:50:65',
      tags: ['委托审核未通过'],
    },
    {
      key: '11',

      name: '大碗宽面',
      address: '2019-09-21 08:50:65',
      tags: ['委托审核通过'],
    },
    {
      key: '12',

      name: '金三胖',
      address: '2019-09-21 08:50:65',
      tags: ['委托待审核'],
    },
]


export default {
  'POST /api/basic-form/save': (req, res) => {
    // console.log(req.body.expectedDeadLine.length)
    for(var i in data1){
      if(data1[i].key===req.body.key){
        save(data1[i],req)
        console.log(data1[i])
      }
    }

    res.send({ message: 'Ok' });
  },
  'POST /api/basic-form/initGetData': (req, res) => {

    for(var i in data1){
      if(data1[i].key===req.body.pid){
        // console.log(data1[i])
        res.json(data1[i])

      }
    }
  },
};

function save(data,req){
  data.entrustEntity=req.body.entrustEntity//
  data.testType=req.body.testType//测试类型
  data.softname=req.body.testType//软件名称
  data.version=req.body.version//版本号
  data.companyEn=req.body.companyEn//委托单位（英文）
  data.companyCh=req.body.companyCh///委托单位（中文）
  data.developer=req.body.developer//开发单位
  data.unitProperty=req.body.unitProperty//单位性质
  data.userDescription=req.body.userDescription//软件用户对象描述
  data.funcDescription=req.body.funcDescription//主要功能及用途简介
  data.testBasis=req.body.testBasis//测试依据
  data.testSpecification=req.body.testSpecification//需要测试的技术指标
  //软件规模
  data.funcNum=req.body.funcNum//功能数
  data.fpNum=req.body.fpNum//功能点数
  data.codeLine=req.body.codeLine//代码行数
  data.softwareType=req.body.softwareType//系统软件
  data.supportSoftware=req.body.supportSoftware//支持软件
  data.internetApplications=req.body.internetApplications//应用软件

  //客户端
  data.clientSystem=req.body.clientSystem//操作系统
  data.clientExStorage=req.body.clientExStorage//内存要求
  data.clientOther=req.body.clientOther//其他要求
  //服务器端 硬件
  data.serverHardFrame=req.body.serverHardFrame//硬件架构
  data.serverMemoryRequire=req.body.serverMemoryRequire//内存要求
  data.serverHardDiskRequire=req.body.serverHardDiskRequire//硬盘要求
  data.serverOther=req.body.serverOther//其他要求
  //服务器端 软件
  data.serverSystem=req.body.serverSystem//操作系统
  data.serverSoftVersion=req.body.serverSoftVersion//版本
  data.serverLanguage=req.body.serverLanguage//编程语言
  data.serverSoftFrame=req.body.serverSoftFrame//软件架构
  data.serverDataBase=req.body.serverDataBase//数据库
  data.serverSoftMidW=req.body.serverSoftMidW//中间件
  data.serverSupport=req.body.serverSupport//支持
  //网络环境
  data.webEnvironment=req.body.webEnvironment//主要功能及用途简介
  //样品和数量
  data.sampleType=req.body.sampleType//样品类型
  data.sampleFile=req.body.sampleFile//样品文件

  data.expectedDeadLine1=(req.body.expectedDeadLine)[0]//期望完成时间
  data.expectedDeadLine2=(req.body.expectedDeadLine)[1]//期望完成时间
  //软件介质
  data.CD=req.body.CD//光盘
  data.usbFlashDrive=req.body.usbFlashDrive//U盘
  data.softwareMediumOther=req.body.softwareMediumOther//其他
  data.sample_document=req.body.sample_document//文档资料
  data.sampleChocie=req.body.sampleChocie//提交的样品处理选择
  //委托单位信息
  data.infoTE=req.body.cusInfo.infoTE//cusInfo.电话
  data.infoFAX=req.body.cusInfo.infoFAX//cusInfo.传真
  data.infoAddr=req.body.cusInfo.infoAddr//cusInfo.地址
  data.infoPostcode=req.body.cusInfo.infoPostcode//cusInfo.邮编
  data.contactorName=req.body.cusInfo.contactorName//cusInfo.联系人
  data.infoMobilePhone=req.body.cusInfo.infoMobilePhone//cusInfo.手机
  data.infoEmail=req.body.cusInfo.infoEmail//cusInfo.
  data.infoURL=req.body.cusInfo.infoURL//cusInfo.网址
  data.encryptionLev=req.body.encryptionLev//密级
  data.antiVirus=req.body.antiVirus//查杀病毒
  data.checkSample=req.body.checkSample//测试样品
  data.reqword=req.body.reqword//重述
  data.userDocumentation=req.body.userDocumentation//用户文档
  data.operationDocument=req.body.operationDocument//操作文档
  data.confirmationOpinions=req.body.confirmationOpinions//确认意见
  data.acceptOpinions=req.body.acceptOpinions//受理意见
  data.test_number=req.body.test_number//测试项目编号
  data.remarks=req.body.remarks//备注
  data.acceptee_signature=req.body.acceptee_signature//受理人签名
  data.acceptee_signature_time=req.body.acceptee_signature_time//受理人签名日期
  data.completedByClient=req.body.completedByClient//委托人填写
  data.client_signature=req.body.client_signature//委托人签名
  data.client_signature_time=req.body.client_signature_time//委托人签名日期
}
