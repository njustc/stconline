import {Card,Table, Divider, Tag,Input,Button , Breadcrumb} from 'antd';
import {connect} from "dva";
import Link from "umi/link"
import {Component} from "react";
const namespace = 'checkentrust'
//export default () => {

  const style = {
    width: '400px',
    margin: '30px',
    boxShadow: '0 4px 8px 0 rgba(0, 0, 0, 0.2)',
    border: '1px solid #e8e8e8',
  }

  const model_columns = [
    {
      title: '模块编号',
      dataIndex: 'name',
      key: 'name',
      render: text => <a href="javascript:;">{text}</a>,
    },
    {
      title: '模块名称',
      dataIndex: 'age',
      key: 'age',
    },
    {
      title: '功能描述',
      key: 'action',
      render: (text, record) => (
        <span>
          {record.describe}
        </span>
      ),
    },
  ];

  //mock数据，写完方法后可移入mock文件，并在maptate2props方法里，return时return  form
  // const form = {
  //   pid: '1',
  //   entrustEntity: '',
  //   testType: '软件确认测试',
  //   softwareName: 'little mushroom',
  //   version: '1.0.2',
  //   companyEn: 'ABC',
  //   companyCh: '中文的ABC',
  //   developer: 'NJUse',
  //   unitProperty: '科研院校',
  //   userDescription: '认真搬砖的一群小朋友',
  //   funcDescription: '有些软件看起来是一个作业，其实它不仅不能被作为一个作业，好很粗糙，还跑不起来',
  //   testBasis: 'GB/T 16260.1-2006',
  //   testSpecification: "功能性,可靠性,易用性,效率,可维护性,可移植性,代码覆盖度,缺陷检测率,代码风格符合度,代码不符合项检测率,产品说明要求,用户文档集要求",
  //   //功能数
  //   funcNum: '17',
  //   //功能点数
  //   fpNum: '18',
  //   //代码行数
  //   codeLine: '100000',
  //   softwareType: '操作系统',
  //   clientSystem: "Linux",
  //   clientExStorage: '90',
  //   clientOther: 'none',
  //   serverHardFrame: 'PC服务器',
  //   serverInStorage: '100',
  //   serverExStorage: '5000',
  //   serverHardOther: 'none again',
  //   serverSystem: 'Linux',
  //   serverSoftVersion: '19.0',
  //   serverLanguage: 'Java',
  //   serverSoftFrame: 'C/S',
  //   serverDataBase: 'mySQL',
  //   serverSoftMidW: 'what?',
  //   serverSupport: 'nope',
  //   webEnvironment: '?',
  //   sampleType: 'U盘',
  //   sampleFile: '.TXT,B/TXT',
  //   sampleChocie: '由本实验室销毁',
  //   expectedDeadLine: '2019.07.25',
  //   infoTE: '14956563232',
  //   infoFAX: 'emmmm',
  //   infoAddr: '南京大学仙林校区',
  //   infoPostcode: '014030',
  //   infoName: 'miao ',
  //   infoPhone: '1234562146',
  //   infoEmail: 'keysoftlab@nju.edu.cn',
  //   infoURL: 'www.miaomiaomiao.io',
  //   encryptionLev: '机密',
  //   antiVirus: "已完成",
  //   checkSample: '源代码',
  //   opinions: '用户手册',
  //   acceptOpinions: '测试所需材料不全，未达到受理条件。',
  //   model: [
  //     {
  //       key: '1',
  //       name: 'M1',
  //       age: "佩奇",
  //       describe: "客户可在委托管理页面按照委托ID和委托名称对委托进行搜索，按照委托ID、委托名称和委托日期对委托进行排序。点击委托列表中的详情按钮可进入委托详",
  //     },
  //     {
  //       key: '1',
  //       name: 'M2',
  //       age: "佩奇",
  //       describe: "客户可在委托管理页面按照委托ID和委托名称对委托进行搜索，按照委托ID、委托名称和委托日期对委托进行排序。点击委托列表中的详情按钮可进入委托详",
  //     },
  //     {
  //       key: '1',
  //       name: 'M3',
  //       age: "佩奇",
  //       describe: "客户可在委托管理页面按照委托ID和委托名称对委托进行搜索，按照委托ID、委托名称和委托日期对委托进行排序。点击委托列表中的详情按钮可进入委托详",
  //     }
  //   ]
  // }

  const mapStateToProps=(state)=> {
    const checkform = state[namespace];
    return {
      checkform,
    };
  }
  const mapDispatchToProps=(dispatch)=>{
    return {
      onDidMount:()=>{
        dispatch({
          type:`${namespace}/GetOneEntrust`,
      })
      }
    }
  }
@connect(mapStateToProps,mapDispatchToProps)

