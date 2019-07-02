import {Card, Table, Divider, Tag, Input, Button, Breadcrumb, DatePicker, Upload, Icon, message,Form,Descriptions} from 'antd';
import {formatMessage, FormattedMessage} from 'umi/locale';
import {connect} from 'dva';
import React, {Component} from 'react'
import moment from 'moment';
import Link from 'umi/link';
import {getRole} from "../../../utils/cookieUtils";
import { func } from 'prop-types';


const namespace = 'checkentrust';
const {RangePicker} = DatePicker;
const FormItem = Form.Item;
const { TextArea } = Input;

const mapStateToProps = (state) => {
  const entrustdata = state[namespace];
  return {
    entrustdata,
  };
};

// function reviewAgree(form) {
//   const { dispatch } = this.props;
//   this.state.pid=this.props.entrustdata.pid;
//   this.state.comment=this.props.entrustdata.comment;
//   form.validateFields((err,value) => {
//     value.pid=this.state.pid;
//     value.comment=this.state.comment;
//     dispatch({
//       type: 'checkentrust/AgreeEntrust',
//       payload: value,
//     });
//   })
// }
//
// function reviewDisagree(form) {
//   const { dispatch } = this.props;
//   this.state.pid=this.props.entrustdata.pid;
//   this.state.comment=this.props.entrustdata.comment;
//   form.validateFields((err,value) => {
//     value.pid=this.state.pid;
//     value.comment=this.state.comment;
//     dispatch({
//       type: 'checkentrust/DisagreeEntrust',
//       payload: value,
//     });
//   })
// }

//动态渲染button
// var userMaper={
//   "SS":<div class="ssSpace">
//           <FormItem label={<FormattedMessage id="form.sample_document.label"/>}>
//                 <TextArea
//                   style={{minHeight: 32}}
//                   placeholder={formatMessage({id: '请填写您的审批意见，以便客户修改'})}
//                   rows={10}
//                 />
//             </FormItem>
//
//     {/*<Button type = "primary"><FormattedMessage id = "basic-form.form.agree"/></Button>*/}
//     <Button onClick={()=>{reviewAgree(this.props.form)}} style={{marginLeft: 8}}
//             type="primary">
//       <FormattedMessage id="basic-form.form.agree"/>
//     </Button>
//
//     {/*<Button type = "primary" style={{marginLeft: 8}}><FormattedMessage id = "basic-form.form.disagree"/></Button>*/}
//     <Button onClick={()=>{reviewDisagree(this.props.form)}} style={{marginLeft: 8}}
//             type="primary">
//       <FormattedMessage id="basic-form.form.disagree"/>
//     </Button>
//   </div> ,
//
//     "CUS":
//     <Descriptions title="委托状态及意见">
//       <Descriptions.Item label="委托状态">审核未通过</Descriptions.Item>
//       <Descriptions.Item label="委托意见">重写</Descriptions.Item>
//       <Descriptions.Item label="已提交样品">a.zip</Descriptions.Item>
//     </Descriptions>
// }


// function getUserRole(){
//   return userMaper[getRole()[0]]
// }


// const style = {
//   width: '400px',
//   margin: '30px',
//   boxShadow: '0 4px 8px 0 rgba(0, 0, 0, 0.2)',
//   border: '1px solid #e8e8e8',
// }
// const columns = [
//   {
//     title: '模块编号',
//     dataIndex: 'name',
//     key: 'name',
//     render: text => <a href="javascript:;">{text}</a>,
//   },
//   {
//     title: '模块名称',
//     dataIndex: 'age',
//     key: 'age',
//   },
//   {
//     title: '功能描述',
//     key: 'action',
//     render: (text, record) => (
//       <span>
//         {record.describe}
//       </span>
//     ),
//   },
// ];
@Form.create()
@connect(mapStateToProps)
export default class entrustCheck extends Component {
  constructor(props){
    super(props)
    this.state={
      pid:"",
      comment:""
    }
  }
  componentDidMount() {
    const {dispatch} = this.props;
    if(this.props.location.query.comment){
      this.state.comment=this.props.location.query.comment
    }
    else{
      this.state.comment=this.props.entrustdata.comment
    }
    dispatch({
      type: 'checkentrust/getOneEntrust',
      payload: this.props.location.query,
    });
  }

