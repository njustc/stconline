import React from 'react';
import { connect } from 'dva';
import { formatMessage, FormattedMessage } from 'umi/locale';
import {Form, Input, DatePicker, Select, Button, Card, InputNumber, Radio, Icon, Tooltip, Modal, Breadcrumb} from 'antd';

const FormItem = Form.Item;
const confirm=Modal.confirm;
const namespace='testplanEdit';

// const dateFormat = 'YYYY/MM/DD';

const mapStateToProps = (state) => {
  const dataEdit = state[namespace];
  console.log(dataEdit);
  return {
    dataEdit,
  };
};
function showConfirm() {
  confirm({
    title: '您是否要提交本委托?',
    content: '委托一旦提交，将无法从线上更改，但您可以在“委托列表”查看本委托详情。提交的委托将由工作人员进行核对。',
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
//删除按钮的对话框方法，点击“确认删除”调取delete方法
function showDeleteConfirm() {
  confirm({
    title: '您是否要删除本委托?',
    content: '委托一旦删除不可恢复',
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

// const mapDispatchToProps = (dispatch) => {
//   return {
//
//     queryAddPlan:(newPlan)=>{
//       dispatch({
//         type:`${namespace}/queryAddPlan`,
//         payload:newPlan,
//       });
//     },
//     queryDeletePlan:(params)=>{
//       dispatch({
//         type:`${namespace}/queryDeletePlan`,
//         payload:params
//       })
//     },
//
//   };
// };

// @connect(({ loading }) => ({
//   submitting: loading.effects['basicForm/submitRegularForm'],
// }))
@Form.create()
@connect(mapStateToProps)
export default class EditPlan extends React.Component{
  componentDidMount() {
    const {dispatch} = this.props;

    dispatch({
      type: `${namespace}/queryGetOnePlan`,
      payload: this.props.location.query,
    });
  }
  render() {
    const {
      form: {getFieldDecorator, getFieldValue},
    } = this.props;

    const formItemLayout = {
      labelCol: {
        xs: {span: 24},
        sm: {span: 7},
      },
      wrapperCol: {
        xs: {span: 24},
        sm: {span: 12},
        md: {span: 10},
      },
    };
    const submitFormLayout = {
      wrapperCol: {
        xs: {span: 24, offset: 0},
        sm: {span: 10, offset: 7},
      },
    };

    return (
      <div>
        <Breadcrumb>
          <Breadcrumb.Item href="/welcome.html">主页</Breadcrumb.Item>
          <Breadcrumb.Item>测试方案编辑</Breadcrumb.Item>
        </Breadcrumb>
        <br/>
        <Card bordered={false}>
          <h1>软件委托测试方案</h1>
        </Card>
        <br/>
        <Card bordered={false}>
          <FormItem {...formItemLayout} label={<FormattedMessage id="testplan.edit.label"/>}>
            {getFieldDecorator('author', {
              initialValue: this.props.dataEdit.editdata.author || '',
            }, {rules: [
                {
                  required: true,
                  message: formatMessage({id: 'validation.edit.required'}),
                },
              ],
            })(<Input placeholder={formatMessage({id: 'testplan.edit.placeholder'})}/>)}
          </FormItem>
          <FormItem {...formItemLayout} label={<FormattedMessage id="testplan.check.label"/>}>
            {getFieldDecorator('auditor', {
                initialValue: this.props.dataEdit.editdata.auditor || '',
              },{
              rules: [
                {
                  required: true,
                  message: formatMessage({id: 'validation.check.required'}),
                },
              ],
            })(<Input placeholder={formatMessage({id: 'testplan.check.placeholder'})}/>)}
          </FormItem>
          <FormItem {...formItemLayout} label={<FormattedMessage id="testplan.approve.label"/>}>
            {getFieldDecorator('approver', {
              initialValue: this.props.dataEdit.editdata.approver || '',
            }, {
              rules: [
                {
                  required: true,
                  message: formatMessage({id: 'validation.approve.required'}),
                },
              ],
            })(<Input placeholder={formatMessage({id: 'testplan.approve.placeholder'})}/>)}
          </FormItem>
          <FormItem {...formItemLayout} label={<FormattedMessage id="testplan.hardware.label"/>}>
            {getFieldDecorator('hardware', {
              initialValue: this.props.dataEdit.editdata.hardware || '',
            }, {
              rules: [
                {
                  required: true,
                  message: formatMessage({id: 'validation.hardware.required'}),
                },
              ],
            })(<Input placeholder={formatMessage({id: 'testplan.hardware.placeholder'})}/>)}
          </FormItem>
          <FormItem {...formItemLayout} label={<FormattedMessage id="testplan.software.label"/>}>
            {getFieldDecorator('software', {
              initialValue: this.props.dataEdit.editdata.software || '',
            }, {
              rules: [
                {
                  required: true,
                  message: formatMessage({id: 'validation.software.required'}),
                },
              ],
            })(<Input placeholder={formatMessage({id: 'testplan.software.placeholder'})}/>)}
          </FormItem>
          <FormItem {...formItemLayout} label={<FormattedMessage id="testplan.staff.label"/>}>
            {getFieldDecorator('staff', {
              initialValue: this.props.dataEdit.editdata.staff || '',
            }, {
              rules: [
                {
                  required: true,
                  message: formatMessage({id: 'validation.staff.required'}),
                },
              ],
            })(<Input placeholder={formatMessage({id: 'testplan.staff.placeholder'})}/>)}
          </FormItem>
        </Card>
        <br/>
        <FormItem {...submitFormLayout} style={{marginTop: 32}}>
          <Button type="primary" onClick={showConfirm}>
            <FormattedMessage id="plan_edit.form.submit"/>
          </Button>
          <Button style={{marginLeft: 8}}>
            <FormattedMessage id="plan_edit.form.save"/>
          </Button>
          <Button style={{marginLeft: 8}} type="danger" onClick={showDeleteConfirm}>
            <FormattedMessage id="plan_edit.form.delete"/>
          </Button>
        </FormItem>
      </div>
    );
  }
}
