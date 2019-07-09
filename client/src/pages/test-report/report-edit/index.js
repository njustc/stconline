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
  Upload,
  message,
  Row,
  Col,
  Table,
  Affix,


  BackTop,
  Divider
} from 'antd';

// const { Carousel } = antd;

import style from "../../entrust/basic-form/style.less";
import PageHeaderWrapper from './components/PageHeaderWrapper';
import styles from './style.less';
import moment from 'moment';
const FormItem = Form.Item;
const { Option } = Select;
const { RangePicker } = DatePicker;
const { TextArea } = Input;
const confirm=Modal.confirm;
const namespace = 'reportEdit';
//此处为假数据，未来在得到用户之前的数据后，mapState2Props里return form
//在对应的formitem里添加initialValue，此时表单里现实的数据就是从后端的得到的。
const form={
    pid:'1',			
    entrustEntity	:'',
    testType:'软件确认测试'	,	
    softwareName:'little mushroom',	
    version:'1.0.2',
    
}
//#endregion


const Dragger = Upload.Dragger;

const props = {
  name: 'file',
  multiple: true,
  action: 'https://www.mocky.io/v2/5cc8019d300000980a055e76',
  onChange(info) {
    const status = info.file.status;
    if (status !== 'uploading') {
      console.log(info.file, info.fileList);
    }
    if (status === 'done') {
      message.success(`${info.file.name} file uploaded successfully.`);
    } else if (status === 'error') {
      message.error(`${info.file.name} file upload failed.`);
    }
  },
};
const softwaresampleuploadprops = {
  action: '',
  onChange({ file, fileList }) {
    if (file.status !== 'uploading') {
      console.log(file, fileList);
    }
  },
  defaultFileList: [
    {
      uid: '1',
      name: 'xxx.png',
      status: 'done',
      response: 'Server Error 500', // custom error message to show
      url: 'http://www.baidu.com/xxx.png',
    },
    {
      uid: '2',
      name: 'yyy.png',
      status: 'done',
      url: 'http://www.baidu.com/yyy.png',
    },
    {
      uid: '3',
      name: 'zzz.png',
      status: 'error',
      response: 'Server Error 500', // custom error message to show
      url: 'http://www.baidu.com/zzz.png',
    },
  ],
};

const softwaredocumentsuploadprops = {
  action: '',
  onChange({ file, fileList }) {
    if (file.status !== 'uploading') {
      console.log(file, fileList);
    }
  },
  defaultFileList: [],
};

 const columnsforHardwareEnviroment = [
  {
    title: '硬件类别',
    dataIndex: 'type',
  },
  {
    title: '硬件名称',
    dataIndex: 'name',
  },
  {
    title: '配置',
    dataIndex: 'configuration',
  },
  {
    title: '数量',
    dataIndex: 'num',
  },
];
const dataforHardwareEnviroment = [
  {
    type:"",
    name:'',
    configuration:'',
    num:''
  }
];
const columnsforsoftwareEnviroment = [
  {
    title: '软件类别',
    dataIndex: 'type',
  },
  {
    title: '软件名称',
    dataIndex: 'name',
  },
  {
    title: '版本',
    dataIndex: 'version',
  },
];
const dataforsoftwareEnviroment = [
  {
    type:"",
    name:'',
    version:'',

  }
];
const columnsForPerformanceTest = [
  {
    title: '功能模块',
    dataIndex: 'functionmodule',
  },
  {
    title: '功能要求',
    dataIndex: 'functionrequest',
  },
  {
    title: '测试结果',
    dataIndex: 'testresult',
  },
];
const dataForPerformanceTest = [
  {
    functionmodule:"",
    functionrequest:'',
    testresult:'',
  }
];

