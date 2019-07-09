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
import {formatMessage, FormattedMessage} from 'umi/locale';
import {connect} from 'dva';
import {getRole} from "../../../utils/cookieUtils";
import React from "react";


// const data= {
//   /** 编制人 */
//   author: 'mmm',
//
//   /** 审核人 */
//   auditor: 'kkk',
//
//   /** 批准人 */
//   approver: 'xxx',
//
//   /** 测试环境--硬件 */
//   hardware: 'hard',
//
//   /** 测试环境--软件 */
//   software: 'soft',
//
//   /** 测试环境--人员 */
//   staff: 'eee',
//
//   /** 测试进度表 */
//   progressTable: 'pppppp',
// };

const namespace='recordDetail';
const FormItem = Form.Item;

const mapStateToProps = (state) => {
  const dataDetail = state[namespace];
  //console.log(dataDetail.detail);
  return {
    dataDetail,
  };
};

@Form.create()
@connect(mapStateToProps)
export default class List extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      pid: "",
      comment: ""
    }
  }

  componentDidMount() {
    const {dispatch} = this.props;
    //console.log(this.props.location);
    dispatch({
      type: `${namespace}/queryGetOneRecord`,
      payload: this.props.location.query,
    });
  }

  //审核
  review = (form, operation) => {
    const {dispatch} = this.props;
    this.state.pid = this.props.dataDetail.detail.pid;
    this.state.comment = this.props.dataDetail.detail.comment;
    form.validateFields((err, value) => {
      var detailvalue = this.props.dataDetail.detail;
      detailvalue.operation = operation;
      detailvalue.comment = value.comment;
      console.log("value", detailvalue);
      dispatch({
        type: `${namespace}/queryReviewTestRecord`,
        payload: detailvalue,
      });
    })
  }

  returnlist = (value) => {
    console.log("开始返回的操作");
    console.log(value);
    const {dispatch} = this.props;
    dispatch({
      type: `${namespace}/returnRecordList`,
      payload: value,
    })
  }

  render() {
    const {
      form: {getFieldDecorator, getFieldValue},
    } = this.props;

    return (
      <div>
        <Breadcrumb>
          <Breadcrumb.Item href="/welcome.html">主页</Breadcrumb.Item>
          <Breadcrumb.Item>测试记录列表</Breadcrumb.Item>
          <Breadcrumb.Item>测试方案详情</Breadcrumb.Item>
        </Breadcrumb>

        <Divider/>
        {/*<div><h2>NST-04-JS002-2011-软件项目测试方案(只读)</h2></div>*/}

        <Card>
          <div>
            <h2>测试记录信息</h2>
            <Divider/>
            <div>
              <p>ID：<FormattedMessage id={this.props.dataDetail.detail.testId || ' '}/></p>
              <p>测试分类：<FormattedMessage id={this.props.dataDetail.detail.testClass || ' '}/></p>
              <p>测试用例设计说明：<FormattedMessage id={this.props.dataDetail.detail.designNotes || ' '}/></p>
              <p>相关规约说明：<FormattedMessage id={this.props.dataDetail.detail.reguNotes || ' '}/></p>
              <p>预期结果：<FormattedMessage id={this.props.dataDetail.detail.expectedResult || ' '}/></p>
              <p>设计人：<FormattedMessage id={this.props.dataDetail.detail.designer || ' '}/></p>
              <p>测试时间：<FormattedMessage id={this.props.dataDetail.detail.testTime || ' '}/></p>
              <p>前提条件：<FormattedMessage id={this.props.dataDetail.detail.preCondition || ' '}/></p>
              <p>测试用例执行过程：<FormattedMessage id={this.props.dataDetail.detail.exeProcess || ' '}/></p>
              <p>实际结果：<FormattedMessage id={this.props.dataDetail.detail.realResult || ' '}/></p>
              <p>是否与预期结果一致：<FormattedMessage id={this.props.dataDetail.detail.isConsistent || ' '}/></p>
              <p>相关bug编号：<FormattedMessage id={this.props.dataDetail.detail.bugId || ' '}/></p>
              <p>用例执行者：<FormattedMessage id={this.props.dataDetail.detail.executor || ' '}/></p>
              <p>确认人：<FormattedMessage id={this.props.dataDetail.detail.approver || ' '}/></p>
            </div>
          </div>
        </Card>
        <br/>

        {
          {
            "TM": <div class="tmSpace">
              <FormItem label={<FormattedMessage id="审批意见"/>}>
                {getFieldDecorator('comment', {
                  initialValue: this.props.dataDetail.detail.comment || '无',
                }, {
                  rules: [
                    {
                      required: true,
                      message: formatMessage({id: '需要审批意见'}),
                    },
                  ],
                })(<Input placeholder={formatMessage({id: '输入审批意见'})}
                          disabled={this.props.dataDetail.detail.processState !== "Review"}
                />)}
              </FormItem>

              {
                this.props.dataDetail.detail.processState === "Review" ?

                  <div>
                    <Button onClick={() => {
                      this.review(this.props.form, "ReviewPass")
                    }} style={{marginLeft: 8}}
                            type="primary">
                      <FormattedMessage id="basic-form.form.agree"/>
                    </Button>
                    <Button onClick={() => {
                      this.review(this.props.form, "ReviewDisprove")
                    }} style={{marginLeft: 8}}
                            type="primary"
                            disabled={this.props.dataDetail.detail.processState !== "Review"}>
                      <FormattedMessage id="basic-form.form.disagree"/>
                    </Button>
                    <Button 
                    onClick= {() => {this.returnlist(this.props)}}
                    style={{marginLeft: 8}}>
                      返回
                    </Button>
                  </div>
                  : null
              }
            </div>,

            "TS":
            <div>
              <Card>
                <Descriptions title="状态及意见">
                  <Descriptions.Item label="状态">{this.props.dataDetail.detail.processState || ' '}</Descriptions.Item>
                  <Descriptions.Item label="意见">{this.props.dataDetail.detail.comment || ' '}</Descriptions.Item>
                </Descriptions>
              </Card>
              <div>
              <Button 
              onClick= {() => {this.returnlist(this.props)}}
              style={{marginLeft: 8}}>
                返回
              </Button>
              </div>
            </div>
          }[getRole()[0]]
        }

      </div>

    )
  }

};
