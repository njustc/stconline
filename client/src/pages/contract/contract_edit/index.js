import React, { PureComponent } from 'react';
import { connect } from 'dva';
import { formatMessage, FormattedMessage } from 'umi/locale';
import {
  Form,
  Input,
  DatePicker,
  Select,
  Button,
  Card,
  InputNumber,
  Radio,
  Icon,
  Tooltip,
  Modal,
  Breadcrumb,
  Affix,
  Spin,
  Divider,
  Row,
  Col
} from 'antd';
import style from './style.less';
import moment from 'moment';

const FormItem = Form.Item;
const { Option } = Select;
const { RangePicker } = DatePicker;
const { TextArea } = Input;
const confirm=Modal.confirm;
const namespace = 'contractEdit';
const dateFormat = 'YYYY/MM/DD';

const mapStateToProps = (state) => {
  const dataEdit = state[namespace];
  //console.log ("DATEEDIT_____________________");
  //console.log (dataEdit);
  return {
    dataEdit,
  };
};

// const mapDispatchToProps = (dispatch) => {
//   return {
//     onDidMount: () => {
//       dispatch({
//         type: `${namespace}/queryInitContracts`,
//       });
//     },
//     querySaveCon:(params) =>{
//       dispatch({
//         type:`${namespace}/querySaveCon`,
//         payload:params
//       })
//     },
//   };
// };

//删除按钮的对话框方法，点击“确认删除”调取delete方法
//      
// function showSaveConfirm() {
//   confirm({
//     title: '是否保存',
//     content: '冲冲冲',
//     okText: '确认保存',
//     concelText: '取消',
//     onOk() {
//       console.log('SAVESAVESAVESAVESAVESAVESAVESAVESAVESAVESAVESAVESAVESAVESAVESAVE');
//       that.props.querySaveCon({pid: key.pid});
//     },
//     onCancel() {
//       console.log('CANCELCANCELCANCELCANCELCANCELCANCELCANCELCANCELCANCELCANCELCANCEL');
//     },
//   });
// }

//提交按钮的对话框方法，点击“提交”调取提交方法
// function showConfirm() {
//   confirm({
//     title: '您是否要提交合同?',
//     content: '合同一旦提交，将无法从线上更改，但您可以在“合同列表”查看本合同详情。提交的合同将由工作人员进行核对。',
//     okText: '提交',
//     cancelText: '取消',
//     onOk() {
//       console.log('OK');
//       //在此方法里提交
//     },
//     onCancel() {
//       console.log('Cancel');
//     },
//   });
// }

@Form.create()
@connect(mapStateToProps)
class BasicForm extends PureComponent {
  constructor(props){
    super(props)
    this.state={
      pid:"",
    }
  }

  componentDidMount() {
    const {dispatch} = this.props;

    dispatch({
      type: `${namespace}/queryGetOneCon`,
      payload: this.props.location.query,
    });
  };

  saveCon=(form)=>{
    //console.log("AAAAAAAASDASDASDADASDASDASDASDS")
    const {dispatch} = this.props;
    this.state.pid=this.props.dataEdit.editdata.pid
    //console.log(this.state.pid)
    form.validateFields((err,value) => {
      value.pid=this.state.pid
      dispatch({
        type: 'contractEdit/querySaveCon',
        payload: value,
      })
    })
    //console.log("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
  }

  save=(form)=>{
    const {dispatch} = this.props;
    this.state.pid=this.props.dataEdit.editdata.pid
    if(this.state.pid == ""){
      //
    }
    else{
      //console.log("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA")
      this.saveCon(form)
    }
  }

  submit=(form)=>{
    const{ dispatch} = this.props;
    this.state.pid = this.props.dataEdit.editdata.pid
    form.validateFields((err,value) => {
      value.pid = this.state.pid
      value.processInstanceId = this.props.dataEdit.editdata.processInstanceId||""
      value.comment = this.props.dataEdit.editdata.comment||""
      dispatch({
        type: 'contractEdit/submitCon',
        payload: value,
      });
    })
    //console.log("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
  };

