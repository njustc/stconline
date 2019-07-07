import {
  Card,
  Table,
  Divider,
  Tag,
  Input,
  Button,
  Breadcrumb,
  DatePicker,
  Upload,
  Icon,
  message,
  Form,
  Descriptions,
  BackTop
} from 'antd';
import { formatMessage, FormattedMessage } from 'umi/locale';
import { connect } from 'dva';
import React, { Component } from 'react'
import moment from 'moment';
import Link from 'umi/link';
import { getRole } from "../../../utils/cookieUtils";
import { func } from 'prop-types';
import style from './style.less'


const namespace = 'checkentrust';
const { RangePicker } = DatePicker;
const FormItem = Form.Item;
const { TextArea } = Input;

const mapStateToProps = (state) => {
  const entrustdata = state[namespace];
  return {
    entrustdata,
  };
};

@Form.create()
@connect(mapStateToProps)
export default class entrustCheck extends Component {
  constructor(props) {
    super(props)
    this.state = {
      pid: "",
      comment: ""
    }
  }

  componentDidMount() {
    const { dispatch } = this.props;
    if (this.props.location.query.comment) {
      this.state.comment = this.props.location.query.comment
    } else {
      this.state.comment = this.props.entrustdata.comment
    }
    dispatch({
      type: `${namespace}/getOneEntrust`,
      payload: this.props.location.query,
    });
  }

  //审核
  review = (form, operation) => {
    const { dispatch } = this.props;
    this.state.pid = this.props.entrustdata.entrust.pid;
    this.state.comment = this.props.entrustdata.entrust.comment;
    form.validateFields((err, value) => {
      var entrust = this.props.entrustdata.entrust
      entrust.operation = operation
      entrust.comment = value.comment
      console.log("en", entrust);
      dispatch({
        type: `${namespace}/ReviewEntrust`,
        payload: entrust,
      });
    })
  }

  