const columnsForEfficiencyTest = [
  {
    title: '测试特性',
    dataIndex: 'testpeculiarity',
  },
  {
    title: '测试说明',
    dataIndex: 'explaination',
  },
  {
    title: '测试结果',
    dataIndex: 'testresult',
  },
];
const dataForEfficiencyTest = [
  {
    testpeculiarity:"",
    explaination:'',
    testresult:'',
  }
];
//删除按钮的对话框方法，点击“确认删除”调取delete方法
// function showDeleteConfirm() {
//   confirm({
//     title: '您是否要删除本委托?',
//     content: '委托一旦删除不可恢复',
//     okText: '确认删除',
//     okType: 'danger',
//     cancelText: '取消',
//     onOk() {
//       console.log('OK');
//       //在此方法里使用delete
//     },
//     onCancel() {
//       console.log('Cancel');
//     },
//   });
// }

// //提交按钮的对话框方法，点击“提交”调取提交方法
// function showConfirm() {
//   confirm({
//     title: '您是否要提交本委托?',
//     content: '委托一旦提交，将无法从线上更改，但您可以在“委托列表”查看本委托详情。提交的委托将由工作人员进行核对。',
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



const mapStateToProps=(state)=>{
  const dataReport=state[namespace];
  //console.log(dataReport)
  return{
    dataReport,
  };
}
// const mapDispatchToProps=(dispatch)=>{
//   return {
//     DeleteEntrust:(params)=>{
//       dispatch({
//         type:`${namespace}/DeleteTestReport`,
//         payload:params
//       })
//     }
//   }
// }


// @connect(({ loading }) => ({
//   submitting: loading.effects[`${namespace}/SubmitTestReport`],
// }))
@Form.create()
@connect(mapStateToProps)
class newTestReport extends PureComponent {
  constructor(props){
    super(props)

    this.state={
      pid:""
    }
  }

  componentDidMount() {
    const {dispatch} = this.props;
    console.log(this.props.location.query)
    dispatch({
      type: `${namespace}/getTestReport`,
      payload: this.props.location.query,
    });
  }

 

//123456
  showSubmit(form) {
    var that = this;
    confirm({
      title: '您是否要提交测试报告?',
      content: '测试报告提交后进入审核状态，不可编辑',
      okText: '确认提交',
      okType: 'primary',
      cancelText: '取消',
      onOk() {
        console.log("submitPlan");
        that.submitReport(form);
      },
      onCancel() {
        console.log('Cancel');
      },
    });
  }

  submitReport=(form)=> {
    const { dispatch } = this.props;
    //console.log("123")
    this.state.pid=this.props.dataReport.reportdata.pid;
    form.validateFields((err,value) => {
      //console.log(this.props.dataEdit.editdata);
      //新建
      value.pid=this.state.pid;
      value.processInstanceId=this.props.dataReport.reportdata.processInstanceId||"";
      value.processState=this.props.dataReport.reportdata.processState||"";
      // value.comment=this.props.dataEdit.editdata.comment;
      //console.log("submitPlan",value);
      console.log("777")
      dispatch({
        type: `${namespace}/querySubmitReport`,
        payload: value,
      });
    })
  };

//123456
  showSubmit(form) {
    var that = this;
    confirm({
      title: '您是否要提交测试报告?',
      content: '测试报告提交后进入审核状态，不可编辑',
      okText: '确认提交',
      okType: 'primary',
      cancelText: '取消',
      onOk() {
        console.log("submitPlan");
        that.submitReport(form);
      },
      onCancel() {
        console.log('Cancel');
      },
    });
  }

  submitReport=(form)=> {
    const { dispatch } = this.props;
    //console.log("123")
    this.state.pid=this.props.dataReport.reportdata.pid;
    form.validateFields((err,value) => {
      //console.log(this.props.dataEdit.editdata);
      //新建
      value.pid=this.state.pid;
      value.processInstanceId=this.props.dataReport.reportdata.processInstanceId||"";
      value.processState=this.props.dataReport.reportdata.processState||"";
      // value.comment=this.props.dataEdit.editdata.comment;
      //console.log("submitPlan",value);
    
      dispatch({
        type: `${namespace}/querySubmitReport`,
        payload: value,
      });
    })
  };




