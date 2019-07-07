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
import style from "../../entrust/basic-form/style.less";
import PageHeaderWrapper from "../../entrust/basic-form/components/PageHeaderWrapper";

const FormItem = Form.Item;
const confirm = Modal.confirm;
const namespace = 'testRecordEdit';


const mapStateToProps = (state) => {
  const dataEdit = state[namespace];
  console.log(dataEdit);
  return {
    dataEdit,
  };
};

@Form.create()
@connect(mapStateToProps)
export default class EditRecord extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      pid: "",
      testId: ""
    }
  }

  componentDidMount() {
    const {dispatch} = this.props;
    // console.log(this.props.dataEdit.editdata.testId);
    // console.log(this.props.dataEdit);
    console.log(this.props.location.query);
    if (this.props.location.query.pid) {
      this.state.pid = this.props.location.query.pid || "";
    } else {
      this.state.pid = this.props.dataEdit.editdata.pid || "";
    }
    console.log(this.state.pid);
    if (this.props.location.query.testId) {
      this.state.testId = this.props.location.query.testId || "";
    }
    console.log(this.state.testId);
    if (this.state.testId !== "") {
      dispatch({
        type: `${namespace}/queryGetOneRecord`,
        payload: this.props.location.query,
      });
    } else {
      console.log("???");
      dispatch({
        type: `${namespace}/queryUpdateData`,
      });
    }
  }

  addRecord = (form) => {
    const {dispatch} = this.props;
    this.state.testId = this.props.dataEdit.editdata.testId;
    form.validateFields((err, value) => {
      //新建
      value.pid = this.state.pid;
      value.testId = this.state.testId || "";
      // 补充新建属性
      value.processInstanceId = "";
      value.processState = "Submit";
      console.log("value", value);
      //补充完毕
      dispatch({
        type: `${namespace}/queryAddRecord`,
        payload: value,
      });
    })
  };

  saveRecord = (form) => {
    const {dispatch} = this.props;
    this.state.testId = this.props.dataEdit.editdata.testId;
    console.log("saveform", this.props.dataEdit.editdata);
    form.validateFields((err, value) => {
      //保存
      value.pid = this.state.pid;
      value.testId = this.state.testId || "";
      value.processInstanceId = this.props.dataEdit.editdata.processInstanceId;
      value.processState = this.props.dataEdit.editdata.processState;
      console.log("value", value);
      // value.comment = this.props.dataEdit.editdata.comment;
      dispatch({
        type: `${namespace}/queryReplaceRecord`,
        payload: value,
      });
    })
  };

  //保存
  save = (form) => {
    const {dispatch} = this.props;
    console.log("save", this.props.dataEdit.editdata);
    this.state.pid = this.props.dataEdit.editdata.pid || "";
    this.state.testId = this.props.dataEdit.editdata.testId || "";
    if (this.state.testId === "") {
      console.log("新建");
      this.addRecord(form);
    } else {
      console.log("已存在");
      console.log(this.state.testId);
      this.saveRecord(form);
    }
  };


  //提交
  submitRecord = (form) => {
    const {dispatch} = this.props;
    this.state.pid = this.props.dataEdit.editdata.pid || "";
    this.state.testId = this.props.dataEdit.editdata.testId || "";
    form.validateFields((err, value) => {
      console.log(this.props.dataEdit.editdata);
      //新建
      value.pid = this.state.pid;
      value.testId = this.state.testId;
      value.processInstanceId = this.props.dataEdit.editdata.processInstanceId || "";
      value.processState = this.props.dataEdit.editdata.processState || "";
      // value.comment=this.props.dataEdit.editdata.comment;
      console.log("submitRecord", value);
      dispatch({
        type: `${namespace}/querySubmitRecord`,
        payload: value,
      });
    })
  };

  showSubmit(form) {
    var that = this;
    confirm({
      title: '您是否要提交测试记录?',
      content: '方案提交后进入审核状态，不可编辑',
      okText: '确认提交',
      okType: 'primary',
      cancelText: '取消',
      onOk() {
        console.log("submitRecord");
        that.submitRecord(form);
      },
      onCancel() {
        console.log('Cancel');
      },
    });
  }

  //删除
  delete = (value) => {
    const {dispatch} = this.props;
    dispatch({
      type: `${namespace}/queryDeleteRecord`,
      payload: value,
    })
  };

  showDelete(form) {
    var that = this;
    confirm({
      title: '您是否要删除本测试记录?',
      content: '删除后无法恢复',
      okText: '确认删除',
      okType: 'danger',
      cancelText: '取消',
      onOk() {
        that.state.pid = that.props.dataEdit.editdata.pid || "";
        that.state.testId = that.props.dataEdit.editdata.testId || "";
        form.validateFields((err, value) => {
          //新建
          value.pid = that.state.pid;
          value.testId = that.state.testId || "";
          that.delete(value)

        })
      },
      onCancel() {
        console.log('Cancel');
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
          <Breadcrumb.Item>测试记录编辑</Breadcrumb.Item>
        </Breadcrumb>

        {/*/!*<div className={style.headerTitle}>*!/*/}
        {/*/!*  <PageHeaderWrapper*!/*/}
        {/*/!*    title={<FormattedMessage id="测试方案"/>}*!/*/}
        {/*/!*  >*!/*/}
        {/*/!*  </PageHeaderWrapper>*!/*/}
        {/*</div>*/}
        <Divider/>
        <div className={style.formBody}>
          <Form className={style.antForm}>
            <div>
              {/*<Divider/>*/}
              {/*<h2>软件委托测试方案</h2>*/}
              {/*<Divider/>*/}
              <div>
                <h2>基本信息</h2>
                <Divider/>
                {/*testId*/}
                {/*测试分类*/}
                <FormItem {...formItemLayout} label={<FormattedMessage id="testplan.check.label"/>}>
                  {getFieldDecorator('testClass', {
                    initialValue: this.props.dataEdit.editdata.testClass || '',
                  }, {
                    rules: [
                      {
                        required: true,
                        message: formatMessage({id: 'validation.check.required'}),
                      },
                    ],
                  })(<Input placeholder={formatMessage({id: 'testplan.check.placeholder'})}/>)}
                </FormItem>
                {/*测试用例设计说明*/}
                <FormItem {...formItemLayout} label={<FormattedMessage id="testplan.approve.label"/>}>
                  {getFieldDecorator('designNotes', {
                    initialValue: this.props.dataEdit.editdata.designNotes || '',
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
                {/*<h2>测试环境</h2>*/}
                <Divider/>
                {/*相关规约说明*/}
                <FormItem {...formItemLayout} label={<FormattedMessage id="testplan.hardware.label"/>}>
                  {getFieldDecorator('reguNotes', {
                    initialValue: this.props.dataEdit.editdata.reguNotes || '',
                  }, {
                    rules: [
                      {
                        required: true,
                        message: formatMessage({id: 'validation.hardware.required'}),
                      },
                    ],
                  })(<Input placeholder={formatMessage({id: 'testplan.hardware.placeholder'})}/>)}
                </FormItem>
                {/*预期结果*/}
                <FormItem {...formItemLayout} label={<FormattedMessage id="testplan.software.label"/>}>
                  {getFieldDecorator('expectedResult', {
                    initialValue: this.props.dataEdit.editdata.expectedResult || '',
                  }, {
                    rules: [
                      {
                        required: true,
                        message: formatMessage({id: 'validation.software.required'}),
                      },
                    ],
                  })(<Input placeholder={formatMessage({id: 'testplan.software.placeholder'})}/>)}
                </FormItem>
                {/*设计人员*/}
                <FormItem {...formItemLayout} label={<FormattedMessage id="testplan.staff.label"/>}>
                  {getFieldDecorator('designer', {
                    initialValue: this.props.dataEdit.editdata.designer || '',
                  }, {
                    rules: [
                      {
                        required: true,
                        message: formatMessage({id: 'validation.staff.required'}),
                      },
                    ],
                  })(<Input placeholder={formatMessage({id: 'testplan.staff.placeholder'})}/>)}
                </FormItem>
                {/*设计人员*/}
                {/*<FormItem {...formItemLayout} label={<FormattedMessage id="testplan.staff.label"/>}>*/}
                {/*  {getFieldDecorator('staff', {*/}
                {/*    initialValue: this.props.dataEdit.editdata.designer || '',*/}
                {/*  }, {*/}
                {/*    rules: [*/}
                {/*      {*/}
                {/*        required: true,*/}
                {/*        message: formatMessage({id: 'validation.staff.required'}),*/}
                {/*      },*/}
                {/*    ],*/}
                {/*  })(<Input placeholder={formatMessage({id: 'testplan.staff.placeholder'})}/>)}*/}
                {/*</FormItem>*/}
                {/*/!*测试时间*!/*/}
                {/*<FormItem {...formItemLayout} label={<FormattedMessage id="testplan.staff.label"/>}>*/}
                {/*  {getFieldDecorator('staff', {*/}
                {/*    initialValue: this.props.dataEdit.editdata.testTime || '',*/}
                {/*  }, {*/}
                {/*    rules: [*/}
                {/*      {*/}
                {/*        required: true,*/}
                {/*        message: formatMessage({id: 'validation.staff.required'}),*/}
                {/*      },*/}
                {/*    ],*/}
                {/*  })(<Input placeholder={formatMessage({id: 'testplan.staff.placeholder'})}/>)}*/}
                {/*</FormItem>*/}
                {/*/!*前提条件*!/*/}
                {/*<FormItem {...formItemLayout} label={<FormattedMessage id="testplan.staff.label"/>}>*/}
                {/*  {getFieldDecorator('staff', {*/}
                {/*    initialValue: this.props.dataEdit.editdata.preCondition || '',*/}
                {/*  }, {*/}
                {/*    rules: [*/}
                {/*      {*/}
                {/*        required: true,*/}
                {/*        message: formatMessage({id: 'validation.staff.required'}),*/}
                {/*      },*/}
                {/*    ],*/}
                {/*  })(<Input placeholder={formatMessage({id: 'testplan.staff.placeholder'})}/>)}*/}
                {/*</FormItem>*/}
                {/*/!*测试用例执行过程*!/*/}
                {/*<FormItem {...formItemLayout} label={<FormattedMessage id="testplan.staff.label"/>}>*/}
                {/*  {getFieldDecorator('staff', {*/}
                {/*    initialValue: this.props.dataEdit.editdata.exeProcess || '',*/}
                {/*  }, {*/}
                {/*    rules: [*/}
                {/*      {*/}
                {/*        required: true,*/}
                {/*        message: formatMessage({id: 'validation.staff.required'}),*/}
                {/*      },*/}
                {/*    ],*/}
                {/*  })(<Input placeholder={formatMessage({id: 'testplan.staff.placeholder'})}/>)}*/}
                {/*</FormItem>*/}
                {/*/!*实际结果*!/*/}
                {/*<FormItem {...formItemLayout} label={<FormattedMessage id="testplan.staff.label"/>}>*/}
                {/*  {getFieldDecorator('staff', {*/}
                {/*    initialValue: this.props.dataEdit.editdata.realResult || '',*/}
                {/*  }, {*/}
                {/*    rules: [*/}
                {/*      {*/}
                {/*        required: true,*/}
                {/*        message: formatMessage({id: 'validation.staff.required'}),*/}
                {/*      },*/}
                {/*    ],*/}
                {/*  })(<Input placeholder={formatMessage({id: 'testplan.staff.placeholder'})}/>)}*/}
                {/*</FormItem>*/}
                {/*/!*是否与预期结果一致*!/*/}
                {/*<FormItem {...formItemLayout} label={<FormattedMessage id="testplan.staff.label"/>}>*/}
                {/*  {getFieldDecorator('staff', {*/}
                {/*    initialValue: this.props.dataEdit.editdata.isConsistent || '',*/}
                {/*  }, {*/}
                {/*    rules: [*/}
                {/*      {*/}
                {/*        required: true,*/}
                {/*        message: formatMessage({id: 'validation.staff.required'}),*/}
                {/*      },*/}
                {/*    ],*/}
                {/*  })(<Input placeholder={formatMessage({id: 'testplan.staff.placeholder'})}/>)}*/}
                {/*</FormItem>*/}
                {/*/!*相关bug编号*!/*/}
                {/*<FormItem {...formItemLayout} label={<FormattedMessage id="testplan.staff.label"/>}>*/}
                {/*  {getFieldDecorator('staff', {*/}
                {/*    initialValue: this.props.dataEdit.editdata.bugId || '',*/}
                {/*  }, {*/}
                {/*    rules: [*/}
                {/*      {*/}
                {/*        required: true,*/}
                {/*        message: formatMessage({id: 'validation.staff.required'}),*/}
                {/*      },*/}
                {/*    ],*/}
                {/*  })(<Input placeholder={formatMessage({id: 'testplan.staff.placeholder'})}/>)}*/}
                {/*</FormItem>*/}
                {/*/!*用例执行者*!/*/}
                {/*<FormItem {...formItemLayout} label={<FormattedMessage id="testplan.staff.label"/>}>*/}
                {/*  {getFieldDecorator('staff', {*/}
                {/*    initialValue: this.props.dataEdit.editdata.executor || '',*/}
                {/*  }, {*/}
                {/*    rules: [*/}
                {/*      {*/}
                {/*        required: true,*/}
                {/*        message: formatMessage({id: 'validation.staff.required'}),*/}
                {/*      },*/}
                {/*    ],*/}
                {/*  })(<Input placeholder={formatMessage({id: 'testplan.staff.placeholder'})}/>)}*/}
                {/*</FormItem>*/}
                {/*/!*确认人员*!/*/}
                {/*<FormItem {...formItemLayout} label={<FormattedMessage id="testplan.staff.label"/>}>*/}
                {/*  {getFieldDecorator('staff', {*/}
                {/*    initialValue: this.props.dataEdit.editdata.approver || '',*/}
                {/*  }, {*/}
                {/*    rules: [*/}
                {/*      {*/}
                {/*        required: true,*/}
                {/*        message: formatMessage({id: 'validation.staff.required'}),*/}
                {/*      },*/}
                {/*    ],*/}
                {/*  })(<Input placeholder={formatMessage({id: 'testplan.staff.placeholder'})}/>)}*/}
                {/*</FormItem>*/}
              </div>
              <div>
                <Affix offsetBottom={0}>
                  <div className={style.submitBtns}>
                    <Button onClick={() => {
                      this.showSubmit(this.props.form)
                    }} style={{marginLeft: 8}}
                            type="primary"
                      // disabled={this.props.dataEdit.editdata.processState != "Submit"}
                    >
                      <FormattedMessage id="record-edit.form.submit"/>
                    </Button>

                    <Button onClick={() => {
                      this.save(this.props.form)
                    }} style={{marginLeft: 8}}
                      // disabled={this.props.dataEdit.editdata.processState != "Submit"}
                    >
                      <FormattedMessage id="record-edit.form.save"/>
                    </Button>
                    <Button onClick={() => {
                      this.showDelete(this.props.form)
                    }} style={{marginLeft: 8}}
                            type="danger">
                      <FormattedMessage id="record-edit.form.delete"/>
                    </Button>
                  </div>
                </Affix>
              </div>
            </div>
          </Form>
        </div>

      </div>
    );
  }
}