  //审核
  // review=(form)=> {
  //   const { dispatch } = this.props;
  //   this.state.comment=this.props.entrustdata.comment;
  //   form.validateFields((err,value) => {
  //     //修改属性
  //     value.comment=this.state.comment;
  //     dispatch({
  //       type: `${namespace}/queryReviewEntrust`,
  //       payload: value,
  //     });
  //   })
  // };

  // saveCon=(form)=>{
  //   //console.log("AAAAAAAASDASDASDADASDASDASDASDS")
  //   const {dispatch} = this.props;
  //   this.state.pid=this.props.dataEdit.editdata.pid
  //   //console.log(this.state.pid)
  //   form.validateFields((err,value) => {
  //     value.pid=this.state.pid
  //     dispatch({
  //       type: 'contractEdit/querySaveCon',
  //       payload: value,
  //     })
  //   })
  // }

  reviewAgree=(form)=> {
    const {dispatch} = this.props;
    console.log(this.props.entrustdata.entrust);
    this.state.pid = this.props.entrustdata.entrust.pid;
    this.state.comment = this.props.entrustdata.entrust.comment;
    form.validateFields((err, value) => {
      console.log(this.state);
      value.pid = this.state.pid;
      value.comment = this.state.comment;
      console.log("value", value);
      dispatch({
        type: `${namespace}/AgreeEntrust`,
        payload: value,
      });
    })
  }

  reviewDisagree=(form)=>{
    const { dispatch } = this.props;
    console.log(this.props.entrustdata);
    this.state.pid=this.props.entrustdata.pid;
    this.state.comment=this.props.entrustdata.comment;
    form.validateFields((err,value) => {
      value.pid=this.state.pid;
      value.comment=this.state.comment;
      dispatch({
        type: `${namespace}/DisagreeEntrust`,
        payload: value,
      });
    })
  }