  // addReport=(form)=>{
  //   const { dispatch } = this.props;
  //   this.state.pid=this.props.dataReport.reportdata.pid;
  //   form.validateFields((err,value) => {
  //     //新建
  //     value.pid=this.state.pid;
  //     // 补充新建属性
  //     value.processInstanceId="";
  //     value.processState="ToSubmit";
  //     value.comment="";
  //     //补充完毕
  //     dispatch({
  //       type: `${namespace}/queryAddPlan`,
  //       payload: value,
  //     });
  //   })
  // };




  saveForm=(form)=>{
  
    
    const { dispatch } = this.props;  
    this.state.pid = this.props.dataReport.reportdata.pid;
    form.validateFields((err,value) => {
      value.pid=this.state.pid
      value.processInstanceID = this.props.dataReport.reportdata.processInstanceId;
      value.processState = this.props.dataReport.reportdata.processState;
      
      dispatch({
        type: `${namespace}/queryReplaceReport`,
        payload: value,
      });
      //console.log("finish save")
    })
  };

  save=(form)=>{
    const { dispatch } = this.props;
   
    this.state.pid=this.props.dataReport.reportdata.pid;
    if (this.state.pid=="") {
      //this.addReport(form)
    }
    else {
     
      this.saveForm(form)
    }
  };




  //删除
  delete=(value)=>{
    const { dispatch } = this.props;
    console.log("?");
    dispatch({
      type: `${namespace}/queryDeleteReport`,
      payload: value,
    })
    //console.log("???")
  };

  showDelete(form) {
    var that=this;
    confirm({
      title: '您是否要删除本测试报告?',
      content: '删除后无法恢复',
      okText: '确认删除',
      okType: 'danger',
      cancelText: '取消',
      onOk() {
        that.state.pid=that.props.dataReport.reportdata.pid;
        form.validateFields((err,value) => {
          //新建
         // console.log("???")
          value.pid=that.state.pid;
          that.delete(value)

        })
      },
      onCancel() {
        console.log('Cancel');
      },
    });
  };

