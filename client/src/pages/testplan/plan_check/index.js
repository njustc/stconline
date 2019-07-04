import {Card, Table, Divider, Tag, Input, Button, Breadcrumb, DatePicker, Upload, Icon, message,Form,Descriptions} from 'antd';
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

const namespace='testplanCheck';
const FormItem = Form.Item;

const mapStateToProps = (state) => {
  const dataCheck = state[namespace];
  //console.log(dataCheck.check);
  return {
    dataCheck,
  };
};

@Form.create()
@connect(mapStateToProps)
export default class List extends React.Component{
  constructor(props){
    super(props)
    this.state={
      pid:"",
      comment:""
    }
  }
  componentDidMount() {
    const {dispatch} = this.props;

    dispatch({
      type: `${namespace}/queryGetOnePlan`,
      payload: this.props.location.query,
    });
  }

  render(){
    const {
      form: {getFieldDecorator, getFieldValue},
    } = this.props;

    return (
      <div>
        <Breadcrumb>
          <Breadcrumb.Item href="/welcome.html">主页</Breadcrumb.Item>
          <Breadcrumb.Item>测试方案详情</Breadcrumb.Item>
        </Breadcrumb>

        <Card>
          <h2>软件委托测试方案</h2>
          <p>编制人：<FormattedMessage id={this.props.dataCheck.check.author || ' '}/></p>
          <p>审核人：<FormattedMessage id={this.props.dataCheck.check.auditor || ' '}/></p>
          <p>批准人：<FormattedMessage id={this.props.dataCheck.check.approver || ' '}/></p>
          <p>测试环境-硬件：<FormattedMessage id={this.props.dataCheck.check.hardware || ' '}/></p>
          <p>测试环境-软件：<FormattedMessage id={this.props.dataCheck.check.software || ' '}/></p>
          <p>测试环境-人员：<FormattedMessage id={this.props.dataCheck.check.staff || ' '}/></p>
          <p>测试进度表：<FormattedMessage id={this.props.dataCheck.check.progressTable || ' '}/></p>
        </Card>
        {
          {
            "QM": <div class="qmSpace">
              <FormItem label={<FormattedMessage id="审批意见"/>} >
                {getFieldDecorator('comment', {
                  initialValue: this.props.dataCheck.check.comment || '无',
                }, {
                  rules: [
                    {
                      required: true,
                      message: formatMessage({id: '需要审批意见'}),
                    },
                  ],
                })(<Input placeholder={formatMessage({id: '输入审批意见'})}
                          disabled={this.props.dataCheck.check.processState!="Review"}
                />)}
              </FormItem>

              {
                this.props.dataCheck.check.processState=="Review"?
                  <div>
                    <Button onClick={() => {
                      this.review(this.props.form,"ReviewPass")
                    }} style={{marginLeft: 8 }}
                            type="primary">
                      <FormattedMessage id="basic-form.form.agree"/>
                    </Button>
                    <Button onClick={() => {
                      this.review(this.props.form,"ReviewDisprove")
                    }} style={{marginLeft: 8}}
                            type="primary"
                            disabled={this.props.dataCheck.check.processState!="Review"}>
                      <FormattedMessage id="basic-form.form.disagree"/>
                    </Button>
                  </div>
                  :null
              }
            </div>,

            "TS":
              <Descriptions title="状态及意见">
                <Descriptions.Item label="状态">{this.props.dataCheck.check.processState || ' '}</Descriptions.Item>
                <Descriptions.Item label="意见">{this.props.dataCheck.check.comment || ' '}</Descriptions.Item>
              </Descriptions>
          }[getRole()[0]]

        }

      </div>

    )
  }

};
