import React from 'react';
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
  Affix, Divider, BackTop
} from 'antd';
import style from "./style.less";
import PageHeaderWrapper from "../../entrust/basic-form/components/PageHeaderWrapper";

const FormItem = Form.Item;
const confirm=Modal.confirm;
const namespace='testplanEdit';

// const dateFormat = 'YYYY/MM/DD';

const mapStateToProps = (state) => {
  const dataEdit = state[namespace];
  //console.log(dataEdit);
  return {
    dataEdit,
  };
};

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

@Form.create()
@connect(mapStateToProps)
export default class EditPlan extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      pid: ""
    }
  }

  componentDidMount() {
    const {dispatch} = this.props;
    if (this.props.location.query.pid) {
      this.state.pid = this.props.location.query.pid
    } else {
      this.state.pid = this.props.dataEdit.editdata.pid
    }
    if (this.state.pid !== "") {
      dispatch({
        type: `${namespace}/queryGetOnePlan`,
        payload: this.props.location.query,
      });
    }
  }

  addPlan = (form) => {
    const {dispatch} = this.props;
    this.state.pid = this.props.dataEdit.editdata.pid;
    form.validateFields((err, value) => {
      //新建
      value.pid = this.state.pid;
      // 补充新建属性
      value.processInstanceId = "";
      value.processState = "ToSubmit";
      value.comment = "";
      //补充完毕
      dispatch({
        type: `${namespace}/queryAddPlan`,
        payload: value,
      });
    })
  };

  savePlan = (form) => {
    const {dispatch} = this.props;
    this.state.pid = this.props.dataEdit.editdata.pid;
    //console.log("saveform", this.props.dataEdit.editdata);
    form.validateFields((err, value) => {
      //保存
      value.pid = this.state.pid;
      value.processInstanceId = this.props.dataEdit.editdata.processInstanceId;
      value.processState = this.props.dataEdit.editdata.processState;
      //console.log("value", value);
      // value.comment = this.props.dataEdit.editdata.comment;
      dispatch({
        type: `${namespace}/queryReplacePlan`,
        payload: value,
      });
    })
  };

  //保存
  save = (form) => {
    const {dispatch} = this.props;
    //console.log("save", this.props.dataEdit.editdata);
    this.state.pid = this.props.dataEdit.editdata.pid;
    if (this.state.pid == "") {
      this.addPlan(form)
    } else {
      //console.log("报告已存在");
      //console.log(this.state.pid);
      this.savePlan(form)
    }
  };


  //提交
  submitPlan = (form) => {
    const {dispatch} = this.props;
    this.state.pid = this.props.dataEdit.editdata.pid;
    form.validateFields((err, value) => {
      //console.log(this.props.dataEdit.editdata);
      //新建
      value.pid = this.state.pid;
      value.processInstanceId = this.props.dataEdit.editdata.processInstanceId || "";
      value.processState = this.props.dataEdit.editdata.processState || "";
      // value.comment=this.props.dataEdit.editdata.comment;
      //console.log("submitPlan", value);
      dispatch({
        type: `${namespace}/querySubmitPlan`,
        payload: value,
      });
    })
  };

  showSubmit(form) {
    var that = this;
    confirm({
      title: '您是否要提交方案?',
      content: '方案提交后进入审核状态，不可编辑',
      okText: '确认提交',
      okType: 'primary',
      cancelText: '取消',
      onOk() {
        //console.log("submitPlan");
        that.submitPlan(form);
      },
      onCancel() {
        //console.log('Cancel');
      },
    });
  }

  //删除
  delete = (value) => {
    const {dispatch} = this.props;
    dispatch({
      type: `${namespace}/queryDeletePlan`,
      payload: value,
    })
  };

  showDelete(form) {
    var that = this;
    confirm({
      title: '您是否要删除本方案?',
      content: '删除后无法恢复',
      okText: '确认删除',
      okType: 'danger',
      cancelText: '取消',
      onOk() {
        that.state.pid = that.props.dataEdit.editdata.pid;
        form.validateFields((err, value) => {
          //新建
          value.pid = that.state.pid;
          that.delete(value)

        })
      },
      onCancel() {
        //console.log('Cancel');
      },
    });
  }

  render() {
    const {
      form: {getFieldDecorator},
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

    return (
      <div className={style.editBody}>
        <Breadcrumb>
          <Breadcrumb.Item href="/welcome.html">主页</Breadcrumb.Item>
          <Breadcrumb.Item href="/plan_list.html">测试方案列表</Breadcrumb.Item>
          <Breadcrumb.Item>测试方案编辑</Breadcrumb.Item>
        </Breadcrumb>

        <div className={style.headerTitle}>
          <PageHeaderWrapper
            title={<FormattedMessage id="测试方案"/>}
          >
          </PageHeaderWrapper>
        </div>
        <div className={style.formBody}>
          <Form className={style.antForm}>
            <div>
              {/*<Divider/>*/}
              {/*<h2>软件委托测试方案</h2>*/}
              {/*<Divider/>*/}
              <div>
                <h2>基本信息</h2>
                <Divider/>
                {/*编辑人员*/}
                <FormItem {...formItemLayout} label={<FormattedMessage id="testplan.edit.label"/>}>
                  {getFieldDecorator('author', {
                    initialValue: this.props.dataEdit.editdata.author || '',
                  }, {
                    rules: [
                      {
                        required: true,
                        message: formatMessage({id: 'validation.edit.required'}),
                      },
                    ],
                  })(<Input placeholder={formatMessage({id: 'testplan.edit.placeholder'})}/>)}
                </FormItem>
                {/*审核人员*/}
                <FormItem {...formItemLayout} label={<FormattedMessage id="testplan.check.label"/>}>
                  {getFieldDecorator('auditor', {
                    initialValue: this.props.dataEdit.editdata.auditor || '',
                  }, {
                    rules: [
                      {
                        required: true,
                        message: formatMessage({id: 'validation.check.required'}),
                      },
                    ],
                  })(<Input placeholder={formatMessage({id: 'testplan.check.placeholder'})}/>)}
                </FormItem>
                {/*批准人员*/}
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
              </div>
              <div>
                <h2>测试环境</h2>
                <Divider/>
                {/*测试环境-硬件*/}
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
                {/*测试环境-软件*/}
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
                {/*测试环境-人员*/}
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
              </div>
              {/*<div>*/}
                {/*<Affix offsetBottom={0}*/}
                {/*onChange={affixed => console.log(affixed)}>*/}
                <div className={style.submitBtns}>
                  <Button onClick={() => {
                    this.showSubmit(this.props.form)
                  }} style={{marginLeft: 8}}
                          type="primary"
                    // disabled={this.props.dataEdit.editdata.processState != "Submit"}
                  >
                    <FormattedMessage id="plan_edit.form.submit"/>
                  </Button>

                  <Button onClick={() => {
                    this.save(this.props.form)
                  }} style={{marginLeft: 8}}
                    // disabled={this.props.dataEdit.editdata.processState != "Submit"}
                  >
                    <FormattedMessage id="plan_edit.form.save"/>
                  </Button>
                </div>
                {/*</Affix>*/}
              {/*</div>*/}
            </div>
          </Form>
        </div>

      </div>
    );
  }
}