  render() {
    const {submitting} = this.props;
    const {
      form: {getFieldDecorator, getFieldValue},
    } = this.props;

    const formItemLayout = {
      labelCol: {
        xs: {span: 24},
        sm: {span: 8},
      },
      wrapperCol: {//输入框
        xs: {span: 24},//大屏
        sm: {span: 20},//小屏
        md: {span: 12},//中屏
      },
    };
    
    const submitFormLayout = {
      wrapperCol: {
        xs: {span: 24, offset: 0},
        sm: {span: 10, offset: 0},
      },
    };

    const formItemLayout1 = {
      labelCol: {
        xs: {span: 24},
        sm: {span: 8},
        md: {span: 16},//中屏
      },
      wrapperCol: {//输入框
        xs: {span: 24},//大屏
        sm: {span: 20},//小屏
        md: {span: 7},//中屏
      },
    };
    const formItemLayout2 = {
      labelCol: {
        xs: {span: 1},
        sm: {span: 8},
        md: {span: 4},//中屏
      },
      wrapperCol: {//输入框
        xs: {span: 24},//大屏
        sm: {span: 20},//小屏
        md: {span: 7},//中屏
      },
    };

    return (
      <div className={style.editBody}>
      <Breadcrumb>
      <Breadcrumb.Item href="/welcome.html">主页</Breadcrumb.Item>
          <Breadcrumb.Item href="/report-list.html">测试报告列表</Breadcrumb.Item>
          <Breadcrumb.Item>测试报告编辑</Breadcrumb.Item>
      </Breadcrumb>
      <Divider/>
        {/* <PageHeaderWrapper
          title={<FormattedMessage id="new-test-report.basic.title2"/>}
          content={<FormattedMessage id="new-test-report.basic.description"/>}
        >
          </PageHeaderWrapper> */}
        <div className={style.formBody}>
          <Form className={style.antForm}>
          {/* <Form onSubmit={this.handleSubmit}> */}
            <Card bordered={false}>
            <Row>
              <Col span={12} style={{display:"block"}}>
              <FormItem {...formItemLayout} label={<FormattedMessage id="new-test-report.codeId"/>}>
                  {getFieldDecorator('codeId', {
                    initialValue: this.props.dataReport.reportdata.codeId || '',
                  }, {
                    rules: [
                      {
                        required: true,
                        message: formatMessage({id: 'new-test-report.basic.input'}),
                      },
                    ],
                  })(<Input placeholder={formatMessage({id: 'new-test-report.basic.input'})}/>)}
                </FormItem>
              <FormItem {...formItemLayout} label={<FormattedMessage id="new-test-report.sampleName"/>}>
                  {getFieldDecorator('sampleName', {
                    initialValue: this.props.dataReport.reportdata.sampleName || '',
                  }, {
                    rules: [
                      {
                        required: true,
                        message: formatMessage({id: 'new-test-report.basic.input'}),
                      },
                    ],
                  })(<Input placeholder={formatMessage({id: 'new-test-report.basic.input'})}/>)}
                </FormItem>
              <FormItem {...formItemLayout} label={<FormattedMessage id="new-test-report.sampleDate"/>}>
                  {getFieldDecorator('sampleDate', {
                    initialValue: this.props.dataReport.reportdata.sampleDate|| '',
                  }, {
                    rules: [
                      {
                        required: true,
                        message: formatMessage({id: 'new-test-report.basic.input'}),
                      },
                    ],
                  })(<Input placeholder={formatMessage({id: 'new-test-report.basic.input'})}/>)}
                </FormItem>
              <FormItem {...formItemLayout} label={<FormattedMessage id="new-test-report.testDate"/>}>
                  {getFieldDecorator('testDate', {
                    initialValue: this.props.dataReport.reportdata.testDate|| '',
                  }, {
                    rules: [
                      {
                        required: true,
                        message: formatMessage({id: 'new-test-report.basic.input'}),
                      },
                    ],
                  })(<Input placeholder={formatMessage({id: 'new-test-report.basic.input'})}/>)}
                </FormItem>
              </Col>
              <Col span={12} style={{display:"block"}}>
              <FormItem {...formItemLayout} label={<FormattedMessage id="new-test-report.clientCompany"/>}>
                  {getFieldDecorator('clientCompany', {
                    initialValue: this.props.dataReport.reportdata.clientCompany || '',
                  }, {
                    rules: [
                      {
                        required: true,
                        message: formatMessage({id: 'new-test-report.basic.input'}),
                      },
                    ],
                  })(<Input placeholder={formatMessage({id: 'new-test-report.basic.input'})}/>)}
                </FormItem>
              <FormItem {...formItemLayout} label={<FormattedMessage id="new-test-report.version"/>}>
                  {getFieldDecorator('version', {
                    initialValue: this.props.dataReport.reportdata.version || '',
                  }, {
                    rules: [
                      {
                        required: true,
                        message: formatMessage({id: 'new-test-report.basic.input'}),
                      },
                    ],
                  })(<Input placeholder={formatMessage({id: 'new-test-report.basic.input'})}/>)}
                </FormItem>
              <FormItem {...formItemLayout} label={<FormattedMessage id="new-test-report.testType"/>}>
                  {getFieldDecorator('testType', {
                    initialValue: this.props.dataReport.reportdata.testType || '',
                  }, {
                    rules: [
                      {
                        required: true,
                        message: formatMessage({id: 'new-test-report.basic.input'}),
                      },
                    ],
                  })(<Input placeholder={formatMessage({id: 'new-test-report.basic.input'})}/>)}
                </FormItem>
              <FormItem {...formItemLayout} label={<FormattedMessage id="new-test-report.softwareName"/>}>
                  {getFieldDecorator('softwareName', {
                    initialValue: this.props.dataReport.reportdata.softwareName || '',
                  }, {
                    rules: [
                      {
                        required: true,
                        message: formatMessage({id: 'new-test-report.basic.input'}),
                      },
                    ],
                  })(<Input placeholder={formatMessage({id: 'new-test-report.basic.input'})}/>)}
                </FormItem>
              </Col>
            </Row>
            <Row>
              <Col span={12} style={{display:"block"}}>
              <FormItem {...formItemLayout} label={<FormattedMessage id="new-test-report.sampleList"/>}>
                <Row>
                  {/* <Col span={8} style={{display:"block"}}>
                    <Upload {...softwaresampleuploadprops}>
                      <Button>
                        <FormattedMessage id="new-test-report.softwareSample"/>
                      </Button>
                    </Upload>
                  </Col> */}
                  <Col span={8} style={{display:"block"}}>
                      <Upload {...softwaredocumentsuploadprops}>
                        <Button>
                          <FormattedMessage id="new-test-report.softwareDocuments"/>
                        </Button>
                      </Upload>
                  </Col>
                </Row>
              </FormItem>
              <Row>
                <Col span={12} style={{display:"block"}}>
                    <FormItem {...formItemLayout1} label={<FormattedMessage id="new-test-report.tester"/>}>
                      {getFieldDecorator('tester', {
                        initialValue: this.props.dataReport.reportdata.tester || '',
                      }, {
                        rules: [
                          {
                            required: true,
                            message: formatMessage({id: 'new-test-report.basic.input'}),
                          },
                        ],
                      })(<Input placeholder={formatMessage({id: 'new-test-report.basic.input'})}/>)}
                    </FormItem>
                    
                </Col>
                <Col span={12} style={{display:"block"}}>
                    <FormItem {...formItemLayout2} label={<FormattedMessage id="new-test-report.testerDate"/>}>
                      {getFieldDecorator('testerDate', {
                        initialValue: this.props.dataReport.reportdata.testDate || '',
                      }, {
                        rules: [
                          {
                            required: true,
                            message: formatMessage({id: 'new-test-report.basic.input'}),
                          },
                        ],
                      })(<Input placeholder={formatMessage({id: 'new-test-report.basic.input'})}/>)}
                    </FormItem>
                </Col>
              </Row>
              <Row>
                <Col span={12} style={{display:"block"}}>
                    <FormItem {...formItemLayout1} label={<FormattedMessage id="new-test-report.auditor"/>}>
                      {getFieldDecorator('auditor', {
                        initialValue: this.props.dataReport.reportdata.auditor || '',
                      }, {
                        rules: [
                          {
                            required: true,
                            message: formatMessage({id: 'new-test-report.basic.input'}),
                          },
                        ],
                      })(<Input placeholder={formatMessage({id: 'new-test-report.basic.input'})}/>)}
                    </FormItem>
                    
                </Col>
                <Col span={12} style={{display:"block"}}>
                    <FormItem {...formItemLayout2} label={<FormattedMessage id="new-test-report.auditorDate"/>}>
                      {getFieldDecorator('auditorDate', {
                        initialValue: this.props.dataReport.reportdata.auditorDate || '',
                      }, {
                        rules: [
                          {
                            required: true,
                            message: formatMessage({id: 'new-test-report.basic.input'}),
                          },
                        ],
                      })(<Input placeholder={formatMessage({id: 'new-test-report.basic.input'})}/>)}
                    </FormItem>
                </Col>
              </Row>

              <Row>
                <Col span={12} style={{display:"block"}}>
                    <FormItem {...formItemLayout1} label={<FormattedMessage id="new-test-report.approver"/>}>
                      {getFieldDecorator('approver', {
                        initialValue: this.props.dataReport.reportdata.approver || '',
                      }, {
                        rules: [
                          {
                            required: true,
                            message: formatMessage({id: 'new-test-report.basic.input'}),
                          },
                        ],
                      })(<Input placeholder={formatMessage({id: 'new-test-report.basic.input'})}/>)}
                    </FormItem>
                    
                </Col>
                <Col span={12} style={{display:"block"}}>
                    <FormItem {...formItemLayout2} label={<FormattedMessage id="new-test-report.approverDate"/>}>
                      {getFieldDecorator('approverDate', {
                        initialValue: this.props.dataReport.reportdata.approverDate || '',
                      }, {
                        rules: [
                          {
                            required: true,
                            message: formatMessage({id: 'new-test-report.basic.input'}),
                          },
                        ],
                      })(<Input placeholder={formatMessage({id: 'new-test-report.basic.input'})}/>)}
                    </FormItem>
                </Col>
              </Row>
              </Col>
              <Col span={12} style={{display:"block"}}>
              </Col>
            </Row>
            <Row>
              <Col span={12} style={{display:"block"}}>
              <FormItem {...formItemLayout} label={<FormattedMessage id="new-test-report.unitc-contact"/>}>
              </FormItem>
              <FormItem {...formItemLayout} label={<FormattedMessage id="basic-form.cusInfo.phone.label"/>}>
                  {getFieldDecorator('clientTel', {
                    initialValue: this.props.dataReport.reportdata.clientTel || '',
                  }, {
                    rules: [
                      {
                        required: true,
                        message: formatMessage({id: 'new-test-report.basic.input'}),
                      },
                    ],
                  })(<Input placeholder={formatMessage({id: 'new-test-report.basic.input'})}/>)}
                </FormItem>
                <FormItem {...formItemLayout} label={<FormattedMessage id="basic-form.cusInfo.fax.label"/>}>
                  {getFieldDecorator('clientFax', {
                    initialValue: this.props.dataReport.reportdata.clientFax || '',
                  }, {
                    rules: [
                      {
                        required: true,
                        message: formatMessage({id: 'new-test-report.basic.input'}),
                      },
                    ],
                  })(<Input placeholder={formatMessage({id: 'new-test-report.basic.input'})}/>)}
                </FormItem>
                <FormItem {...formItemLayout} label={<FormattedMessage id="basic-form.cusInfo.address.label"/>}>
                  {getFieldDecorator('clientAddr', {
                    initialValue: this.props.dataReport.reportdata.clientAddr || '',
                  }, {
                    rules: [
                      {
                        required: true,
                        message: formatMessage({id: 'new-test-report.basic.input'}),
                      },
                    ],
                  })(<Input placeholder={formatMessage({id: 'new-test-report.basic.input'})}/>)}
                </FormItem>
                <FormItem {...formItemLayout} label={<FormattedMessage id="basic-form.cusInfo.postcode.label"/>}>
                  {getFieldDecorator('clientPostCode', {
                    initialValue: this.props.dataReport.reportdata.clientPostCode|| '',
                  }, {
                    rules: [
                      {
                        required: true,
                        message: formatMessage({id: 'new-test-report.basic.input'}),
                      },
                    ],
                  })(<Input placeholder={formatMessage({id: 'new-test-report.basic.input'})}/>)}
                </FormItem>
                <FormItem {...formItemLayout} label={<FormattedMessage id="basic-form.cusInfo.contactor.label"/>}>
                  {getFieldDecorator('clientContact', {
                    initialValue: this.props.dataReport.reportdata.clientContact || '',
                  }, {
                    rules: [
                      {
                        required: true,
                        message: formatMessage({id: 'new-test-report.basic.input'}),
                      },
                    ],
                  })(<Input placeholder={formatMessage({id: 'new-test-report.basic.input'})}/>)}
                </FormItem>
                <FormItem {...formItemLayout} label={<FormattedMessage id="basic-form.cusInfo.email.label"/>}>
                  {getFieldDecorator('clientEmail', {
                    initialValue: this.props.dataReport.reportdata.clientEmail || '',
                  }, {
                    rules: [
                      {
                        required: true,
                        message: formatMessage({id: 'new-test-report.basic.input'}),
                      },
                    ],
                  })(<Input placeholder={formatMessage({id: 'new-test-report.basic.input'})}/>)}
                </FormItem>
              </Col>
              <Col span={12} style={{display:"block"}}>

              <FormItem {...formItemLayout} label={<FormattedMessage id="new-test-report.unitt-contact"/>}>
              </FormItem>
              <FormItem {...formItemLayout} label={<FormattedMessage id="basic-form.cusInfo.phone.label"/>}>
                  {getFieldDecorator('unitt-phone', {
                     initialValue: '86-25-89683186',
                  }, {
                    rules: [
                      {
                        required: true,
                        message: formatMessage({id: 'new-test-report.basic.input'}),
                      },
                    ],
                  })(<Input placeholder={formatMessage({id: 'new-test-report.basic.input'})}/>)}
                </FormItem>
                <FormItem {...formItemLayout} label={<FormattedMessage id="basic-form.cusInfo.fax.label"/>}>
                  {getFieldDecorator('unitt-fax', {
                    initialValue:  '86-25-89683186',
                  }, {
                    rules: [
                      {
                        required: true,
                        message: formatMessage({id: 'new-test-report.basic.input'}),
                      },
                    ],
                  })(<Input placeholder={formatMessage({id: 'new-test-report.basic.input'})}/>)}
                </FormItem>
                <FormItem {...formItemLayout} label={<FormattedMessage id="basic-form.cusInfo.address.label"/>}>
                  {getFieldDecorator('unitt-address', {
                    initialValue: '江苏省南京市栖霞区仙林大道163号',
                  }, {
                    rules: [
                      {
                        required: true,
                        message: formatMessage({id: 'new-test-report.basic.input'}),
                      },
                    ],
                  })(<Input placeholder={formatMessage({id: 'new-test-report.basic.input'})}/>)}
                </FormItem>
                <FormItem {...formItemLayout} label={<FormattedMessage id="basic-form.cusInfo.postcode.label"/>}>
                  {getFieldDecorator('unitt-postcode', {
                    initialValue:  '210023',
                  }, {
                    rules: [
                      {
                        required: true,
                        message: formatMessage({id: 'new-test-report.basic.input'}),
                      },
                    ],
                  })(<Input placeholder={formatMessage({id: 'new-test-report.basic.input'})}/>)}
                </FormItem>
                <FormItem {...formItemLayout} label={<FormattedMessage id="basic-form.cusInfo.contactor.label"/>}>
                  {getFieldDecorator('unitt-contactor', {
                    initialValue: '',
                  }, {
                    rules: [
                      {
                        required: true,
                        message: formatMessage({id: 'new-test-report.basic.input'}),
                      },
                    ],
                  })(<Input placeholder={formatMessage({id: 'new-test-report.basic.input'})}/>)}
                </FormItem>
                <FormItem {...formItemLayout} label={<FormattedMessage id="basic-form.cusInfo.email.label"/>}>
                  {getFieldDecorator('unitt-email', {
                    initialValue:  '@nju.edu.cn',
                  }, {
                    rules: [
                      {
                        required: true,
                        message: formatMessage({id: 'new-test-report.basic.input'}),
                      },
                    ],
                  })(<Input placeholder={formatMessage({id: 'new-test-report.basic.input'})}/>)}
                </FormItem>
              </Col>
            </Row>
            <h2>一、测试环境</h2>
            <h2>硬件环境</h2>
            <Table columns={columnsforHardwareEnviroment} dataSource={dataforHardwareEnviroment} pagination={ false } size="default " />
            <h2>软件环境</h2>
            <Table columns={columnsforsoftwareEnviroment} dataSource={dataforsoftwareEnviroment} pagination={ false } size="default " />
            <h2>网络环境</h2>
            <p>本次测试使用到的网络环境如下：</p>
            <FormItem {...formItemLayout}>
                  {getFieldDecorator('webEnvi', {
                    initialValue: this.props.dataReport.reportdata.auditor || '',
                  }, {
                    rules: [
                      {
                        required: true,
                        message: formatMessage({id: 'new-test-report.basic.input'}),
                      },
                    ],
                  })(<TextArea placeholder={formatMessage({id: 'new-test-report.basic.input'})} autosize={{ minRows: 3 , maxRows: '' }}/>)}
                </FormItem>
            <h2>二、测试依据和参考资料</h2>
            <h2>测试依据</h2>
            <FormItem {...formItemLayout}>
                  {getFieldDecorator('testBasic', {
                    initialValue: this.props.dataReport.reportdata.auditor || '',
                  }, {
                    rules: [
                      {
                        required: true,
                        message: formatMessage({id: 'new-test-report.basic.input'}),
                      },
                    ],
                  })(<TextArea placeholder={formatMessage({id: 'new-test-report.basic.input'})} autosize={{ minRows: 3 , maxRows: '' }}/>)}
            </FormItem>
            <h2>参考资料</h2>
            
            <FormItem {...formItemLayout}>
                  {getFieldDecorator('testBasic', {
                    initialValue: this.props.dataReport.reportdata.auditor || '',
                  }, {
                    rules: [
                      {
                        required: true,
                        message: formatMessage({id: 'new-test-report.basic.input'}),
                      },
                    ],
                  })(<TextArea placeholder={formatMessage({id: 'new-test-report.basic.input'})} autosize={{ minRows: 3 , maxRows: '' }}/>)}
            </FormItem>
            
            <h2>三、测试内容</h2>
            <h2>功能性测试</h2>
            <Table columns={columnsForPerformanceTest } dataSource={dataForPerformanceTest} pagination={ false } size="default " />
            <h2>效率测试</h2>
            <Table columns={columnsForEfficiencyTest} dataSource={dataForEfficiencyTest} pagination={ false } size="default " />
            <h2>可移植性测试</h2>
            <Table columns={columnsForEfficiencyTest} dataSource={dataForEfficiencyTest} pagination={ false } size="default " />
            <h2>易用性测试</h2>
            <Table columns={columnsForEfficiencyTest} dataSource={dataForEfficiencyTest} pagination={ false } size="default " />
            <h2>可靠性环境</h2>
            <Table columns={columnsForEfficiencyTest} dataSource={dataForEfficiencyTest} pagination={ false } size="default " />
            <h2>可维护性测试</h2>
            <Table columns={columnsForEfficiencyTest} dataSource={dataForEfficiencyTest} pagination={ false } size="default " />
            {/* now */}
            <br/>
           
          </Card>
          <div>
            <Affix offsetBottom={0}>
            <div className={style.submitBtns}>
            <Button type="primary" style={{ marginLeft: 8 }} onClick={()=>{this.showSubmit(this.props.form)}}>提交</Button>
            <Button style={{ marginLeft: 8 }} onClick={()=>this.save(this.props.form)}>保存</Button>
            {/* <Button type="danger" style={{ marginLeft: 8 }} onClick={()=>{this.showDelete(this.props.form)}}>删除</Button> */}
            </div>


            <div>
          <BackTop visibilityHeight={300}/>
          <strong style={{color: 'rgba(64, 64, 64, 0.6)'}}> </strong>
        </div>
            </Affix>
        </div>

          </Form>
        </div>
      </div>
      
    );
  }
}

export default newTestReport;


