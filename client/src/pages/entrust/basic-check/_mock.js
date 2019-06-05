const form = [
  {
    pid: '1',
    entrustEntity: '',
    testType: '软件确认测试',
    softwareName: 'little mushroom',
    version: '1.0.2',
    companyEn: 'ABC',
    companyCh: '中文的ABC',
    developer: 'NJUse',
    unitProperty: '科研院校',
    userDescription: '认真搬砖的一群小朋友',
    funcDescription: '有些软件看起来是一个作业，其实它不仅不能被作为一个作业，好很粗糙，还跑不起来',
    testBasis: 'GB/T 16260.1-2006',
    testSpecification: "功能性,可靠性,易用性,效率,可维护性,可移植性,代码覆盖度,缺陷检测率,代码风格符合度,代码不符合项检测率,产品说明要求,用户文档集要求",
    //功能数
    funcNum: '17',
    //功能点数
    fpNum: '18',
    //代码行数
    codeLine: '100000',
    softwareType: '操作系统',
    clientSystem: "Linux",
    clientExStorage: '90',
    clientOther: 'none',
    serverHardFrame: 'PC服务器',
    serverInStorage: '100',
    serverExStorage: '5000',
    serverHardOther: 'none again',
    serverSystem: 'Linux',
    serverSoftVersion: '19.0',
    serverLanguage: 'Java',
    serverSoftFrame: 'C/S',
    serverDataBase: 'mySQL',
    serverSoftMidW: 'what?',
    serverSupport: 'nope',
    webEnvironment: '?',
    sampleType: 'U盘',
    sampleFile: '.TXT,B/TXT',
    sampleChocie: '由本实验室销毁',
    expectedDeadLine: '2019.07.25',
    infoTE: '14956563232',
    infoFAX: 'emmmm',
    infoAddr: '南京大学仙林校区',
    infoPostcode: '014030',
    infoName: 'miao ',
    infoPhone: '1234562146',
    infoEmail: 'keysoftlab@nju.edu.cn',
    infoURL: 'www.miaomiaomiao.io',
    encryptionLev: '机密',
    antiVirus: "已完成",
    checkSample: '源代码',
    opinions: '用户手册',
    acceptOpinions: '测试所需材料不全，未达到受理条件。',
    // model: [
    //   {
    //     key: '1',
    //     name: 'M1',
    //     age: "佩奇",
    //     describe: "客户可在委托管理页面按照委托ID和委托名称对委托进行搜索，按照委托ID、委托名称和委托日期对委托进行排序。点击委托列表中的详情按钮可进入委托详",
    //   },
    //   {
    //     key: '1',
    //     name: 'M2',
    //     age: "佩奇",
    //     describe: "客户可在委托管理页面按照委托ID和委托名称对委托进行搜索，按照委托ID、委托名称和委托日期对委托进行排序。点击委托列表中的详情按钮可进入委托详",
    //   },
    //   {
    //     key: '1',
    //     name: 'M3',
    //     age: "佩奇",
    //     describe: "客户可在委托管理页面按照委托ID和委托名称对委托进行搜索，按照委托ID、委托名称和委托日期对委托进行排序。点击委托列表中的详情按钮可进入委托详",
    //   }
    // ]
  },
]
export default {
  'get /dev/api/project/entrust/pid':function (req,res) {
    console.log(form);
    res.json(form);

  },

}
