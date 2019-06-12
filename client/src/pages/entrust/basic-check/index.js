import { Card , Table , Divider , Tag , Input , Button , Breadcrumb , DatePicker} from 'antd';
import { formatMessage, FormattedMessage } from 'umi/locale';
import {connect} from 'dva';
import React,{Component} from 'react'
import moment from 'moment';
import Link from 'umi/link'
const namespace='checkentrust'
const { RangePicker } = DatePicker;
const mapStateToProps = (state) => {
  const entrustdata = state[namespace];
  return {
    entrustdata,
  };
};
const style={
  width:'400px',
  margin:'30px',
  boxShadow:'0 4px 8px 0 rgba(0, 0, 0, 0.2)',
  border:'1px solid #e8e8e8',
}
const columns = [
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
const modelListData = [
  {
    key: '1',
    name: 'M1',
    age: "佩奇",
    describe:"客户可在委托管理页面按照委托ID和委托名称对委托进行搜索，按照委托ID、委托名称和委托日期对委托进行排序。点击委托列表中的详情按钮可进入委托详",
  },
  {
    key: '2',
    name: 'M2',
    age: "佩奇",
    describe:"客户可在委托管理页面按照委托ID和委托名称对委托进行搜索，按照委托ID、委托名称和委托日期对委托进行排序。点击委托列表中的详情按钮可进入委托详",
  },
  {
    key: '3',
    name: 'M3',
    age: "佩奇",
    describe:"客户可在委托管理页面按照委托ID和委托名称对委托进行搜索，按照委托ID、委托名称和委托日期对委托进行排序。点击委托列表中的详情按钮可进入委托详",
  }
];
@connect(mapStateToProps)
export default class entrustCheck extends Component {
  componentDidMount() {
    const { dispatch } = this.props;
    
    dispatch({
      type: 'checkentrust/getOneEntrust',
      payload: this.props.location.query,
    });
    console.log(this.props.entrustdata)
    // this.props.entrustdata.entrust.testBasis.map(item=>{console.log(item)})
  }
  render(){
    return (
    <div>
		<Breadcrumb>
			<Breadcrumb.Item href="/basic-list">委托列表</Breadcrumb.Item>
			<Breadcrumb.Item href="/basic-check">委托详情</Breadcrumb.Item>
		</Breadcrumb>
      <div><h3>NST-04-JS002-2011-软件项目委托测试申请表(只读)</h3></div>
      <Card style={{ width: '100%' }}>
        <p>测试类型：<FormattedMessage id={this.props.entrustdata.entrust.testType||' '}/></p>
        <p>软件名称：<FormattedMessage id={this.props.entrustdata.entrust.softwareName||' '}/></p>
        <p>版本号：<FormattedMessage id={this.props.entrustdata.entrust.version||' '}/></p>
        <p>委托单位（英文）：<FormattedMessage id={this.props.entrustdata.entrust.companyEn||' '}/></p>
        <p>委托单位（中文）：<FormattedMessage id={this.props.entrustdata.entrust.companyCh||' '}/></p>
        <p>开发单位：<FormattedMessage id={this.props.entrustdata.entrust.developer||' '}/></p>
        <p>单位性质：<FormattedMessage id={this.props.entrustdata.entrust.unitProperty||' '}/></p>
        <p>软件用户对象描述：<FormattedMessage id={this.props.entrustdata.entrust.userDescription||' '}/></p>
        <p>主要功能及用途简介：<FormattedMessage id={this.props.entrustdata.entrust.funcDescription||' '}/></p>
        <p style={{display:'flex',justifyItems:'row'}}>测试依据(多选)：<span>{(this.props.entrustdata.entrust.testBasis||[]).map((item,index)=>{return (<span><b> {index+1}</b>.<FormattedMessage id={item||' '}/><br/></span>)})}</span></p>
        <p style={{display:'flex',justifyItems:'row'}}>需要测试的技术指标(多选)：<span>{(this.props.entrustdata.entrust.testSpecification||[]).map((item,index)=>{return (<span><b> {index+1}</b>.<FormattedMessage id={item||' '}/><br/></span>)})}</span></p>
        <h3>软件规模</h3>
        <p>功能数：<FormattedMessage id={this.props.entrustdata.entrust.funcNum||' '}/></p>
        <p>功能点数：<FormattedMessage id={this.props.entrustdata.entrust.fpNum||' '}/></p>
        <p>代码行数：<FormattedMessage id={this.props.entrustdata.entrust.codeLine||' '}/></p>
        <p>系统软件：<FormattedMessage id={this.props.entrustdata.entrust.softwareType||' '}/></p>
        <p>支持软件：<FormattedMessage id={this.props.entrustdata.entrust.supportSoftware||' '}/></p>
        <p>应用软件：<FormattedMessage id={this.props.entrustdata.entrust.internetApplications||' '}/></p>
        <h3>客户端</h3>
        <p style={{display:'flex',justifyItems:'row'}}>操作系统(多选)：<span>{(this.props.entrustdata.entrust.clientSystem||[]).map((item,index)=>{return (<span><b> {index+1}</b>.<FormattedMessage id={item||' '}/><br/></span>)})}</span></p>
        <p>内存要求：<FormattedMessage id={this.props.entrustdata.entrust.clientInStorage||' '}/></p>
        <p>硬盘要求：<FormattedMessage id={this.props.entrustdata.entrust.clientExStorage||' '}/></p>
        <p>其他要求：<FormattedMessage id={this.props.entrustdata.entrust.clientOther||' '}/></p>
        <h3>服务器端 硬件</h3>
        <p style={{display:'flex',justifyItems:'row'}}>架构(多选)：<span>{(this.props.entrustdata.entrust.serverHardFrame||[]).map((item,index)=>{return (<span><b> {index+1}</b>.<FormattedMessage id={item||' '}/><br/></span>)})}</span></p>
        <p>内存要求：<FormattedMessage id={this.props.entrustdata.entrust.serverInStorage||' '}/></p>
        <p>硬盘要求：<FormattedMessage id={this.props.entrustdata.entrust.serverExStorage||' '}/></p>
        <p>其他要求：<FormattedMessage id={this.props.entrustdata.entrust.serverHardOther||' '}/></p>
        <h3>服务器端 软件</h3>
        <p>操作系统：<FormattedMessage id={this.props.entrustdata.entrust.serverSystem||' '}/></p>
        <p>版本：<FormattedMessage id={this.props.entrustdata.entrust.serverSoftVersion||' '}/></p>
        <p>编程语言：<FormattedMessage id={this.props.entrustdata.entrust.serverLanguage||' '}/></p>
        <p style={{display:'flex',justifyItems:'row'}}>软件架构(多选)：<span>{(this.props.entrustdata.entrust.serverSoftFrame||[]).map((item,index)=>{return (<span><b> {index+1}</b>.<FormattedMessage id={item||' '}/><br/></span>)})}</span></p>
        <p>数据库：<FormattedMessage id={this.props.entrustdata.entrust.serverDataBase||' '}/></p>
        <p>中间件：<FormattedMessage id={this.props.entrustdata.entrust.serverSoftMidW||' '}/></p>
        <p>其他支撑软件<FormattedMessage id={this.props.entrustdata.entrust.serverSupport||' '}/></p>
        <p>网络环境：<FormattedMessage id={this.props.entrustdata.entrust.webEnvironment||' '}/></p>
        <h3>样品和数量</h3>
        {/* <p>样品类型：<FormattedMessage id={this.props.entrustdata.entrust.sampleType||' '}/></p>
        <p>样品文件：<FormattedMessage id={this.props.entrustdata.entrust.sampleFile||' '}/></p> */}
        
        <p>软件介质：<FormattedMessage id={this.props.entrustdata.entrust.sampleType||' '}/></p>
        {/* <p>光盘：<FormattedMessage id={this.props.entrustdata.entrust.CD||' '}/></p>
        <p>U盘：<FormattedMessage id={this.props.entrustdata.entrust.usbFlashDrive||' '}/></p>
        <p>其他：<FormattedMessage id={this.props.entrustdata.entrust.softwareMediumOther||' '}/></p> */}
        <p>文档资料：<FormattedMessage id={this.props.entrustdata.entrust.sample_document||' '}/></p>
        <p>提交的样品处理选择：<FormattedMessage id={this.props.entrustdata.entrust.sampleChocie||' '}/></p>
        <p>希望测试完成时间：
              <RangePicker
                disabled
                style={{ display:'inline-block'}}
                defaultValue={this.props.entrustdata.entrust.expectedDeadline?[moment((this.props.entrustdata.entrust.expectedDeadline)[0]||' ','YYYY/MM/DD'),moment((this.props.entrustdata.entrust.expectedDeadline)[1]||' ','YYYY/MM/DD')]:null}
                placeholder={[
                  formatMessage({ id: 'basic-form.placeholder.start' }),
                  formatMessage({ id: 'basic-form.placeholder.end' }),
                ]}
              />
            </p>
        <h3>委托单位信息</h3>
        <p>电话：<FormattedMessage id={this.props.entrustdata.entrust.infoTE||' '}/></p>
        <p>传真：<FormattedMessage id={this.props.entrustdata.entrust.infoFAX||' '}/></p>
        <p>地址：<FormattedMessage id={this.props.entrustdata.entrust.infoAddr||' '}/></p>
        <p>邮编：<FormattedMessage id={this.props.entrustdata.entrust.infoPostcode||' '}/></p>
        <p>联系人：<FormattedMessage id={this.props.entrustdata.entrust.infoName||' '}/></p>
        <p>手机：<FormattedMessage id={this.props.entrustdata.entrust.infoPhone||' '}/></p>
        <p>Email：<FormattedMessage id={this.props.entrustdata.entrust.infoEmail||' '}/></p>
        <p>网址：<FormattedMessage id={this.props.entrustdata.entrust.infoURL||' '}/></p>
        <p>密级：<FormattedMessage id={this.props.entrustdata.entrust.encryptionLev||' '}/></p>
        <p>查杀病毒：<FormattedMessage id={this.props.entrustdata.entrust.antiVirus||' '}/></p>
        <p>编程语言：<FormattedMessage id={this.props.entrustdata.entrust.serverLanguage||' '}/></p>
        <p style={{display:'flex',justifyItems:'row'}}>材料检查(多选)：<span>{(this.props.entrustdata.entrust.checkSample||[]).map((item,index)=>{return (<span><b> {index+1}</b>.<FormattedMessage id={item||' '}/><br/></span>)})}</span></p>
        <p>重述：<FormattedMessage id={this.props.entrustdata.entrust.reqword||' '}/></p>
        <p>用户文档：<FormattedMessage id={this.props.entrustdata.entrust.userDocumentation||' '}/></p>
        <p>操作文档：<FormattedMessage id={this.props.entrustdata.entrust.operationDocument||' '}/></p>
        <p>确认意见(单选)：<FormattedMessage id={this.props.entrustdata.entrust.opinions||' '}/></p>
        <p>受理意见(单选)：<FormattedMessage id={this.props.entrustdata.entrust.acceptOpinions||' '}/></p>
        <p>流程状态：{this.props.entrustdata.entrust.processState||' '}</p>
        {/* <p>测试项目编号：<FormattedMessage id={this.props.entrustdata.entrust.test_number||' '}/></p>
        <p>备注：<FormattedMessage id={this.props.entrustdata.entrust.remarks||' '}/></p>
        <p>受理人签名：<FormattedMessage id={this.props.entrustdata.entrust.acceptee_signature||' '}/></p>
        <p>受理人签名日期：<FormattedMessage id={this.props.entrustdata.entrust.acceptee_signature_time||' '}/></p>
        <p>委托人填写：<FormattedMessage id={this.props.entrustdata.entrust.completedByClient||' '}/></p>
        <p>委托人签名：<FormattedMessage id={this.props.entrustdata.entrust.client_signature||' '}/></p>
        <p>委托人签名日期：<FormattedMessage id={this.props.entrustdata.entrust.client_signature_time||' '}/></p> */}
      </Card>
      
      <div><h3>NST-04-JS002-2011-软件项目委托测试申请表(只读)</h3></div>
      <div style={{ width: "100%", border:"1px solid"}}>
        测试类型：软件确认测试，成果技术鉴定测试<br/>
        软件名称：小猪佩奇软件测试
      </div>
      <Table columns={columns} dataSource={modelListData} pagination={false} />
      <div><h3>委托状态及意见</h3></div>
      <div>待受理/已受理/已驳回</div>
      <Input.TextArea style={{width:400,height:200}} placeholder="//意见" />
      <div><h3>样品</h3></div>
      <Input.TextArea style={{width:400,height:200}} placeholder="//样品" />
      <div>已提交样品：a.zip</div>
      <Link to={{pathname:'../../basic-form',query:{pid:this.props.entrustdata.entrust.key}}}><Button style={{marginLeft:300}} type="primary">修改</Button></Link>
      <Link to={{pathname:'../../basic-list',query:{pid:this.props.entrustdata.entrust.key}}}><Button style={{marginLeft:300}} type="primary">返回</Button></Link>
    </div>
  )
  } 
}