  // showDelete(con) {
  //   var that = this
  //   confirm({
  //     title: '您是否要废止合同',
  //     content: ''
  //   })
  // }

  showConfirm(con) {
    var that=this
    confirm({
      title: '您是否要提交合同？',
      content: '提交之后不能再修改',
      okText: '确认',
      //okType: 'primarysubmit',
      cancelText: '取消',
      onOk() {
        //that.saveCon(con);
        //console.log("执行了saveCon，即将执行submit",con);
        that.submit(con);
      },
      onCancel() {
        console.log('Cancel');
      },
    });
  }

  render() {
    const {
      form: { getFieldDecorator, getFieldValue },
    } = this.props;

    const formItemLayout = {
      labelCol: {
        xs: { span: 24 },
        sm: { span: 7 },
      },
      wrapperCol: {
        xs: { span: 24 },
        sm: { span: 12 },
        md: { span: 10 },
      },
    };

    const submitFormLayout = {
      wrapperCol: {
        xs: { span: 24, offset: 0 },
        sm: { span: 10, offset: 7 },
      },
    };

    return (
	<div>
		<Breadcrumb>
			<Breadcrumb.Item href="/welcome.html">主页</Breadcrumb.Item>
      <Breadcrumb.Item href="/contract_list.html">合同列表</Breadcrumb.Item>
			<Breadcrumb.Item>合同编辑</Breadcrumb.Item>
		</Breadcrumb>
		<br />
		<Card bordered={false}>
		<h1>软件委托测试合同</h1>
		</Card>
		<br />
      <Card bordered={false}>
			<FormItem {...formItemLayout} label={<FormattedMessage id="contract.projectName.label" />}>
        {getFieldDecorator('projectName',{
          initialValue: this.props.dataEdit.editdata.projectName || '',
        } ,{
          rules: [{
                    required: true,
                    message: formatMessage({ id: 'validation.projectName.required' }),
                  },
                 ],
          })(<Input placeholder={formatMessage({ id: 'contract.projectName.placeholder' })} />)}
      </FormItem>
      {/* 委托方甲方 */}
      <FormItem {...formItemLayout} label={<FormattedMessage id="contract.client.label" />}>
        {getFieldDecorator('client',{
          initialValue: this.props.dataEdit.editdata.client || '',
        } ,{
          rules: [{
                    required: true,
                    message: formatMessage({ id: 'validation.client.required' }),
                  },
                 ],
          })(<Input placeholder={formatMessage({ id: 'contract.client.placeholder' })} />)}
      </FormItem>
      {/* 受托方乙方 assignee*/}
      <FormItem {...formItemLayout} label={<FormattedMessage id="contract.assignee.label" />}>
        {getFieldDecorator('assignee',{
          initialValue: this.props.dataEdit.editdata.assignee || '',
        } ,{
          rules: [{
                    required: true,
                    message: formatMessage({ id: 'validation.assignee.required' }),
                  },
                 ],
          })(<Input placeholder={formatMessage({ id: 'contract.assignee.placeholder' })} />)}
      </FormItem>
      {/* 签订地点 signPlace */}
      <FormItem {...formItemLayout} label={<FormattedMessage id="contract.signPlace.label" />}>
        {getFieldDecorator('signPlace',{
          initialValue: this.props.dataEdit.editdata.signPlace || '',
        } ,{
          rules: [{
                    required: true,
                    message: formatMessage({ id: 'validation.signPlace.required' }),
                  },
                 ],
          })(<Input placeholder={formatMessage({ id: 'contract.signPlace.placeholder' })} />)}
      </FormItem>
      {/* 签订时间 signDate */}
      <FormItem {...formItemLayout} label={<FormattedMessage id="contract.signDate.label" />}>
        {getFieldDecorator('signDate',{
          initialValue: this.props.dataEdit.editdata.signDate || '',
        } ,{
          rules: [{
                    required: true,
                    message: formatMessage({ id: 'validation.signDate.required' }),
                  },
                 ],
          })(<Input placeholder={formatMessage({ id: 'contract.signDate.placeholder' })} />)}
      </FormItem>
      <Divider />
			{/* <FormItem {...formItemLayout} label={<FormattedMessage id="contract.sign_data.label" />}>
				<DatePicker defaultValue={moment(this.props.dataEdit.editdata.signData, dateFormat)} format={dateFormat} />
      </FormItem> */}
      <div><Row>
      <Col span={12}>
      <h1>本合同由作为委托方的</h1>
      </Col>
      {/* 委托方（甲方)client */}
      <Col span={24}>
      <FormItem>
        {getFieldDecorator('client',{
          initialValue: this.props.dataEdit.editdata.client || '',
        } ,{
          rules: [{
                    required: true,
                    message: formatMessage({ id: 'validation.client.required' }),
                  },
                 ],
  })(<Input placeholder={formatMessage({ id: 'contract.client.placeholder' })} style={{width:300}} />)}
      </FormItem>
      </Col>
      </Row></div>
      <h1>（以下简称“甲方”）与作为受托方的南京大学计算机软件新技术国家重点实验室（以下简称“乙方”）在平等自愿的基础上，依据《中华人民共和国合同法》有关规定就项目的执行，经友好协商后订立。</h1>

    </Card>
		<br />
    <Card>
      <h2>一、任务表述</h2>
    </Card>
		<Card>
			<h1>乙方按照国家软件质量测试标准和测试规范，完成甲方委托的软件</h1>
      {/* 等待后端 */}
			<FormItem>
          {getFieldDecorator('softwareName',{
            initialValue: this.props.dataEdit.editdata.softwareName || '',
          } 
          )(<Input placeholder={formatMessage({ id: 'contract.softwareName.placeholder' })} style={{width:300}} />)}
      </FormItem>
			<h1>(下称受测软件)的质量特性</h1>
      <FormItem>
          {getFieldDecorator('quality',{
            initialValue: this.props.dataEdit.editdata.quality || '',
          } 
          )(<Input placeholder={formatMessage({ id: 'contract.quality.placeholder' })} style={{width:300}} />)}
      </FormItem>
			<h1>，进行测试，并出具相应的测试报告。</h1>
		</Card>
		<br />
    <Card>
      <h2>二、双方的主要义务</h2>
    </Card>
    <Card>
      <h2>1. 甲方的主要义务: </h2>
      <h1>(1) 按照合同约定支付所有费用</h1>
      <h1>(2) 按照乙方要求以书面形式出具测试需求，包括测试子特性、测试软硬件环境等</h1>
      <h1>(3) 提供符合交付要求的受测软件产品及相关文档，包括软件功能列表、需求分析、设计文档、用户文档至乙方。</h1>
      <h1>(4) 指派专人配合乙方测试工作，并提供必要的技术培训和技术协助。</h1>
      <h2>2. 乙方的主要义务：</h2>
      <h1>(1) 设计测试用例，制定和实施产品测试方案。</h1>
      <h1>(2) 在测试过程中，定期知会甲方受测软件在测试过程中出现的问题。</h1>
      <h1>(3) 按期完成甲方委托的软件测试工作。</h1>
      <h1>(4) 出具正式的测试报告。</h1>
    </Card>
    <br />
    <Card>
      <h2>三、履约地点</h2>
    </Card>
		<Card>
      <h1>由甲方将受测软件产品送到乙方实施测试。如果由于被测软件本身特点或其它乙方认可的原因，需要在甲方所在地进行测试时，甲方应负担乙方现场测试人员的差旅和食宿费用。</h1>
		</Card>
    <br />
    <Card>
      <h2>四、合同价款</h2>
    </Card>
    <Card>
      <h1>本合同软件测试费用为人民币</h1>
      <FormItem>
        {getFieldDecorator('price',{
          initialValue: this.props.dataEdit.editdata.price || '',
        } ,{
          rules: [{
                    required: true,
                    message: formatMessage({ id: 'validation.price.required' }),
                  },
                 ],
          })(<Input placeholder={formatMessage({ id: 'contract.price.placeholder' })} style={{width:300}}/>)}
      </FormItem>
      <h1>(¥</h1>
        <FormItem>
        {getFieldDecorator('price',{
          initialValue: this.props.dataEdit.editdata.price || '',
        } ,{
          rules: [{
                    required: true,
                    message: formatMessage({ id: 'validation.price.required' }),
                  },
                 ],
          })(<Input placeholder={formatMessage({ id: 'contract.price.placeholder' })} style={{width:300}}/>)}
      </FormItem>
      <h1>元)</h1>
    </Card>
    <br />
    <Card>
      <h2>五、测试费用支付方式</h2>
    </Card>
    <Card>
      <h1>本合同签定后，十个工作日内甲方合同价款至乙方帐户。</h1>
    </Card>
    <br />
    <Card>
      <h2>六、履行的期限</h2>
    </Card>
    <Card>
      <h1>1. 本次测试的履行期限为合同生效之日起</h1>
      <FormItem>
        {getFieldDecorator('finishTime',{
          initialValue: this.props.dataEdit.editdata.finishTime || '',
        } ,{
          rules: [{
                    required: true,
                    message: formatMessage({ id: 'validation.finishTime.required' }),
                  },
                 ],
          })(<Input placeholder={formatMessage({ id: 'contract.finishTime.placeholder' })} style={{width:300}}/>)}
      </FormItem>
      <h1>个自然日内完成。</h1>
      <h1>2. 经甲乙双方同意，可对测试进度作适当修改，并以修改后的测试进度作为本合同执行的期限。</h1>
      <h1>3. 如受测软件在测试过程中出现的问题，导致继续进行测试会影响整体测试进度，则乙方暂停测试并以书面形式通知甲方进行整改。在整个测试过程中，整改次数限于</h1>
      {/* 等待后端 */}
      <FormItem>
        {getFieldDecorator('modifyNum',{
          initialValue: this.props.dataEdit.editdata.modifyNum || '',
        } ,{
          rules: [{
                    required: true,
                    message: formatMessage({ id: 'validation.modifyNum.required' }),
                  },
                 ],
          })(<Input placeholder={formatMessage({ id: 'contract.modifyNum.placeholder' })} style={{width:300}}/>)}
      </FormItem>
      <h1>次,每次不超过</h1>
      {/* 等待后端 */}
      <FormItem>
        {getFieldDecorator('modifyTime',{
          initialValue: this.props.dataEdit.editdata.modifyTime || '',
        } ,{
          rules: [{
                    required: true,
                    message: formatMessage({ id: 'validation.modifyTime.required' }),
                  },
                 ],
          })(<Input placeholder={formatMessage({ id: 'contract.modifyTime.placeholder' })} style={{width:300}}/>)}
      </FormItem>
      <h1>天</h1>
      <h1>4. 如因甲方原因，导致测试进度延迟、应由甲方负责,乙方不承担责任。</h1>
      <h1>5. 如因乙方原因，导致测试进度延迟，则甲方可酌情提出赔偿要求，赔偿金额不超过甲方已付金额的50%。双方经协商一致后另行签订书面协议，作为本合同的补充。</h1>
    </Card>
    <br />
    <Card>
      <h2>七、资料的保密</h2>
    </Card>
    <Card>
      <h1>对于一方向另一方提供使用的秘密信息，另一方负有保密的责任，不得向任何第三方透露。为明确双方的保密义务，双方应签署《软件项目委托测试保密协议》，并保证切实遵守其中条款。</h1>
    </Card>
    <br />
    <Card>
      <h2>八、风险责任的承担</h2>
    </Card>
    <Card>
      <h1>乙方人员在本协议有效期间（包括可能的到甲方出差）发生人身意外或罹患疾病时由乙方负责处理。甲方人员在本协议有效期间（包括可能的到乙方出差）发生人身意外或罹患疾病时由甲方负责处理。</h1>
    </Card>
    <br />
    <Card>
      <h2>九、验收方法</h2>
    </Card>
    <Card>
      <h1>由乙方向甲方提交软件产品鉴定测试报告正本一份，甲方签收鉴定测试报告后，完成验收。</h1>
    </Card>
    <br />
    <Card>
      <h2>十、争议解决</h2>
    </Card>
    <Card>
      <h1>双方因履行本合同所发生的一切争议，应通过友好协商解决；如协商解决不成，就提交市级仲裁委员会进行仲裁。裁决对双方当事人具有同等约束力。</h1>
    </Card>
    <br />
    <Card>
      <h2>十一、其他</h2>
    </Card>
    <Card>
      <h1>本合同自双方授权代表签字盖章之日起生效，自受托方的主要义务履行完毕之日起终止。</h1>
      <h1>本合同未尽事宜由双方协商解决。</h1>
      <h1>本合同的正本一式肆份，双方各执两份，具有同等法律效力。</h1>
    </Card>
    <br />
		<Card>
			<h2>十二、签章</h2>
		</Card>
		<Card>
			<h1>委托方</h1>
      <FormItem label={<FormattedMessage id="contract.clientCompanyName.label" />}>
        {getFieldDecorator('clientCompanyName',{
          initialValue: this.props.dataEdit.editdata.clientCompanyName || '',
        } ,{
          rules: [{
                    required: true,
                    message: formatMessage({ id: 'validation.clientCompanyName.required' }),
                  },
                 ],
          })(<Input placeholder={formatMessage({ id: 'contract.clientCompanyName.placeholder' })} />)}
      </FormItem>
      <FormItem label={<FormattedMessage id="contract.clientAuthRepre.label" />}>
        {getFieldDecorator('clientAuthRepre',{
          initialValue: this.props.dataEdit.editdata.clientAuthRepre || '',
        } ,{
          rules: [{
                    required: true,
                    message: formatMessage({ id: 'validation.clientAuthRepre.required' }),
                  },
                 ],
          })(<Input placeholder={formatMessage({ id: 'contract.clientAuthRepre.placeholder' })} />)}
      </FormItem>
      <FormItem label={<FormattedMessage id="contract.clientSignDate.label" />}>
        {getFieldDecorator('clientSignDate',{
          initialValue: this.props.dataEdit.editdata.clientSignDate || '',
        } ,{
          rules: [{
                    required: true,
                    message: formatMessage({ id: 'validation.clientSignDate.required' }),
                  },
                 ],
          })(<Input placeholder={formatMessage({ id: 'contract.clientSignDate.placeholder' })} />)}
      </FormItem>
      <FormItem label={<FormattedMessage id="contract.clientContact.label" />}>
        {getFieldDecorator('clientContact',{
          initialValue: this.props.dataEdit.editdata.clientContact || '',
        } ,{
          rules: [{
                    required: true,
                    message: formatMessage({ id: 'validation.clientContact.required' }),
                  },
                 ],
          })(<Input placeholder={formatMessage({ id: 'contract.clientContact.placeholder' })} />)}
      </FormItem>
      <FormItem label={<FormattedMessage id="contract.clientAddr.label" />}>
        {getFieldDecorator('clientAddr',{
          initialValue: this.props.dataEdit.editdata.clientAddr || '',
        } ,{
          rules: [{
                    required: true,
                    message: formatMessage({ id: 'validation.clientAddr.required' }),
                  },
                 ],
          })(<Input placeholder={formatMessage({ id: 'contract.clientAddr.placeholder' })} />)}
      </FormItem>
      <FormItem label={<FormattedMessage id="contract.clientTel.label" />}>
        {getFieldDecorator('clientTel',{
          initialValue: this.props.dataEdit.editdata.clientTel || '',
        } ,{
          rules: [{
                    required: true,
                    message: formatMessage({ id: 'validation.clientTel.required' }),
                  },
                 ],
          })(<Input placeholder={formatMessage({ id: 'contract.clientTel.placeholder' })} />)}
      </FormItem>
      <FormItem label={<FormattedMessage id="contract.clientFax.label" />}>
        {getFieldDecorator('clientFax',{
          initialValue: "62661627",
        } ,{
          rules: [{
                    required: true,
                    message: formatMessage({ id: 'validation.clientFax.required' }),
                  },
                 ],
          })(<Input disabled={true} placeholder={formatMessage({ id: 'contract.clientFax.placeholder' })} />)}
      </FormItem>
      <FormItem label={<FormattedMessage id="contract.clientBank.label" />}>
        {getFieldDecorator('clientBank',{
          initialValue: this.props.dataEdit.editdata.clientBank || '',
        } ,{
          rules: [{
                    required: true,
                    message: formatMessage({ id: 'validation.clientBank.required' }),
                  },
                 ],
          })(<Input placeholder={formatMessage({ id: 'contract.clientBank.placeholder' })} />)}
      </FormItem>
      <FormItem label={<FormattedMessage id="contract.clientUserName.label" />}>
        {getFieldDecorator('clientUserName',{
          initialValue: this.props.dataEdit.editdata.clientUserName || '',
        } ,{
          rules: [{
                    required: true,
                    message: formatMessage({ id: 'validation.clientUserName.required' }),
                  },
                 ],
          })(<Input placeholder={formatMessage({ id: 'contract.clientUserName.placeholder' })} />)}
      </FormItem>
      <FormItem label={<FormattedMessage id="contract.clientPostCode.label" />}>
        {getFieldDecorator('clientPostCode',{
          initialValue: this.props.dataEdit.editdata.clientPostCode || '',
        } ,{
          rules: [{
                    required: true,
                    message: formatMessage({ id: 'validation.clientPostCode.required' }),
                  },
                 ],
          })(<Input placeholder={formatMessage({ id: 'contract.clientPostCode.placeholder' })} />)}
      </FormItem>
		</Card>
		<Card>
			<h1>受托方</h1>
			<FormItem label={<FormattedMessage id="contract.assigneeCompanyName.label" />}>
        {getFieldDecorator('assigneeCompanyName',{
          initialValue: "南京大学计算机软件新技术国家重点实验室",
        } ,{
          rules: [{
                    required: true,
                    message: formatMessage({ id: 'validation.assigneeCompanyName.required' }),
                  },
                 ],
          })(<Input disabled={true} placeholder={formatMessage({ id: 'contract.assigneeCompanyName.placeholder' })} />)}
      </FormItem>
      <FormItem label={<FormattedMessage id="contract.assigneeAuthRepre.label" />}>
        {getFieldDecorator('assigneeAuthRepre',{
          initialValue: this.props.dataEdit.editdata.assigneeAuthRepre || '',
        } ,{
          rules: [{
                    required: true,
                    message: formatMessage({ id: 'validation.assigneeAuthRepre.required' }),
                  },
                 ],
          })(<Input placeholder={formatMessage({ id: 'contract.assigneeAuthRepre.placeholder' })} />)}
      </FormItem>
      <FormItem label={<FormattedMessage id="contract.assigneeSignDate.label" />}>
        {getFieldDecorator('assigneeSignDate',{
          initialValue: this.props.dataEdit.editdata.assigneeSignDate || '',
        } ,{
          rules: [{
                    required: true,
                    message: formatMessage({ id: 'validation.assigneeSignDate.required' }),
                  },
                 ],
          })(<Input placeholder={formatMessage({ id: 'contract.assigneeSignDate.placeholder' })} />)}
      </FormItem>
      <FormItem label={<FormattedMessage id="contract.assigneeContact.label" />}>
        {getFieldDecorator('assigneeContact',{
          initialValue: this.props.dataEdit.editdata.assigneeContact || '',
        } ,{
          rules: [{
                    required: true,
                    message: formatMessage({ id: 'validation.assigneeContact.required' }),
                  },
                 ],
          })(<Input placeholder={formatMessage({ id: 'contract.assigneeContact.placeholder' })} />)}
      </FormItem>
      <FormItem label={<FormattedMessage id="contract.assigneeAddr.label" />}>
        {getFieldDecorator('assigneeAddr',{
          initialValue: this.props.dataEdit.editdata.assigneeAddr || '',
        } ,{
          rules: [{
                    required: true,
                    message: formatMessage({ id: 'validation.assigneeAddr.required' }),
                  },
                 ],
          })(<Input placeholder={formatMessage({ id: 'contract.assigneeAddr.placeholder' })} />)}
      </FormItem>
      <FormItem label={<FormattedMessage id="contract.assigneePostCode.label" />}>
        {getFieldDecorator('assigneePostCode',{
          initialValue: this.props.dataEdit.editdata.assigneePostCode || '',
        } ,{
          rules: [{
                    required: true,
                    message: formatMessage({ id: 'validation.assigneePostCode.required' }),
                  },
                 ],
          })(<Input placeholder={formatMessage({ id: 'contract.assigneePostCode.placeholder' })} />)}
      </FormItem>
      <FormItem label={<FormattedMessage id="contract.assigneeTel.label" />}>
        {getFieldDecorator('assigneeTel',{
          initialValue: this.props.dataEdit.editdata.assigneeTel || '',
        } ,{
          rules: [{
                    required: true,
                    message: formatMessage({ id: 'validation.assigneeTel.required' }),
                  },
                 ],
          })(<Input placeholder={formatMessage({ id: 'contract.assigneeTel.placeholder' })} />)}
      </FormItem>
      <FormItem label={<FormattedMessage id="contract.assigneeFax.label" />}>
        {getFieldDecorator('assigneeFax',{
          initialValue: this.props.dataEdit.editdata.assigneeFax || '',
        } ,{
          rules: [{
                    required: true,
                    message: formatMessage({ id: 'validation.assigneeFax.required' }),
                  },
                 ],
          })(<Input placeholder={formatMessage({ id: 'contract.assigneeFax.placeholder' })} />)}
      </FormItem>
      <FormItem label={<FormattedMessage id="contract.assigneeBank.label" />}>
        {getFieldDecorator('assigneeBank',{
          initialValue: "中国工商银行股份有限公司南京汉口路分理处",
        } ,{
          rules: [{
                    required: true,
                    message: formatMessage({ id: 'validation.assigneeBank.required' }),
                  },
                 ],
          })(<Input disabled = {true} placeholder={formatMessage({ id: 'contract.assigneeBank.placeholder' })} />)}
      </FormItem>
      <FormItem label={<FormattedMessage id="contract.assigneeBankName.label" />}>
        {getFieldDecorator('assigneeBankName',{
          initialValue: "南京大学",
        } ,{
          rules: [{
                    required: true,
                    message: formatMessage({ id: 'validation.assigneeBankName.required' }),
                  },
                 ],
          })(<Input disabled='true' placeholder={formatMessage({ id: 'contract.assigneeBankName.placeholder' })} />)}
      </FormItem>
      <FormItem label={<FormattedMessage id="contract.assigneeUserName.label" />}>
        {getFieldDecorator('assigneeUserName',{
          initialValue: 43010113090141656,
        } ,{
          rules: [{
                    required: true,
                    message: formatMessage({ id: 'validation.assigneeUserName.required' }),
                  },
                 ],
          })(<Input disabled={true} placeholder={formatMessage({ id: 'contract.assigneeUserName.placeholder' })} />)}
      </FormItem>
		</Card>
		<Affix offsetBottom={0} >
      <div className={style.submitBtns}>
		    {/* <FormItem {...submitFormLayout} style={{ marginTop: 32 }}> */}
            <Button type="primary" onClick={()=> this.showConfirm(this.props.form)}>
				        <FormattedMessage id="basic-form.form.submit" />
            </Button>
            <Button style={{ marginLeft: 8 }} onClick={() =>this.save(this.props.form)}>
                <FormattedMessage id="basic-form.form.save" />
            </Button>
			      {/* <Button style={{ marginLeft: 8 }} type="danger" onClick={()=> this.showDelete(this.props.form)}>
			          <FormattedMessage id="废止" />
			      </Button> */}
        {/* </FormItem> */}
      </div>
    </Affix>
	</div>
    );
  }
}

export default BasicForm;