  render() {
    const {
      form: { getFieldDecorator, getFieldValue },
    } = this.props;
    return (
      <div>
        <Breadcrumb>
          <Breadcrumb.Item href="/welcome.html">主页</Breadcrumb.Item>
          <Breadcrumb.Item href="/basic-list.html">委托列表</Breadcrumb.Item>
          <Breadcrumb.Item >委托详情</Breadcrumb.Item>
        </Breadcrumb>
        <div><h2>NST-04-JS002-2011-软件项目委托测试申请表(只读)</h2></div>
        <Card style={{width: '100%'}}
              className={style.mainCard}
        >
          <div className={style.mainCard}>
            <div>
              <h2>基本信息</h2>
              {/* <p style={{display:'flex',justifyItems:'row'}}>测试类型：<span>{(this.props.entrustdata.entrust.testType).map((item,index)=>{
                      return (
                          <span><b> {index+1}</b>.<FormattedMessage id={item||' '}/><br/></span>
                      )}
                  )
                }
              </span>
                </p> */}
              
              <p>软件名称：<FormattedMessage id={this.props.entrustdata.entrust.softwareName || ' '}/></p>
              <p>版本号：<FormattedMessage id={this.props.entrustdata.entrust.version || ' '}/></p>
              <p>委托单位（英文）：<FormattedMessage id={this.props.entrustdata.entrust.companyEn || ' '}/></p>
              <p>委托单位（中文）：<FormattedMessage id={this.props.entrustdata.entrust.companyCh || ' '}/></p>
              <p>开发单位：<FormattedMessage id={this.props.entrustdata.entrust.developer || ' '}/></p>
              <p>单位性质：<FormattedMessage id={this.props.entrustdata.entrust.unitProperty || ' '}/></p>
              <p>软件用户对象描述：<FormattedMessage id={this.props.entrustdata.entrust.userDescription || ' '}/></p>
              <p>主要功能及用途简介：<FormattedMessage id={this.props.entrustdata.entrust.funcDescription || ' '}/></p>
              {/* <p style={{display:'flex',justifyItems:'row'}}>测试依据(多选)：
              <span>{
                (this.props.entrustdata.entrust.testBasis||[]).map((item,index)=>{
                  return (<span><b> {index+1}</b>.<FormattedMessage id={item||' '}/><br/></span>)}
                  )}</span></p>
              <p style={{display:'flex',justifyItems:'row'}}>需要测试的技术指标(多选)：<span>{
                (this.props.entrustdata.entrust.testSpecification||[]).map((item,index)=>{
                  return (<span><b> {index+1}</b>.<FormattedMessage id={item||' '}/><br/></span>)}
                  )}</span></p>  */}
            
            </div>
            <Divider/>
            <div>

              <h2>软件规模</h2>
              <p>功能数：<FormattedMessage id={this.props.entrustdata.entrust.funcNum || ' '}/></p>
              <p>功能点数：<FormattedMessage id={this.props.entrustdata.entrust.fpNum || ' '}/></p>
              <p>代码行数：<FormattedMessage id={this.props.entrustdata.entrust.codeLine || ' '}/></p>
              <p>软件类型：<FormattedMessage id={this.props.entrustdata.entrust.softwareType || ' '}/></p>
            </div>
            <Divider/>
            <div>
              <h2>客户端</h2>
              {/* <p style={{display:'flex',justifyItems:'row'}}>操作系统(多选)：<span>{
                (this.props.entrustdata.entrust.clientSystem||[]).map((item,index)=>{
                  return (<span><b> {index+1}</b>.<FormattedMessage id={item||' '}/><br/></span>)}
                  )}
              </span></p> */}
              <p>内存要求：<FormattedMessage id={this.props.entrustdata.entrust.clientInStorage || ' '}/></p>
              <p>硬盘要求：<FormattedMessage id={this.props.entrustdata.entrust.clientExStorage || ' '}/></p>
              <p>其他要求：<FormattedMessage id={this.props.entrustdata.entrust.clientOther || ' '}/></p>
              <h2>服务器端 硬件</h2>
              {/* <p style={{display:'flex',justifyItems:'row'}}>架构(多选)：<span>{
                (this.props.entrustdata.entrust.serverHardFrame||[]).map((item,index)=>{
                return (<span><b> {index+1}</b>.<FormattedMessage id={item||' '}/><br/></span>)}
                )}</span></p> */}
              <p>内存要求：<FormattedMessage id={this.props.entrustdata.entrust.serverInStorage || ' '}/></p>
              <p>硬盘要求：<FormattedMessage id={this.props.entrustdata.entrust.serverExStorage || ' '}/></p>
              <p>其他要求：<FormattedMessage id={this.props.entrustdata.entrust.serverHardOther || ' '}/></p>
            </div>
            <Divider/>
            <div>
              <h2>服务器端 软件</h2>
              <p>操作系统：<FormattedMessage id={this.props.entrustdata.entrust.serverSystem || ' '}/></p>
              <p>版本：<FormattedMessage id={this.props.entrustdata.entrust.serverSoftVersion || ' '}/></p>
              <p>编程语言：<FormattedMessage id={this.props.entrustdata.entrust.serverLanguage || ' '}/></p>
              {/* <p style={{display:'flex',justifyItems:'row'}}>软件架构(多选)：<span>{
                (this.props.entrustdata.entrust.serverSoftFrame||[]).map((item,index)=>{
                  return (<span><b> {index+1}</b>.<FormattedMessage id={item||' '}/><br/></span>)}
                  )}</span></p> */}
              <p>数据库：<FormattedMessage id={this.props.entrustdata.entrust.serverDataBase || ' '}/></p>
              <p>中间件：<FormattedMessage id={this.props.entrustdata.entrust.serverSoftMidW || ' '}/></p>
              <p>其他支撑软件<FormattedMessage id={this.props.entrustdata.entrust.serverSupport || ' '}/></p>
              <p>网络环境：<FormattedMessage id={this.props.entrustdata.entrust.webEnvironment || ' '}/></p>
            </div>
            <Divider/>
            <div>
              <h2>样品和数量</h2>
              <p>软件介质：<FormattedMessage id={this.props.entrustdata.entrust.sampleType || ' '}/></p>
              <p>提交的样品处理选择：<FormattedMessage id={this.props.entrustdata.entrust.sampleChocie || ' '}/></p>
              <p>希望测试完成时间：<FormattedMessage id={this.props.entrustdata.entrust.expectedDeadline || ' '}/>
              </p>
            </div>
            <Divider/>
            <div>
              <h2>委托单位信息</h2>
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
              {/* <p style={{display:'flex',justifyItems:'row'}}>材料检查(多选)：<span>
              {
                (this.props.entrustdata.entrust.checkSample||[]).map((item,index)=>{
                  return (
                  <span><b> {index+1}</b>.<FormattedMessage id={item||' '}/><br/></span>)}
                  )
              }</span>
                </p> */}
              <p>重述：<FormattedMessage id={this.props.entrustdata.entrust.reqword || ' '}/></p>
              <p>用户文档：<FormattedMessage id={this.props.entrustdata.entrust.userDocumentation || ' '}/></p>
              <p>操作文档：<FormattedMessage id={this.props.entrustdata.entrust.operationDocument || ' '}/></p>
            </div>
            <div>
              <BackTop visibilityHeight={300}/>
              <strong style={{color: 'rgba(64, 64, 64, 0.6)'}}> </strong>
            </div>
          </div>
        </Card>
        {
          {
            "SS": <div class="ssSpace">
              <FormItem label={<FormattedMessage id="审批意见"/>}>
                {getFieldDecorator('comment', {
                  initialValue: this.props.entrustdata.entrust.comment || '无',
                }, {
                  rules: [
                    {
                      required: true,
                      message: formatMessage({id: '需要审批意见'}),
                    },
                  ],
                })(<Input placeholder={formatMessage({id: '输入审批意见'})}
                          disabled={this.props.entrustdata.entrust.processState != "Review"}
                />)}
              </FormItem>

              {
                this.props.entrustdata.entrust.processState == "Review" ?
                  <Card>
                    <Button onClick={() => {
                      this.review(this.props.entrustdata.entrust, "ReviewPass")
                    }} style={{marginLeft: 8}}
                            type="primary">
                      <FormattedMessage id="basic-form.form.agree"/>
                    </Button>
                    <Button onClick={() => {
                      this.review(this.props.entrustdata.entrust, "ReviewDisprove")
                    }} style={{marginLeft: 8}}
                            type="primary"
                            disabled={this.props.entrustdata.entrust.processState != "Review"}>
                      <FormattedMessage id="basic-form.form.disagree"/>
                    </Button>
                  </Card>
                  : null
              }
            </div>,

            "CUS":
              <Card>
                <Descriptions title="委托状态及意见">
                  <Descriptions.Item
                    label="委托状态">{this.props.entrustdata.entrust.processState || ' '}</Descriptions.Item>
                  <Descriptions.Item label="委托意见">{this.props.entrustdata.entrust.comment || ' '}</Descriptions.Item>
                </Descriptions>
              </Card>
          }[getRole()[0]]
        }
      </div>
    )
  }
}

class contentList extends Component{

}

