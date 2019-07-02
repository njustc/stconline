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

//删除按钮的对话框方法，点击“确认删除”调取delete方法
function showDeleteConfirm() {
  confirm({
    title: '您是否要删除本合同?',
    content: '合同一旦删除不可恢复',
    okText: '确认删除',
    okType: 'danger',
    cancelText: '取消',
    onOk() {
      console.log('OK');
      //在此方法里使用delete
    },
    onCancel() {
      console.log('Cancel');
    },
  });
}

//提交按钮的对话框方法，点击“提交”调取提交方法
function showConfirm() {
  confirm({
    title: '您是否要提交合同?',
    content: '合同一旦提交，将无法从线上更改，但您可以在“合同列表”查看本合同详情。提交的合同将由工作人员进行核对。',
    okText: '提交',
    cancelText: '取消',
    onOk() {
      console.log('OK');
      //在此方法里提交
    },
    onCancel() {
      console.log('Cancel');
    },
  });
}

@Form.create()
@connect(mapStateToProps)
class BasicForm extends PureComponent {
  componentDidMount() {
    const {dispatch} = this.props;

    dispatch({
      type: `${namespace}/queryGetOneCon`,
      payload: this.props.location.query,
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
                rules: [
                  {
                    required: true,
                    message: formatMessage({ id: 'validation.project_name.required' }),
                  },
                ],
              })(<Input placeholder={formatMessage({ id: 'contract.project_name.placeholder' })} />)}
            </FormItem>
			<FormItem {...formItemLayout} label={<FormattedMessage id="contract.sign_data.label" />}>
				<DatePicker defaultValue={moment("2017,11,27", dateFormat)} format={dateFormat} />
			</FormItem>
        </Card>
		<br />
		<Card bordered={false}>
			<h1>一、任务表述</h1>
			<br />
			<h1>
			乙方按照国家软件质量测试标准和测试规范，完成甲方委托的软件
			<Input  placeholder=" " style={{width:300}}  />
			(下称受测软件)的质量特性
			<Input  placeholder=" " style={{width:300}}  />
			，进行测试，并出具相应的测试报告。
			</h1>
		</Card>
		<br />
		<Card bordered={false}>
		</Card>
		<Card>
			<h2>十二、签章</h2>
		</Card>
		<Card>
			<h1>委托方</h1>
			<FormItem {...formItemLayout} label={<FormattedMessage id="单位全称" />}>
              {getFieldDecorator('project_name',{
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
              {getFieldDecorator('project_name',{
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
        <Button type="primary" onClick={showConfirm}>
				    <FormattedMessage id="basic-form.form.submit" />
        </Button>
        <Button style={{ marginLeft: 8 }}>
            <FormattedMessage id="basic-form.form.save" />
        </Button>
			  <Button style={{ marginLeft: 8}} type="danger" onClick={showDeleteConfirm}>
			      <FormattedMessage id="basic-form.form.delete" />
			  </Button>
    </FormItem>
	</div>
    );
  }
}

export default BasicForm;
