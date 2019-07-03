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
  Breadcrumb
} from 'antd';
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
  console.log ("DATEEDIT_____________________");
  console.log (dataEdit);
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
      pid:""
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
  }

  save=(form)=>{
    const {dispatch} = this.props;
    this.state.pid=this.props.dataEdit.editdata.pid
    if(this.state.pid == ""){
      //
    }
    else{
      console.log("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA")
      this.saveCon(form)
    }
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
			<Breadcrumb.Item>合同编辑</Breadcrumb.Item>
		</Breadcrumb>
		<br />
		<Card bordered={false}>
		<h1>软件委托测试合同</h1>
		</Card>
		<br />
        <Card bordered={false}>
			<FormItem {...formItemLayout} label={<FormattedMessage id="contract.project_name.label" />}>
              {getFieldDecorator('project_name',{
                initialValue: this.props.dataEdit.editdata.pid || '',
              } ,{
                rules: [
                  {
                    required: true,
                    message: formatMessage({ id: 'validation.project_name.required' }),
                  },
                ],
              })(<Input placeholder={formatMessage({ id: 'contract.project_name.placeholder' })} />)}
            </FormItem>
			<FormItem {...formItemLayout} label={<FormattedMessage id="contract.sign_data.label" />}>
				<DatePicker defaultValue={moment(this.props.dataEdit.editdata.signData, dateFormat)} format={dateFormat} />
			</FormItem>
        </Card>
		<br />
		<Card bordered={false}>
			<h1>一、任务表述</h1>
			<br />
			<h1>
			乙方按照国家软件质量测试标准和测试规范，完成甲方委托的软件
			<FormItem>
          {getFieldDecorator('软件',{
            initialValue: this.props.dataEdit.editdata.quality || '',
          } 
          )(<Input style={{width:300}} />)}
      </FormItem>
			(下称受测软件)的质量特性
      <FormItem>
          {getFieldDecorator('质量特性',{
            initialValue: this.props.dataEdit.editdata.quality || '',
          } 
          )(<Input style={{width:300}} />)}
      </FormItem>
			，进行测试，并出具相应的测试报告。
			</h1>
		</Card>
		<br />
		<Card bordered={false}>
		</Card>
    <Card title="合同属性排列">
      <FormItem {...formItemLayout} label={<FormattedMessage id="委托方(甲方)" />}>
        {getFieldDecorator('client',{
          initialValue: this.props.dataEdit.editdata.client || '',
        } ,)
        (<Input placeholder={formatMessage({ id: '这里写一写' })} />)}
      </FormItem>

      <FormItem {...formItemLayout} label={<FormattedMessage id="委托方(乙方)" />}>
        {getFieldDecorator('assignee',{
          initialValue: this.props.dataEdit.editdata.assignee || '',
        } ,)
        (<Input placeholder={formatMessage({ id: '这里写一写' })} />)}
      </FormItem>

      <FormItem {...formItemLayout} label={<FormattedMessage id="签订地点" />}>
        {getFieldDecorator('signPlace',{
          initialValue: this.props.dataEdit.editdata.signPlace || '',
        } ,)
        (<Input placeholder={formatMessage({ id: '这里写一写' })} />)}
      </FormItem>

      <FormItem {...formItemLayout} label={<FormattedMessage id="签订日期" />}>
        {getFieldDecorator('signDate',{
          initialValue: this.props.dataEdit.editdata.signDate || '',
        } ,)
        (<Input placeholder={formatMessage({ id: '这里写一写' })} />)}
      </FormItem>

      <FormItem {...formItemLayout} label={<FormattedMessage id="质量特性" />}>
        {getFieldDecorator('quality',{
          initialValue: this.props.dataEdit.editdata.quality || '',
        } ,)
        (<Input placeholder={formatMessage({ id: '这里写一写' })} />)}
      </FormItem>

      <FormItem {...formItemLayout} label={<FormattedMessage id="履行期限" />}>
        {getFieldDecorator('finishTime',{
          initialValue: this.props.dataEdit.editdata.finishTime || '',
        } ,)
        (<Input placeholder={formatMessage({ id: '这里写一写' })} />)}
      </FormItem>

      <FormItem {...formItemLayout} label={<FormattedMessage id="合同价款" />}>
        {getFieldDecorator('price',{
          initialValue: this.props.dataEdit.editdata.price || '',
        } ,)
        (<Input placeholder={formatMessage({ id: '这里写一写' })} />)}
      </FormItem>

      <FormItem {...formItemLayout} label={<FormattedMessage id="委托方--单位全称" />}>
        {getFieldDecorator('clientCompanyName',{
          initialValue: this.props.dataEdit.editdata.clientCompanyName || '',
        } ,)
        (<Input placeholder={formatMessage({ id: '这里写一写' })} />)}
      </FormItem>

      <FormItem {...formItemLayout} label={<FormattedMessage id="委托方--授权代表" />}>
        {getFieldDecorator('clientAuthRepre',{
          initialValue: this.props.dataEdit.editdata.clientAuthRepre || '',
        } ,)
        (<Input placeholder={formatMessage({ id: '这里写一写' })} />)}
      </FormItem>

      <FormItem {...formItemLayout} label={<FormattedMessage id="委托方--签章日期" />}>
        {getFieldDecorator('clientSignDate',{
          initialValue: this.props.dataEdit.editdata.clientSignDate || '',
        } ,)
        (<Input placeholder={formatMessage({ id: '这里写一写' })} />)}
      </FormItem>

      <FormItem {...formItemLayout} label={<FormattedMessage id="委托方--联系人" />}>
        {getFieldDecorator('clientContact',{
          initialValue: this.props.dataEdit.editdata.clientContact || '',
        } ,)
        (<Input placeholder={formatMessage({ id: '这里写一写' })} />)}
      </FormItem>
    </Card >
    <br />
		<Card>
			<h2>十二、签章</h2>
		</Card>
		<Card>
			<h1>委托方</h1>
			<FormItem {...formItemLayout} label={<FormattedMessage id="单位全称" />}>
              {getFieldDecorator('clientCompanyName',{
                initialValue: this.props.dataEdit.editdata.clientCompanyName || '',
              } ,{
                rules: [
                  {
                    required: true,
                    message: formatMessage({ id: '写一写' }),
                  },
                ],
              })(<Input placeholder={formatMessage({ id: '这里写一写' })} />)}
            </FormItem>
		</Card>
		<Card>
			<h1>受托方</h1>
			<FormItem {...formItemLayout} label={<FormattedMessage id="单位全称" />}>
              {getFieldDecorator('assigneeCompanyName',{
                initialValue: this.props.dataEdit.editdata.assigneeCompanyName || '',
              }, {
                rules: [
                  {
                    required: true,
                    message: formatMessage({ id: '写一写' }),
                  },
                ],
              })(<Input placeholder={formatMessage({ id: '这里写一写' })} />)}
            </FormItem>
		</Card>
		
		<FormItem {...submitFormLayout} style={{ marginTop: 32 }}>
        <Button type="primary" /*onClick={showConfirm}*/>
				    <FormattedMessage id="basic-form.form.submit" />
        </Button>
        <Button style={{ marginLeft: 8 }} onClick={() =>this.save(this.props.form)}>
            <FormattedMessage id="basic-form.form.save" />
        </Button>
			  <Button style={{ marginLeft: 8}} type="danger" /*onClick={showDeleteConfirm}*/>
			      <FormattedMessage id="basic-form.form.delete" />
			  </Button>
    </FormItem>
	</div>
    );
  }
}

export default BasicForm;
