import {Card ,Breadcrumb ,Button ,Descriptions,Form, Input, Popover, Affix} from 'antd';
import React , {Component} from 'react';
import {connect} from "dva";
import { FormattedMessage,formatMessage } from 'umi/locale';
import {getRole} from "../../../utils/cookieUtils";
import style from './style.less';

const namespace='contractDetail';
const FormItem = Form.Item;

const mapStateToProps = (state) => {
  const dataCheck = state[namespace];
  //console.log("============datacheck===========")
  console.log("输出合同详情的dataCheck",dataCheck);
  //console.log("输出length",typeof dataCheck.check._links == "undefined")
  //console.log("!!!!!!!!!!!!!!!!!!!!!!!!!!!")
  return {
    dataCheck,
  };
};

@Form.create()
@connect(mapStateToProps)
export default class Detail extends Component{
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
    }else{
      this.state.comment=this.props.dataCheck.check.comment
    }
    dispatch({
      type: 'contractDetail/queryGetOneContract',
      payload: this.props.location.query,
    });
  }
  
  review=(form,operation)=> {
    const {dispatch} = this.props;
    this.state.pid = this.props.dataCheck.check.pid;
    // console.log("----------------------------");
    // console.log(this.state.pid);
    // console.log("----------------------------");
    //this.state.comment = this.props.dataCheck.check.comment;
    this.state.comment = this.props.dataCheck.check.comment;
    // console.log("----------------------------");
    // console.log(this.props.dataCheck.check.comment);
    // console.log("----------------------------");
    form.validateFields((err, value)=> {
      var concheck=this.props.dataCheck.check
      concheck.operation=operation
      concheck.comment=value.comment
      // console.log("==========================")
      console.log(concheck.comment)
      // console.log("====================")
      dispatch({
        type: `${namespace}/UpdateProcess`,
        payload: concheck
      });
    })
  }

  render() {
    const {
      form: {getFieldDecorator, getFielValue},
    } = this.props;

    return (
      <div>
        <Breadcrumb>
          <Breadcrumb.Item href="/welcome.html">主页</Breadcrumb.Item>
          <Breadcrumb.Item href="/contract_list.html">合同列表</Breadcrumb.Item>
          <Breadcrumb.Item>合同详情</Breadcrumb.Item>
        </Breadcrumb>
        <br />
        <Card>
          <h2>软件委托测试合同</h2>
        </Card>
        <Card>
          <p>项目名称：小猪佩奇测试</p>
          <p>委托方（甲方）：<FormattedMessage id={this.props.dataCheck.check.client || ' '}/></p>
          <p>受托方（乙方）: <FormattedMessage id={this.props.dataCheck.check.assignee || ' '}/></p>
          <p>签订地点：<FormattedMessage id={this.props.dataCheck.check.signPlace || ' '}/></p>
          <p>签订日期：<FormattedMessage id={this.props.dataCheck.check.signDate || ' '}/></p>
          <p>质量特性：<FormattedMessage id={this.props.dataCheck.check.quality || ' '}/></p>
          <p>合同价款：<FormattedMessage id={this.props.dataCheck.check.price || ' '}/></p>
          <p>履行期限：<FormattedMessage id={this.props.dataCheck.check.finishTime || ' '}/></p>
          <p>委托方--单位全称：<FormattedMessage id={this.props.dataCheck.check.clientCompanyName || ' '}/></p>
          <p>委托方--授权代表：<FormattedMessage id={this.props.dataCheck.check.clientAuthRepre || ' '}/></p>
          <p>委托方--签章日期：<FormattedMessage id={this.props.dataCheck.check.clientSignDate || ' '}/></p>
          <p>委托方--联系人：<FormattedMessage id={this.props.dataCheck.check.clientContact || ' '}/></p>
          <p>委托方--通讯地址：<FormattedMessage id={this.props.dataCheck.check.clientAddr || ' '}/></p>
          <p>委托方--电话：<FormattedMessage id={this.props.dataCheck.check.clientTel || ' '}/></p>
          <p>委托方--传真：<FormattedMessage id={this.props.dataCheck.check.clientFax || ' '}/></p>
          <p>委托方--开户银行：<FormattedMessage id={this.props.dataCheck.check.clientBank || ' '}/></p>
          <p>委托方--账号：<FormattedMessage id={this.props.dataCheck.check.clientUserName || ' '}/></p>
          <p>委托方--邮编：<FormattedMessage id={this.props.dataCheck.check.clientPostCode || ' '}/></p>
          <p>受托方--单位全称：<FormattedMessage id={this.props.dataCheck.check.assigneeCompanyName || ' '}/></p>
          <p>受托方--授权代表：<FormattedMessage id={this.props.dataCheck.check.assigneeAuthRepre || ' '}/></p>
          <p>受托方--签章日期：<FormattedMessage id={this.props.dataCheck.check.assigneeSignDate || ' '}/></p>
          <p>受托方--联系人：<FormattedMessage id={this.props.dataCheck.check.assigneeContact || ' '}/></p>
          <p>受托方--通讯地址：<FormattedMessage id={this.props.dataCheck.check.assigneeAddr || ' '}/></p>
          <p>受托方--电话：<FormattedMessage id={this.props.dataCheck.check.assigneeTel || ' '}/></p>
          <p>受托方--传真：<FormattedMessage id={this.props.dataCheck.check.assigneeFax || ' '}/></p>
          <p>受托方--开户银行：<FormattedMessage id={this.props.dataCheck.check.assigneeBank || ' '}/></p>
          <p>受托方--账号：<FormattedMessage id={this.props.dataCheck.check.assigneeUserName || ' '}/></p>
          <p>受托方--邮编：<FormattedMessage id={this.props.dataCheck.check.assigneePostCode || ' '}/></p>

        </Card>
        <Card>
          <h1>一、任务表述</h1>
        </Card>
        <Card>
          <h1>二、双方的主要义务</h1>
        </Card>
        <br />
        {
          {
            "SM":
            <div>
              <h1>市场部主任</h1>
              <FormItem label={<FormattedMessage id=" 审批意见"/>}>
                {getFieldDecorator('comment', {
                  initialValue: this.props.dataCheck.check.comment || "",
                },{
                  rules: [
                  {
                    required: true,
                    message: formatMessage({id: "需要审批意见"}),
                  },
                ],
                })(<Input placeholder={formatMessage({id: "输入审批意见"})} 
                //当processState是review 并且 checked=0 的时候是可编辑的
                disabled={this.props.dataCheck.check.processState!="Review" || this.props.dataCheck.checked == 1 }
                />)}
              </FormItem>
              <Affix offsetBottom={0} >
              <div>
              {
                //当状态是Review，并且checked=0的时候出现按钮，否则隐藏
                this.props.dataCheck.check.processState=="Review" && this.props.dataCheck.checked == 0?(
                <div className={style.submitBtns}>
                  <Button onClick={() => {
                    this.review(this.props.form,"ReviewPass")
                  }}
                  style={{marginLeft: 250}}
                  type="primary">
                    <FormattedMessage id="同意" />
                  </Button>
                  <Popover content="不同意会让合同重新编辑，不会影响委托" title="注意">
                  <Button onClick={() => {
                    this.review(this.props.form,"ReviewDisprove")
                  }}
                  style={{marginLeft: 400}}
                  >
                    <FormattedMessage id="不同意" />
                  </Button>
                  </Popover>
                </div>)
                :null
              }
              </div>
              </Affix>
            </div>,

            "CUS":
            <div >
              <Descriptions title="客户">
                <Descriptions.Item label="委托状态">{this.props.dataCheck.check.processState || ' '}</Descriptions.Item>
                <Descriptions.Item label="委托意见">{this.props.dataCheck.check.comment || ''}</Descriptions.Item>
                <Descriptions.Item label="已提交样品">这里好像还没做好</Descriptions.Item>
              </Descriptions>
              <Affix offsetBottom={0} >
              <div>
              {
                //当状态是Review的时候出现按钮，否则隐藏
                this.props.dataCheck.check.processState=="Review"?
                <div className={style.submitBtns}>
                  <Button onClick={() => {
                    this.review(this.props.form,"ReviewPass")
                  }}
                  style={{marginLeft: 250}}
                  type="primary">
                    <FormattedMessage id="确认" />
                  </Button>
                  <Button onClick={() => {
                    this.review(this.props.form,"ReviewDisprove")
                  }}
                  style={{marginLeft: 400}}
                  >
                    <FormattedMessage id="拒绝" />
                  </Button>
                </div>
                :null
              }
              </div>
              </Affix>
            </div>,

            "SS":
            <div>
               
            </div>,

            "QM":
            <div>
              <h1>  质量部主任</h1>
              <FormItem label={<FormattedMessage id=" 审批意见"/>}>
                {getFieldDecorator('comment', {
                  initialValue: this.props.dataCheck.check.comment || "",
                },{
                  rules: [
                  {
                    required: true,
                    message: formatMessage({id: "需要审批意见"}),
                  },
                ],
                })(<Input placeholder={formatMessage({id: "输入审批意见"})} 
                //当processState是review的时候是可编辑的
                disabled={this.props.dataCheck.check.processState!="Review" || this.props.dataCheck.checked == 1}
                />)}
              </FormItem>
              <Affix offsetBottom={0} >
              <div>
              {
                //当状态是Review的时候出现按钮，否则隐藏
                this.props.dataCheck.check.processState=="Review" && this.props.dataCheck.checked == 0?
                <div className={style.submitBtns}>
                  <Button onClick={() => {
                    this.review(this.props.form,"ReviewPass")
                  }}
                  style={{marginLeft: 250}}
                  type="primary">
                    <FormattedMessage id="同意" />
                  </Button>
                  <Button onClick={() => {
                    this.review(this.props.form,"ReviewDisprove")
                  }}
                  style={{marginLeft: 400}}>
                    <FormattedMessage id="不同意" />
                  </Button>
                </div>
                :null
              }
              </div>
              </Affix>
            </div>,
          }[getRole()[0]]
        }

      </div>
    )
  }
};