  render() {
    const {
      form: {getFieldDecorator, getFieldValue},
    } = this.props;

    return (
      <div>
        <Breadcrumb>
          <Breadcrumb.Item href="/basic-list.html">委托列表</Breadcrumb.Item>
          <Breadcrumb.Item href="/basic-check.html">委托详情</Breadcrumb.Item>
        </Breadcrumb>
        <div><h3>NST-04-JS002-2011-软件项目委托测试申请表(只读)</h3></div>
        <Card style={{width: '100%'}}>
          <p>测试类型：<FormattedMessage id={this.props.entrustdata.entrust.testType || ' '}/></p>
          <p>软件名称：<FormattedMessage id={this.props.entrustdata.entrust.softwareName || ' '}/></p>
          <p>版本号：<FormattedMessage id={this.props.entrustdata.entrust.version || ' '}/></p>
          <p>委托单位（英文）：<FormattedMessage id={this.props.entrustdata.entrust.companyEn || ' '}/></p>
          <p>委托单位（中文）：<FormattedMessage id={this.props.entrustdata.entrust.companyCh || ' '}/></p>
          <p>开发单位：<FormattedMessage id={this.props.entrustdata.entrust.developer || ' '}/></p>
          <p>单位性质：<FormattedMessage id={this.props.entrustdata.entrust.unitProperty || ' '}/></p>
          <p>软件用户对象描述：<FormattedMessage id={this.props.entrustdata.entrust.userDescription || ' '}/></p>
          <p>主要功能及用途简介：<FormattedMessage id={this.props.entrustdata.entrust.funcDescription || ' '}/></p>
          {/* <p style={{display:'flex',justifyItems:'row'}}>测试依据(多选)：<span>{(this.props.entrustdata.entrust.testBasis||[]).map((item,index)=>{return (<span><b> {index+1}</b>.<FormattedMessage id={item||' '}/><br/></span>)})}</span></p>
        <p style={{display:'flex',justifyItems:'row'}}>需要测试的技术指标(多选)：<span>{(this.props.entrustdata.entrust.testSpecification||[]).map((item,index)=>{return (<span><b> {index+1}</b>.<FormattedMessage id={item||' '}/><br/></span>)})}</span></p> */}
          <h3>软件规模</h3>
          <p>功能数：<FormattedMessage id={this.props.entrustdata.entrust.funcNum || ' '}/></p>
          <p>功能点数：<FormattedMessage id={this.props.entrustdata.entrust.fpNum || ' '}/></p>
          <p>代码行数：<FormattedMessage id={this.props.entrustdata.entrust.codeLine || ' '}/></p>
          <p>系统软件：<FormattedMessage id={this.props.entrustdata.entrust.softwareType || ' '}/></p>
          <p>支持软件：<FormattedMessage id={this.props.entrustdata.entrust.supportSoftware || ' '}/></p>
          <p>应用软件：<FormattedMessage id={this.props.entrustdata.entrust.internetApplications || ' '}/></p>
          <h3>客户端</h3>
          {/* <p style={{display:'flex',justifyItems:'row'}}>操作系统(多选)：<span>{(this.props.entrustdata.entrust.clientSystem||[]).map((item,index)=>{return (<span><b> {index+1}</b>.<FormattedMessage id={item||' '}/><br/></span>)})}</span></p> */}
          <p>内存要求：<FormattedMessage id={this.props.entrustdata.entrust.clientInStorage || ' '}/></p>
          <p>硬盘要求：<FormattedMessage id={this.props.entrustdata.entrust.clientExStorage || ' '}/></p>
          <p>其他要求：<FormattedMessage id={this.props.entrustdata.entrust.clientOther || ' '}/></p>
          <h3>服务器端 硬件</h3>
          {/* <p style={{display:'flex',justifyItems:'row'}}>架构(多选)：<span>{(this.props.entrustdata.entrust.serverHardFrame||[]).map((item,index)=>{return (<span><b> {index+1}</b>.<FormattedMessage id={item||' '}/><br/></span>)})}</span></p> */}
          <p>内存要求：<FormattedMessage id={this.props.entrustdata.entrust.serverInStorage || ' '}/></p>
          <p>硬盘要求：<FormattedMessage id={this.props.entrustdata.entrust.serverExStorage || ' '}/></p>
          <p>其他要求：<FormattedMessage id={this.props.entrustdata.entrust.serverHardOther || ' '}/></p>
          <h3>服务器端 软件</h3>
          <p>操作系统：<FormattedMessage id={this.props.entrustdata.entrust.serverSystem || ' '}/></p>
          <p>版本：<FormattedMessage id={this.props.entrustdata.entrust.serverSoftVersion || ' '}/></p>
          <p>编程语言：<FormattedMessage id={this.props.entrustdata.entrust.serverLanguage || ' '}/></p>
          {/* <p style={{display:'flex',justifyItems:'row'}}>软件架构(多选)：<span>{(this.props.entrustdata.entrust.serverSoftFrame||[]).map((item,index)=>{return (<span><b> {index+1}</b>.<FormattedMessage id={item||' '}/><br/></span>)})}</span></p> */}
          <p>数据库：<FormattedMessage id={this.props.entrustdata.entrust.serverDataBase || ' '}/></p>
          <p>中间件：<FormattedMessage id={this.props.entrustdata.entrust.serverSoftMidW || ' '}/></p>
          <p>其他支撑软件<FormattedMessage id={this.props.entrustdata.entrust.serverSupport || ' '}/></p>
          <p>网络环境：<FormattedMessage id={this.props.entrustdata.entrust.webEnvironment || ' '}/></p>
          <h3>样品和数量</h3>
          {/* <p>样品类型：<FormattedMessage id={this.props.entrustdata.entrust.sampleType||' '}/></p>
        <p>样品文件：<FormattedMessage id={this.props.entrustdata.entrust.sampleFile||' '}/></p> */}

          <p>软件介质：<FormattedMessage id={this.props.entrustdata.entrust.sampleType || ' '}/></p>
          {/* <p>光盘：<FormattedMessage id={this.props.entrustdata.entrust.CD||' '}/></p>
        <p>U盘：<FormattedMessage id={this.props.entrustdata.entrust.usbFlashDrive||' '}/></p>
        <p>其他：<FormattedMessage id={this.props.entrustdata.entrust.softwareMediumOther||' '}/></p> */}
          <p>文档资料：<FormattedMessage id={this.props.entrustdata.entrust.sample_document || ' '}/></p>
          <p>提交的样品处理选择：<FormattedMessage id={this.props.entrustdata.entrust.sampleChocie || ' '}/></p>
          <p>希望测试完成时间：
            <RangePicker
              disabled
              style={{display: 'inline-block'}}
              defaultValue={this.props.entrustdata.entrust.expectedDeadline ? [moment((this.props.entrustdata.entrust.expectedDeadline)[0] || ' ', 'YYYY/MM/DD'), moment((this.props.entrustdata.entrust.expectedDeadline)[1] || ' ', 'YYYY/MM/DD')] : null}
              placeholder={[
                formatMessage({id: 'basic-form.placeholder.start'}),
                formatMessage({id: 'basic-form.placeholder.end'}),
              ]}
            />
          </p>
          <h3>委托单位信息</h3>
          <p>电话：<FormattedMessage id={this.props.entrustdata.entrust.infoTE || ' '}/></p>
          <p>传真：<FormattedMessage id={this.props.entrustdata.entrust.infoFAX || ' '}/></p>
          <p>地址：<FormattedMessage id={this.props.entrustdata.entrust.infoAddr || ' '}/></p>
          <p>邮编：<FormattedMessage id={this.props.entrustdata.entrust.infoPostcode || ' '}/></p>
          <p>联系人：<FormattedMessage id={this.props.entrustdata.entrust.infoName || ' '}/></p>
          <p>手机：<FormattedMessage id={this.props.entrustdata.entrust.infoPhone || ' '}/></p>
          <p>Email：<FormattedMessage id={this.props.entrustdata.entrust.infoEmail || ' '}/></p>
          <p>网址：<FormattedMessage id={this.props.entrustdata.entrust.infoURL || ' '}/></p>
          <p>密级：<FormattedMessage id={this.props.entrustdata.entrust.encryptionLev || ' '}/></p>
          <p>查杀病毒：<FormattedMessage id={this.props.entrustdata.entrust.antiVirus || ' '}/></p>
          <p>编程语言：<FormattedMessage id={this.props.entrustdata.entrust.serverLanguage || ' '}/></p>
          {/* <p style={{display:'flex',justifyItems:'row'}}>材料检查(多选)：<span>{(this.props.entrustdata.entrust.checkSample||[]).map((item,index)=>{return (<span><b> {index+1}</b>.<FormattedMessage id={item||' '}/><br/></span>)})}</span></p> */}
          <p>重述：<FormattedMessage id={this.props.entrustdata.entrust.reqword || ' '}/></p>
          <p>用户文档：<FormattedMessage id={this.props.entrustdata.entrust.userDocumentation || ' '}/></p>
          <p>操作文档：<FormattedMessage id={this.props.entrustdata.entrust.operationDocument || ' '}/></p>
          {/* <p>评审意见：<FormattedMessage id={this.props.entrustdata.entrust.comment || ' '}/></p> */}
          <p>流程状态：{this.props.entrustdata.entrust.processState || ' '}</p>
        </Card>
        {/*{userMaper[getRole()[0]]}*/}
        {
          {
            "SS": <div class="ssSpace">
              <FormItem label={<FormattedMessage id="审批意见"/>}>
                {getFieldDecorator('comment', {
                  initialValue: this.props.entrustdata.entrust.comment || '',
                }, {
                  rules: [
                    {
                      required: true,
                      message: formatMessage({id: '需要审批意见'}),
                    },
                  ],
                })(<Input placeholder={formatMessage({id: '输入审批意见'})}/>)}
              </FormItem>
              {/*<Button type = "primary"><FormattedMessage id = "basic-form.form.agree"/></Button>*/}
              {/*<Link to="./basic-list">*/}
                <Button onClick={() => {
                  this.reviewAgree(this.props.form)
                }} style={{marginLeft: 8}}
                        type="primary">
                  <FormattedMessage id="basic-form.form.agree"/>
                </Button>
              {/*</Link>*/}
              {/*<Button type = "primary" style={{marginLeft: 8}}><FormattedMessage id = "basic-form.form.disagree"/></Button>*/}
              <Button onClick={() => {
                this.reviewDisagree(this.props.form)
              }} style={{marginLeft: 8}}
                      type="primary">
                <FormattedMessage id="basic-form.form.disagree"/>
              </Button>
            </div>,

            "CUS":
              <Descriptions title="委托状态及意见">
                <Descriptions.Item label="委托状态">审核未通过</Descriptions.Item>
                <Descriptions.Item label="委托意见">重写</Descriptions.Item>
                <Descriptions.Item label="已提交样品">a.zip</Descriptions.Item>
              </Descriptions>
          }[getRole()[0]]
        }

        {/*{getUserRole()}*/}
        {/* {test("SS")} */}
        {/*{getUserRole()}*/}
      </div>
    )
  }
}