export default class EntrustCheck extends React.Component {
  componentDidMount() {
    this.props.onDidMount();
  }
  render() {
    return (
      <div>
        <Breadcrumb>
          <Breadcrumb.Item href="/basic-list.html">委托列表</Breadcrumb.Item>
          <Breadcrumb.Item href="/basic-check.html">委托详情</Breadcrumb.Item>
        </Breadcrumb>
        <div><h3>{this.props.checkform.form} 软件项目委托测试申请表</h3></div>
        <Table  style={{marginTop:50 }} columns={this.columns} dataSource={this.props.checkform.form} />

        {/*<Card>*/}
        {/*  <p>测试类型：{form.testType}</p>*/}
        {/*  <p>软件名称：{form.softwareName}</p>*/}
        {/*  <p>版本号:{form.version}</p>*/}
        {/*  <p>委托单位（中文）：{form.companyCh}</p>*/}
        {/*  <p>委托单位（英文）：{form.companyEn}</p>*/}
        {/*  <p>开发单位：{form.developer}</p>*/}
        {/*  <p>单位性质：{form.unitProperty}</p>*/}
        {/*  <p>软件用户对象描述：{form.userDescription}</p>*/}
        {/*  <p>主要功能及用途简介（限200字）：{form.funcDescription}</p>*/}
        {/*  <p>测试依据：{form.testBasis}</p>*/}
        {/*  <p>需要测试的技术指标：{form.testSpecification}</p>*/}
        {/*  <p>软件规模（至少一种）</p>*/}
        {/*  <p> 功能数（到最后一级菜单）：{form.funcNum}</p>*/}
        {/*  <p> 功能点数：{form.fpNum}</p>*/}
        {/*  <p> 代码行数（不包括注释行、空行）：{form.codeLine}</p>*/}
        {/*  <p>软件类型（单选）：{form.softwareType}</p>*/}
        {/*  <p> 系统软件：</p>*/}
        {/*  <p> 支持软件：</p>*/}
        {/*  <p> 应用软件：</p>*/}
        {/*  <p> 其他：</p>*/}
        {/*  <p>运行环境</p>*/}
        {/*  <p> 客户端</p>*/}
        {/*  <p> 操作系统：{form.clientSystem}</p>*/}
        {/*  <p> 内存要求：{form.clientExStorage}</p>*/}
        {/*  <p> 其他要求：{form.clientOther}</p>*/}
        {/*  <p> 服务器端</p>*/}
        {/*  <p> 硬件</p>*/}
        {/*  <p> 架构：{form.serverHardFrame}</p>*/}
        {/*  <p> 内存要求：{form.serverInStorage}</p>*/}
        {/*  <p> 硬盘要求：{form.serverExStorage}</p>*/}
        {/*  <p> 其他要求：{form.serverHardOther}</p>*/}
        {/*  <p> 软件</p>*/}
        {/*  <p> 操作系统：{form.serverSystem}</p>*/}
        {/*  <p> 版本：{form.serverSoftVersion}</p>*/}
        {/*  <p> 编程语言：{form.serverLanguage}</p>*/}
        {/*  <p> 构架：{form.serverSoftFrame}</p>*/}
        {/*  <p> 数据库：{form.serverDataBase}</p>*/}
        {/*  <p> 中间件：{form.serverSoftMidW}</p>*/}
        {/*  <p> 其他支撑软件：{form.serverSupport}</p>*/}
        {/*  <p> 网络环境：{form.webEnvironment}</p>*/}
        {/*  <p>样品和数量</p>*/}
        {/*  <p> 软件介质：{form.sampleType}</p>*/}
        {/*  <p> 文档资料：{form.sampleFile}</p>*/}
        {/*  <p> 提交的样品（硬拷贝资料、硬件）五年保存期满：{form.sampleChocie}</p>*/}
        {/*  <p>希望测试完成时间：{form.expectedDeadLine}</p>*/}
        {/*  <p>委托单位信息</p>*/}
        {/*  <p> 电话：{form.infoTE}</p>*/}
        {/*  <p> 传真：{form.infoFAX}</p>*/}
        {/*  <p> 地址：{form.infoAddr}</p>*/}
        {/*  <p> 邮编：{form.infoPostcode}</p>*/}
        {/*  <p> 联系人：{form.infoName}</p>*/}
        {/*  <p> 手机：{form.infoPhone}</p>*/}
        {/*  <p> E-mail：{form.infoEmail}</p>*/}
        {/*  <p> 网址：{form.infoURL}</p>*/}
        {/*  <p></p>*/}
        {/*  <p> 密级：{form.encryptionLev}</p>*/}
        {/*  <p> 查杀病毒：{form.antiVirus}</p>*/}
        {/*  <p> 材料检查</p>*/}
        {/*  <p> 测试样品：{form.checkSample}</p>*/}
        {/*  <p> 需求文档：</p>*/}
        {/*  <p> 用户文档：{form.opinions}</p>*/}
        {/*  <p> 操作文档：</p>*/}
        {/*  <p> 其它：</p>*/}
        {/*  <p> 确认意见：{form.acceptOpinions}</p>*/}
        {/*  <p> 受理意见</p>*/}
        {/*  <p> 测试项目编号</p>*/}
        {/*  <p> 备注：</p>*/}
        {/*  <p> 受理人（签字）</p>*/}
        {/*  <p> 日期</p>*/}
        {/*  <p>委托人填写</p>*/}
        {/*  <p> 委托人（签字）</p>*/}
        {/*  <p> 日期</p>*/}
        {/*</Card>*/}

        {/*<div><h3>NST-04-JS002-2011-软件项目委托测试申请表(只读)</h3></div>*/}
        {/*<div style={{ width: "100%", border:"1px solid"}}>*/}
        {/*  测试类型：软件确认测试，成果技术鉴定测试<br/>*/}
        {/*  软件名称：小猪佩奇软件测试*/}
        {/*</div>*/}
        {/*<Table columns={model_columns} dataSource={form.model} pagination={false} />*/}

        <div><h3>委托状态及意见</h3></div>
        <div>待受理/已受理/已驳回</div>
        <Input.TextArea style={{width: 400, height: 200}} placeholder="//意见"/>
        <div><h3>样品</h3></div>
        <Input.TextArea style={{width: 400, height: 200}} placeholder="//样品"/>
        <div>已提交样品：a.zip</div>
        <Button style={{marginLeft: 300}} type="primary">提交</Button>
        <Button style={{marginLeft: 300}} type="primary">删除</Button>
      </div>
    );
  }
}
//}
