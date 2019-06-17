

// const data= [
//       {
//         pid: '1',//项目Id
//         name: '中美合拍',
//         time: '2019-09-21 08:50:65',
//         processState: '委托审核未通过', 
//         entrustEntity:'',//测试文档整体
//         testType:'basic-form.radio.test',//测试类型
//         softwareName:'电脑管家',//软件名称
//         version:'',//版本号
//         companyEn:'',//委托单位（英文）
//         companyCh:'',///委托单位（中文）
//         developer:'',//开发单位
//         unitProperty:'',//单位性质(单选)
//         userDescription:'',//	软件用户对象
//         funcDescription:'',//主要功能及用途简介
//         testBasis:[],//测试依据(多选)
//         testSpecification:[],//需要测试的技术指标(多选)
//         //软件规模
//         funcNum:'',//功能数
//         fpNum:'',//功能点数
//         codeLine:'',//代码行数
//         softwareType:'',//系统软件
//         supportSoftware:'',//支持软件
//         internetApplications:'',//应用软件

//         //客户端
//         clientSystem:[],//运行环境-客户端-操作系统(多选)	
//         clientInStorage:'',//	运行环境-客户端-内存要求
//         clientExStorage:'',//	运行环境-客户端-硬盘要求
//         clientOther:'',//	运行环境-客户端-其他要求
//         //服务器端 硬件
//         serverHardFrame:[],// 运行环境-服务器端-硬件-架构(多选)
//         serverInStorage:'',//运行环境-服务器端-硬件-内存要求
//         serverExStorage:'',//	运行环境-服务器端-硬件-硬盘要求	
//         serverHardOther:'',//运行环境-服务器端-硬件-其他要求	
//         //服务器端 软件
//         serverSystem:'',//	运行环境-服务器端-软件-操作系统	
//         serverSoftVersion:'',//	运行环境-服务器端-软件-版本
//         serverLanguage:'',//运行环境-服务器端-软件-编程语言	
//         serverSoftFrame:[],//	运行环境-服务器端-软件-构架(多选)	
//         serverDataBase:'',//运行环境-服务器端-软件-数据库	
//         serverSoftMidW:'',//	运行环境-服务器端-软件-中间件
//         serverSupport:'',//	运行环境-服务器端-软件-其他支撑软件
//         //网络环境
//         webEnvironment:'',//	运行环境-网络环境
//         //样品和数量
//         sampleType:'',//	样品和数量-软件介质
//         sampleFile:'',//	样品和数量-文档资料
//         expectedDeadline:['2015-01-08T16:00:00.000Z','2015-02-11T16:00:00.000Z'],//	希望测试完成时间
       
//         //软件介质
//         CD:'',//光盘
//         usbFlashDrive:'',//U盘
//         softwareMediumOther:'',//其他
//         sample_document:'',//文档资料
//         sampleChocie:'',//提交的样品处理选择
//         //委托单位信息
//         infoTE:'',//cusInfo.电话
//         infoFAX:'',//cusInfo.传真
//         infoAddr:'',//cusInfo.地址
//         infoPostcode:'',//cusInfo.邮编
//         infoName:'',//cusInfo.联系人
//         infoPhone:'',//cusInfo.手机
//         infoEmail:'',//cusInfo.
//         infoURL:'',//cusInfo.网址
//         encryptionLev:'',//密级
//         antiVirus:'',//查杀病毒
//         checkSample:[],//材料检查(多选)
//         reqword:'',//重述
//         userDocumentation:'',//用户文档
//         operationDocument:'',//操作文档
//         opinions:'',//确认意见
//         acceptOpinions:'',//受理意见
//         test_number:'',//测试项目编号
//         remarks:'你好，我叫李智聪',//备注
//         acceptee_signature:'',//受理人签名
//         acceptee_signature_time:'',//受理人签名日期
//         completedByClient:'',//委托人填写
//         client_signature:'',//委托人签名
//         client_signature_time:'',//委托人签名日期
//       },
//       {
//         pid: '2',
//         name: '两开花',
//         time: '2019-09-21 08:50:65',
//         processState: '委托审核通过',
//       },
//       {
//         pid: '3',
//         name: '我爸是李刚',
//         time: '2019-09-21 08:50:65',
//         processState: '委托已提交待审核',
//       },
//       {
//         pid: '4',
//           name: '总有刁民想害朕',
//           time: '2019-09-21 08:50:65',
//           processState: '委托审核未提交', 
//         },
//         {
//           pid: '5',
//           name: '漏油奔',
//           time: '2019-09-21 08:50:65',
//           processState: '委托审核通过',
//         },
//         {
//           pid: '6',
//           name: '隔壁老王',
//           time: '2019-09-21 08:50:65',
//           processState: '委托已提交待审核',
//         },
//         {
//           pid: '7',
//           name: '蔡徐坤',
//           time: '2019-09-21 08:50:65',
//           processState: '委托审核未提交', 
//         },
//         {
//           pid: '8',
//           name: '鸡你太美',
//           time: '2019-09-21 08:50:65',
//           processState: '委托审核通过',
//         },
//         {
//           pid: '9',
//           name: '特朗普',
//           time: '2019-09-21 08:50:65',
//           processState: '委托已提交待审核',
//         },
//         {
//           pid: '10',
//           name: '奥巴马',
//           time: '2019-09-21 08:50:65',
//           processState: '委托审核未通过', 
//         },
//         {
//           pid: '11',
//           name: '大碗宽面',
//           time: '2019-09-21 08:50:65',
//           processState: '委托审核通过',
//         },
//         {
//           pid: '12',
//           name: '金三胖',
//           time: '2019-09-21 08:50:65',
//           processState: '委托已提交待审核',
//         },
//     ]
    // export default {
    //   'get /dev/api/customers/cid/projects': function (req, res) {
    //       // console.log(data);
    //       res.json(data);
    //   },
    //   'get /dev/api/customers/projects/entrust': function (req, res) {
    //     // console.log(req.query)
    //     for(var index in data){
    //       if(data[index].pid===req.query.pid){
    //         // console.log(data[index].pid)
    //         data.splice(index,1)
    //         res.json(data);
    //       }
    //     }
    //  },
    //  'POST /api/basic-form/save': (req, res) => {
        
    //     for(var i in data){
    //       if(data[i].pid===req.body.pid){
    //         save(data[i],req)
    //         // console.log(data[i])
    //       }
    //     }
    //     res.send({ message: 'Ok' });
    //   },
    //   // 'POST /api/basic-form/initGetData': (req, res) => {
    //   //   console.log(req.body)
    //   //   for(var i in data){
    //   //     if(data[i].pid===req.body.pid){
    //   //       res.json(data[i])
            
    //   //     }
    //   //   }
    //   // },
    //   'GET /api/project/entrust': (req, res) => {
    //     console.log('GET /api/project/entrust')
    //     for(var i in data){
    //       if(data[i].pid===req.query.pid){
    //         res.json(data[i])
    //       }
    //     }
    //   },
    //   'POST /api/process/entrust': (req, res) => {
    //     console.log(req.body.expectedDeadline)
    //     for(var i in data){
          
    //       if(data[i].pid===req.body.pid){
    //         // console.log(data[i])
    //         save(data[i],req)
    //         data[i].processState='委托已提交待审核'
            
    //         // console.log(data[i].processState)
    //         // console.log(data[i])
    //         res.send({ message: 'Ok' });
    //       }
    //     }
        
        
    //   },
    // };
    
    // function save(data,req){
    //   data.entrustEntity=req.body.entrustEntity//
    //   data.testType=req.body.testType//测试类型
    //   data.softname=req.body.softname//软件名称
    //   data.version=req.body.version//版本号
    //   data.companyEn=req.body.companyEn//委托单位（英文）
    //   data.companyCh=req.body.companyCh///委托单位（中文）
    //   data.developer=req.body.developer//开发单位
    //   data.unitProperty=req.body.unitProperty//单位性质
    //   data.userDescription=req.body.userDescription//软件用户对象描述
    //   data.funcDescription=req.body.funcDescription//主要功能及用途简介
    //   data.testBasis=req.body.testBasis//测试依据
    //   data.testSpecification=req.body.testSpecification//需要测试的技术指标
    //   //软件规模
    //   data.funcNum=req.body.funcNum//功能数
    //   data.fpNum=req.body.fpNum//功能点数
    //   data.codeLine=req.body.codeLine//代码行数
    //   data.softwareType=req.body.softwareType//系统软件
    //   data.supportSoftware=req.body.supportSoftware//支持软件
    //   data.internetApplications=req.body.internetApplications//应用软件
    
    //   //客户端
    //   data.clientSystem=req.body.clientSystem//操作系统
    //   data.clientExStorage=req.body.clientExStorage//内存要求
    //   data.clientInStorage=req.body.clientInStorage//硬盘要求
    //   data.clientOther=req.body.clientOther//其他要求
    //   //服务器端 硬件
    //   data.serverHardFrame=req.body.serverHardFrame//硬件架构
    //   data.serverInStorage=req.body.serverInStorage//内存要求
    //   data.serverExStorage=req.body.serverExStorage//硬盘要求
    //   data.serverOther=req.body.serverOther//其他要求
    //   //服务器端 软件
    //   data.serverSystem=req.body.serverSystem//操作系统
    //   data.serverSoftVersion=req.body.serverSoftVersion//版本
    //   data.serverLanguage=req.body.serverLanguage//编程语言
    //   data.serverSoftFrame=req.body.serverSoftFrame//软件架构
    //   data.serverDataBase=req.body.serverDataBase//数据库
    //   data.serverSoftMidW=req.body.serverSoftMidW//中间件
    //   data.serverSupport=req.body.serverSupport//支持
    //   //网络环境
    //   data.webEnvironment=req.body.webEnvironment//主要功能及用途简介
    //   //样品和数量
    //   data.sampleType=req.body.sampleType//样品类型
    //   data.sampleFile=req.body.sampleFile//样品文件
    //   if(req.body.expectedDeadline){
    //     data.expectedDeadline=req.body.expectedDeadline
    //   }
    //   //软件介质
    //   data.CD=req.body.CD//光盘
    //   data.usbFlashDrive=req.body.usbFlashDrive//U盘
    //   data.softwareMediumOther=req.body.softwareMediumOther//其他
    //   data.sample_document=req.body.sample_document//文档资料
    //   data.sampleChocie=req.body.sampleChocie//提交的样品处理选择
    //   //委托单位信息
    //   data.infoTE=req.body.cusInfo.infoTE//cusInfo.电话
    //   data.infoFAX=req.body.cusInfo.infoFAX//cusInfo.传真
    //   data.infoAddr=req.body.cusInfo.infoAddr//cusInfo.地址
    //   data.infoPostcode=req.body.cusInfo.infoPostcode//cusInfo.邮编
    //   data.infoName=req.body.cusInfo.infoName//cusInfo.联系人
    //   data.infoPhone=req.body.cusInfo.infoPhone//cusInfo.手机
    //   data.infoEmail=req.body.cusInfo.infoEmail//cusInfo.
    //   data.infoURL=req.body.cusInfo.infoURL//cusInfo.网址
    //   data.encryptionLev=req.body.encryptionLev//密级
    //   data.antiVirus=req.body.antiVirus//查杀病毒
    //   data.checkSample=req.body.checkSample//测试样品
    //   data.reqword=req.body.reqword//重述
    //   data.userDocumentation=req.body.userDocumentation//用户文档
    //   data.operationDocument=req.body.operationDocument//操作文档
    //   data.opinions=req.body.opinions//确认意见
    //   data.acceptOpinions=req.body.acceptOpinions//受理意见
    //   data.test_number=req.body.test_number//测试项目编号
    //   data.remarks=req.body.remarks//备注
    //   data.acceptee_signature=req.body.acceptee_signature//受理人签名
    //   data.acceptee_signature_time=req.body.acceptee_signature_time//受理人签名日期
    //   data.completedByClient=req.body.completedByClient//委托人填写
    //   data.client_signature=req.body.client_signature//委托人签名
    //   data.client_signature_time=req.body.client_signature_time//委托人签名日期
    // }