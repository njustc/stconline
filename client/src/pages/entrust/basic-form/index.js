import React, {PureComponent} from 'react';
import {connect} from 'dva';
import {formatMessage, FormattedMessage} from 'umi/locale';
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
  Checkbox,
  Row,
  Col,
  Divider,
  BackTop,
  Affix,
  Collapse,
  message,
} from 'antd';
import PageHeaderWrapper from './components/PageHeaderWrapper';
import style from './style.less';

const FormItem = Form.Item;
const {TextArea} = Input;
const confirm = Modal.confirm;
const namespace = 'entrustForm';
const {Panel} = Collapse

const Dragger = Upload.Dragger;


const mapStateToProps = (state) => {
  const entrustdata = state[namespace];
  const fileState = state['file'];
  return {
    entrustdata,
    fileState
  };
};


@Form.create()
@connect(mapStateToProps)
class BasicForm extends PureComponent {
  state = {
    bottom: 10,
  };
  constructor(props) {
    super(props);
    this.state = {
      pid: "",
      curFilename: "",
    };
    this.changeFile = this.changeFile.bind(this);
    this.fileListInit = this.fileListInit.bind(this);
  }

  componentDidMount() {
    const {dispatch} = this.props;
    if (this.props.location.query.pid) {
      this.state.pid = this.props.location.query.pid
    } else {
      this.state.pid = this.props.entrustdata.pid
    }
    if (this.state.pid !== "") {
      dispatch({
        type: 'entrustForm/getOneEntrust',
        payload: this.props.location.query,
      });
      this.fileListInit(this.state.pid);
    }
  }

  componentDidUpdate(prevProps, prevState, snapshot) {
    const {dispatch} = this.props;
    const {pid} = this.state;
  }

  addForm = (form) => {
    const {dispatch} = this.props;
    this.state.pid = this.props.entrustdata.pid
    var value=form.getFieldsValue()
      //新建
      value.pid = this.state.pid;
      // 补充新建属性
      value.processInstanceId = "";

      value.comment = ""
      //补充完毕
      dispatch({
        type: 'entrustForm/addNewEntrust',
        payload: value,
      });
  }

  saveForm = (form) => {
    const {dispatch} = this.props;
    this.state.pid = this.props.entrustdata.pid
    var value=form.getFieldsValue()
      //保存
      value.pid = this.state.pid;
      value.processInstanceId = this.props.entrustdata.data.processInstanceId;
      value.processState = this.props.entrustdata.data.processState;
      value.comment = this.props.entrustdata.data.comment;
      dispatch({
        type: 'entrustForm/replaceEntrust',
        payload: value,
      });
  }

  //保存
  save = (form) => {
    const {dispatch} = this.props;
    this.state.pid = this.props.entrustdata.pid;
    if (this.state.pid === "") {
      this.addForm(form)
    } else {
      this.saveForm(form)
    }
  }

  //提交
  submit = (value) => {
    const {dispatch} = this.props;
    this.state.pid = this.props.entrustdata.pid
      //新建
      value.pid = this.state.pid
      // 补充新建属性
      value.processInstanceId = this.props.entrustdata.data.processInstanceId || ""
      value.comment = this.props.entrustdata.data.comment || ""
      //补充完毕
      dispatch({
        type: 'entrustForm/submitForm',
        payload: value,
      });
  };

  //删除
  delete = (value) => {
    const {dispatch} = this.props;
    dispatch({
      type: 'entrustForm/deleteEntrust',
      payload: value,
    })
  }


  showConfirm(form) {
    var that = this

    confirm({
      title: '您是否要提交委托?',
      content: '委托提交后进入审核状态，不可编辑',
      okText: '确认提交',
      okType: 'primarsubmity',
      cancelText: '取消',
      onOk() {
        //在此方法里使用submit
        form.validateFieldsAndScroll((err,value)=>{
          if(!err){
            that.submit(value)
          }
          else{
            message.error('您还有未填写的内容。');
          }
        })
        
      },
      onCancel() {
      },
    });
  }

  showDelete(form) {
    const that = this;
    confirm({
      title: '您是否要删除本委托?',
      content: '委托删除后无法恢复',
      okText: '确认删除',
      okType: 'danger',
      cancelText: '取消',
      onOk() {
        //在此方法里使用delete
        that.state.pid = that.props.entrustdata.pid
        form.validateFields((err, value) => {
          //新建
          value.pid = that.state.pid
          //补充完毕
          that.delete(value)

        })
      },
      onCancel() {
        console.log('Cancel');
      },
    });
  }

  changeFile(name) {
    this.setState({curFilename: name});
  }

  fileListInit(pid) {
    const {dispatch} = this.props;
    dispatch({
      type: 'file/fetchFileList',
      payload: {
        pid
      }
    });
  }

  deleteFile(pid, filename) {
    const {dispatch} = this.props;
    dispatch({
      type: 'file/deleteFile',
      payload: {
        pid, filename
      }
    });
  }

  render() {
    const {submitting} = this.props;
    console.log("submitting",submitting)
    const {
      form: {getFieldDecorator, getFieldValue},
    } = this.props;
    const state = this.state;
    const files = this.props.fileState.fileList;
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

    const changeFile = (name) => {
      this.changeFile(name);
    };

    const deleteFile = (name) => {
      this.deleteFile(state.pid, name);
    }

    const fileListInit = () => {
      this.fileListInit(state.pid);
    };

    //文件列表
    const fileList = (files || []).map((file, i) => {
      return (
        <Card hoverable={true}
          // style={{height: 50}}
        >
          <div className={style.fileDiv}>
            <div className={style.txt}>
              <span>{file.name}</span>
            </div>
            <Button.Group>
              <Button type="dashed"
                      icon="download" href={file.url}
                      style={{color: 'rgb(64,169,255)'}}
              />
              <Button type="danger"
                      icon="close"
                      onClick={() => {
                        deleteFile(file.name);
                        fileListInit();
                      }}
              />
            </Button.Group>
          </div>
        </Card>
      )
    });

    // 文件上传
    const uploadProps = {
      name: 'file',
      action: '/api/project/files?pid=' + this.state.pid,
      multiple: true,
      headers: {
        authorization: 'authorization-text',
      },
      enctype: "multipart/form-data",
      onChange({file, fileList}) {
        if (file.status !== 'uploading') {
        }
        if (file.status === 'done') {
          message.success(`${file.name} file uploaded successfully`);
          fileListInit();
        } else if (file.status === 'error') {
          message.error(`${file.name} file upload failed.`);
        }
      },
      // onPreview(file) {
      //   if (file.status === 'error') {
      //     changeFile("");
      //   } else {
      //     changeFile(file.name);
      //     // console.log(state.curFilename);
      //   }
      // },
      // onRemove(file) {
      //   changeFile("");
      //   deleteFile(state.pid, file.name);
      // },
      showUploadList: false
    };

    const FileDragger = (state.pid == null || state.pid === "") ? null : (
      <Dragger {...uploadProps}>
        <p className="提交栏">
          <Icon type="inbox"/>
        </p>
        <p className="ant-upload-text">点击或者拖拽文件到这里进行上传</p>
        <p className="ant-upload-hint">
          Support for a single or bulk upload. Strictly prohibit from uploading company data or other
          band files
        </p>
      </Dragger>
    );

    return (
      <div className={style.editBody}>
        <Breadcrumb>
          <Breadcrumb.Item href="/basic-list.html">主页</Breadcrumb.Item>
          <Breadcrumb.Item href="/basic-list.html">委托列表</Breadcrumb.Item>
          <Breadcrumb.Item>编辑委托</Breadcrumb.Item>
          {/*<Link to="/basic-list.html">返回</Link>*/}
        </Breadcrumb>
        <div className={style.headerTitle}>
          <PageHeaderWrapper
            title={<FormattedMessage id="basic-form.basic.title"/>}
            // content={<FormattedMessage id="basic-form.basic.description"/>}
          >
          </PageHeaderWrapper>
        </div>
        <div className={style.formBody}>
          <Form onSubmit={this.handleSubmit}
                className={style.antForm}
          >
            <div>
              <h2>基本信息</h2>
              <Divider/>
              {/* //测试类型 */}
              <FormItem
                {...formItemLayout}
                label={<FormattedMessage id="basic-form.radio.testtype"/>}
              >
                <div>
                  {getFieldDecorator('testType', {
                    initialValue: this.props.entrustdata.data.testType || ['basic-form.radio.confirm'],
                    rules:[{
                      required:true,
                      message:"请选择测试类型"
                    }],
                  })(
                    <Checkbox.Group style={{width: '100%'}}>
                      <Row>
                        <Col span={8}>
                          <Checkbox value="basic-form.radio.confirm">
                            <FormattedMessage id="basic-form.radio.confirm"/>
                          </Checkbox>
                        </Col>
                        <Col span={8}>
                          <Checkbox value="basic-form.radio.test">
                            <FormattedMessage id="basic-form.radio.test"/>
                          </Checkbox>
                        </Col>
                        <Col span={8}>
                          <Checkbox value="basic-form.radio.tothers">
                            <FormattedMessage id="basic-form.radio.tothers"/>
                          </Checkbox>
                        </Col>
                      </Row>
                    </Checkbox.Group>
                  )}
                </div>
              </FormItem>
              {/* //	软件名称 */}
              <FormItem {...formItemLayout} label={<FormattedMessage id="basic-form.softname.label"/>}>
                {getFieldDecorator('softwareName',{
                  initialValue: this.props.entrustdata.data.softwareName||'',
                  rules: [
                    { 
                      required: true,
                      message: formatMessage({id: 'basic-form.softname.required'}),
                    },
                  ],
                })(<Input placeholder={formatMessage({id: 'basic-form.softname.placeholder'})}/>)}
              </FormItem>
              {/* 版本号 */}
              <FormItem {...formItemLayout} label={<FormattedMessage id="basic-form.version.label"/>}>
                {getFieldDecorator('version', {
                  initialValue: this.props.entrustdata.data.version || '',
                  rules: [
                    {
                      required: true,
                      message: formatMessage({id: 'basic-form.version.required'}),
                    },
                  ],
                })(<Input placeholder={formatMessage({id: 'basic-form.version.placeholder'})}/>)}
              </FormItem>
              {/* //公司名（中文 */}
              <FormItem {...formItemLayout} label={<FormattedMessage id="basic-form.unitc.label"/>}>
                {getFieldDecorator('companyCh', {
                  initialValue: this.props.entrustdata.data.companyCh || '',
                  rules: [
                    {
                      required: true,
                      message: formatMessage({id: 'basic-form.unitc.required'}),
                    },
                  ],
                })(<Input placeholder={formatMessage({id: 'basic-form.unitc.placeholder'})}/>)}
              </FormItem>
              {/* //公司名（英文 */}
              <FormItem {...formItemLayout} label={<FormattedMessage id="basic-form.unite.label"/>}>
                {getFieldDecorator('companyEn', {
                  initialValue: this.props.entrustdata.data.companyEn || '',
                  rules: [
                    {
                      required: true,
                      message: formatMessage({id: 'basic-form.unite.required'}),
                    },
                  ],
                })(<Input placeholder={formatMessage({id: 'basic-form.unite.placeholder'})}/>)}
              </FormItem>
              {/* //开发单位 */}
              <FormItem {...formItemLayout} label={<FormattedMessage id="basic-form.unitd.label"/>}>
                {getFieldDecorator('developer', {
                  initialValue: this.props.entrustdata.data.developer || '',
                  rules: [
                    {
                      required: true,
                      message: formatMessage({id: 'basic-form.unitd.required'}),
                    }],
                })(<Input placeholder={formatMessage({id: 'basic-form.unitd.placeholder'})}/>)}
              </FormItem>
              {/* 单位性质 */}
              <FormItem
                {...formItemLayout}
                label={<FormattedMessage id="basic-form.radio.unit"/>}
              >
                <div>
                  {getFieldDecorator('unitProperty', {
                    initialValue:this.props.entrustdata.data.unitProperty|| 'basic-form.radio.domestic',
                    rules:[{
                      required:true,
                      message:'请选择单位性质'
                    }],
                  })(
                    <Radio.Group>
                      <Radio value="basic-form.radio.domestic">
                        <FormattedMessage id="basic-form.radio.domestic"/>
                      </Radio>
                      <Radio value="basic-form.radio.foreign">
                        <FormattedMessage id="basic-form.radio.foreign"/>
                      </Radio>
                      <Radio value="basic-form.radio.hmt">
                        <FormattedMessage id="basic-form.radio.hmt"/>
                      </Radio>
                      <Radio value="basic-form.radio.research">
                        <FormattedMessage id="basic-form.radio.research"/>
                      </Radio>
                      <Radio value="basic-form.radio.government">
                        <FormattedMessage id="basic-form.radio.government"/>
                      </Radio>
                      <Radio value="basic-form.radio.uothers">
                        <FormattedMessage id="basic-form.radio.uothers"/>
                      </Radio>
                    </Radio.Group>
                  )}
                </div>
              </FormItem>
              {/* 软件用户对象 */}
              <FormItem {...formItemLayout} label={<FormattedMessage id="basic-form.userobject.label"/>}>
                {getFieldDecorator('userDescription', {
                  initialValue: this.props.entrustdata.data.userDescription || '',
                  rules: [
                    {
                      required: true,
                      message: formatMessage({id: 'basic-form.userobject.required'}),
                    },
                  ],
                })(
                  <TextArea
                    style={{minHeight: 32}}
                    placeholder={formatMessage({id: 'basic-form.userobject.placeholder'})}
                    rows={4}
                  />
                )}
              </FormItem>
              {/* 主要功能描述 */}
              <FormItem {...formItemLayout} label={<FormattedMessage id="basic-form.intro.label"/>}>
                {getFieldDecorator('funcDescription', {
                  initialValue: this.props.entrustdata.data.funcDescription || '',
                  rules: [
                    {
                      required: true,
                      message: formatMessage({id: 'basic-form.intro.required'}),
                    },
                  ],
                })(
                  <TextArea
                    style={{minHeight: 32}}
                    placeholder={formatMessage({id: 'basic-form.intro.placeholder'})}
                    rows={9}
                  />
                )}
              </FormItem>
              <FormItem
                {...formItemLayout}
                label={<FormattedMessage id="basic-form.radio.basis"/>}
              >
                <div>
                  {getFieldDecorator('testBasis', {
                    initialValue: this.props.entrustdata.data.testBasis || ['basic-form.radio.basis1'],
                    rules:[
                      {
                        required:true,
                        message:"请选择测试依据"
                      }
                    ],
                  })(
                    <Checkbox.Group style={{width: '100%'}}>
                      <Row>
                        <Col span={8}>
                          <Checkbox value="basic-form.radio.basis1">
                            <FormattedMessage id="basic-form.radio.basis1"/>
                          </Checkbox>
                        </Col>
                        <Col span={8}>
                          <Checkbox value="basic-form.radio.basis2">
                            <FormattedMessage id="basic-form.radio.basis2"/>
                          </Checkbox>
                        </Col>
                        <Col span={8}>
                          <Checkbox value="basic-form.radio.basis3">
                            <FormattedMessage id="basic-form.radio.basis3"/>
                          </Checkbox>
                        </Col>
                        <Col span={8}>
                          <Checkbox value="basic-form.radio.basis4">
                            <FormattedMessage id="basic-form.radio.basis4"/>
                          </Checkbox>
                        </Col>
                        <Col span={8}>
                          <Checkbox value="basic-form.radio.basis5">
                            <FormattedMessage id="basic-form.radio.basis5"/>
                          </Checkbox>
                        </Col>
                      </Row>
                    </Checkbox.Group>,
                  )}
                </div>
              </FormItem>
              <FormItem
                {...formItemLayout}
                label={<FormattedMessage id="basic-form.radio.target"/>}
              >
                <div>
                  {getFieldDecorator('testSpecification', {
                    initialValue: this.props.entrustdata.data.testSpecification || ['basic-form.radio.target1'],
                    rules:[
                      {
                        required:true,
                        message:"请选择需要测试的技术指标"
                      }
                    ],
                  })(
                    <Checkbox.Group style={{width: '100%'}}>
                      <Row>
                        <Col span={8}>
                          <Checkbox value="basic-form.radio.target1">
                            <FormattedMessage id="basic-form.radio.target1"/>
                          </Checkbox>
                        </Col>
                        <Col span={8}>
                          <Checkbox value="basic-form.radio.target2">
                            <FormattedMessage id="basic-form.radio.target2"/>
                          </Checkbox>
                        </Col>
                        <Col span={8}>
                          <Checkbox value="basic-form.radio.target3">
                            <FormattedMessage id="basic-form.radio.target3"/>
                          </Checkbox>
                        </Col>
                        <Col span={8}>
                          <Checkbox value="basic-form.radio.target4">
                            <FormattedMessage id="basic-form.radio.target4"/>
                          </Checkbox>
                        </Col>
                        <Col span={8}>
                          <Checkbox value="basic-form.radio.target5">
                            <FormattedMessage id="basic-form.radio.target5"/>
                          </Checkbox>
                        </Col>
                        <Col span={8}>
                          <Checkbox value="basic-form.radio.target6">
                            <FormattedMessage id="basic-form.radio.target6"/>
                          </Checkbox>
                        </Col>
                        <Col span={8}>
                          <Checkbox value="basic-form.radio.target7">
                            <FormattedMessage id="basic-form.radio.target7"/>
                          </Checkbox>
                        </Col>
                        <Col span={8}>
                          <Checkbox value="basic-form.radio.target8">
                            <FormattedMessage id="basic-form.radio.target8"/>
                          </Checkbox>
                        </Col>
                        <Col span={8}>
                          <Checkbox value="basic-form.radio.target9">
                            <FormattedMessage id="basic-form.radio.target9"/>
                          </Checkbox>
                        </Col>
                        <Col span={8}>
                          <Checkbox value="basic-form.radio.target10">
                            <FormattedMessage id="basic-form.radio.target10"/>
                          </Checkbox>
                        </Col>
                        <Col span={8}>
                          <Checkbox value="basic-form.radio.target11">
                            <FormattedMessage id="basic-form.radio.target11"/>
                          </Checkbox>
                        </Col>
                        <Col span={8}>
                          <Checkbox value="basic-form.radio.target12">
                            <FormattedMessage id="basic-form.radio.target12"/>
                          </Checkbox>
                        </Col>
                        <Col span={8}>
                          <Checkbox value="basic-form.radio.target13">
                            <FormattedMessage id="basic-form.radio.target13"/>
                          </Checkbox>
                        </Col>
                      </Row>
                    </Checkbox.Group>
                  )}
                </div>
              </FormItem>
            </div>
            <div>
              <h2>软件规模</h2>
              <Divider/>
              <FormItem {...formItemLayout} label={<FormattedMessage id="form.softscale_function_number.label"/>}>
                {getFieldDecorator('funcNum', {
                  initialValue: this.props.entrustdata.data.funcNum || '',
                  rules: [
                    {
                      required: true,
                      message: formatMessage({id: 'validation.softscale_function_number.required'}),
                    },
                  ],
                })(<Input placeholder={formatMessage({id: 'form.softscale_function_number.placeholder'})}/>)}
              </FormItem>
              <FormItem {...formItemLayout} label={<FormattedMessage id="form.softscale_function_point.label"/>}>
                {getFieldDecorator('fpNum', {
                  initialValue: this.props.entrustdata.data.fpNum || '',
                  rules: [
                    {
                      required: true,
                      message: formatMessage({id: 'validation.softscale_function_point.required'}),
                    },
                  ],
                })(<Input placeholder={formatMessage({id: 'form.softscale_function_point.placeholder'})}/>)}
              </FormItem>

              <FormItem {...formItemLayout} label={<FormattedMessage id="form.softscale_code_number.label"/>}>
                {getFieldDecorator('codeLine', {
                  initialValue: this.props.entrustdata.data.codeLine || '',
                  rules: [
                    {
                      required: true,
                      message: formatMessage({id: 'validation.softscale_code_number.required'}),
                    },
                  ],
                })(<Input placeholder={formatMessage({id: 'form.softscale_code_number.placeholder'})}/>)}
              </FormItem>
              <h3>软件类型</h3>
              <FormItem
                {...formItemLayout}
                label={<FormattedMessage id="basic-form.radio.system"/>}
              >
                <div>

                  {getFieldDecorator('softwareType', {
                    initialValue: this.props.entrustdata.data.softwareType || 'basic-form.radio.system1',
                  })(
                    <Radio.Group>
                      <Radio value="basic-form.radio.system1">
                        <FormattedMessage id="basic-form.radio.system1"/>
                      </Radio>
                      <Radio value="basic-form.radio.system2">
                        <FormattedMessage id="basic-form.radio.system2"/>
                      </Radio>
                      <Radio value="basic-form.radio.system3">
                        <FormattedMessage id="basic-form.radio.system3"/>
                      </Radio>
                      <Radio value="basic-form.radio.system4">
                        <FormattedMessage id="basic-form.radio.system4"/>
                      </Radio>
                      <Radio value="basic-form.radio.system5">
                        <FormattedMessage id="basic-form.radio.system5"/>
                      </Radio>
                    </Radio.Group>
                  )}
                </div>
              </FormItem>
              <FormItem
                {...formItemLayout}
                label={<FormattedMessage id="basic-form.radio.application"/>}
              >
                <div>
                  {getFieldDecorator('softwareType', {
                    initialValue: this.props.entrustdata.data.internetApplications || '',
                  })(
                    <Radio.Group>
                      <Radio value="basic-form.radio.application1">
                        <FormattedMessage id="basic-form.radio.application1"/>
                      </Radio>
                      <Radio value="basic-form.radio.application2">
                        <FormattedMessage id="basic-form.radio.application2"/>
                      </Radio>
                      <Radio value="basic-form.radio.application3">
                        <FormattedMessage id="basic-form.radio.application3"/>
                      </Radio>
                      <Radio value="basic-form.radio.application4">
                        <FormattedMessage id="basic-form.radio.application4"/>
                      </Radio>
                      <Radio value="basic-form.radio.application5">
                        <FormattedMessage id="basic-form.radio.application5"/>
                      </Radio>
                      <Radio value="basic-form.radio.application6">
                        <FormattedMessage id="basic-form.radio.application6"/>
                      </Radio>
                      <Radio value="basic-form.radio.application7">
                        <FormattedMessage id="basic-form.radio.application7"/>
                      </Radio>
                      <Radio value="basic-form.radio.application8">
                        <FormattedMessage id="basic-form.radio.application8"/>
                      </Radio>
                      <Radio value="basic-form.radio.application9">
                        <FormattedMessage id="basic-form.radio.application9"/>
                      </Radio>
                      <Radio value="basic-form.radio.application10">
                        <FormattedMessage id="basic-form.radio.application10"/>
                      </Radio>
                      <Radio value="basic-form.radio.application11">
                        <FormattedMessage id="basic-form.radio.application11"/>
                      </Radio>
                      <Radio value="basic-form.radio.application12">
                        <FormattedMessage id="basic-form.radio.application12"/>
                      </Radio>
                      <Radio value="basic-form.radio.application13">
                        <FormattedMessage id="basic-form.radio.application13"/>
                      </Radio>
                    </Radio.Group>
                  )}
                </div>
              </FormItem>
              <FormItem
                {...formItemLayout}
                label={<FormattedMessage id="basic-form.radio.othersoft"/>}
              >
                <div>
                  {getFieldDecorator('softwareType', {
                    initialValue: this.props.entrustdata.data.othersoft1 || '',
                  })(
                    <Radio.Group>
                      <Radio value="basic-form.radio.othersoft1">
                        <FormattedMessage id="basic-form.radio.othersoft1"/>
                      </Radio>
                    </Radio.Group>
                  )}
                </div>
              </FormItem>
            </div>
            <div>
              <h2>运行环境</h2>
              <Divider/>
              <h3>客户端</h3>
              <FormItem
                {...formItemLayout}
                label={<FormattedMessage id="basic-form.radio.opsystem"/>}
              >
                <div>
                  {getFieldDecorator('clientSystem', {
                    initialValue: this.props.entrustdata.data.clientSystem || ['basic-form.radio.opsystem1'],
                    rules:[{
                      required:true,
                      message: formatMessage({id: 'basic-form.radio.opsystem.required'}),
                    }],
                  })(
                    <Checkbox.Group style={{width: '100%'}}>
                      <Row>
                        <Col span={8}>
                          <Checkbox value="basic-form.radio.opsystem1">
                            <FormattedMessage id="basic-form.radio.opsystem1"/>
                          </Checkbox>
                        </Col>
                        <Col span={8}>
                          <Checkbox value="basic-form.radio.opsystem2">
                            <FormattedMessage id="basic-form.radio.opsystem2"/>
                          </Checkbox>
                        </Col>
                        <Col span={8}>
                          <Checkbox value="basic-form.radio.opsystem3">
                            <FormattedMessage id="basic-form.radio.opsystem3"/>
                          </Checkbox>
                        </Col>
                      </Row>
                    </Checkbox.Group>
                  )}
                </div>
              </FormItem>
              <FormItem {...formItemLayout} label={<FormattedMessage id="basic-form.usermem.label"/>}>
                {getFieldDecorator('clientInStorage', {
                  initialValue: this.props.entrustdata.data.clientInStorage || '',
                  rules: [
                    {
                      required: true,
                      message: formatMessage({id: 'basic-form.usermem.required'}),
                    },
                  ],
                })(<Input placeholder={formatMessage({id: 'basic-form.usermem.placeholder'})}/>)}
              </FormItem>

              <FormItem {...formItemLayout} label={<FormattedMessage id="basic-form.usermemEx.label"/>}>
                {getFieldDecorator('clientExStorage', {
                  initialValue: this.props.entrustdata.data.clientExStorage || '',
                  rules: [
                    {
                      required: true,
                      message: formatMessage({id: 'basic-form.usermemEx.required'}),
                    },
                  ],
                })(<Input placeholder={formatMessage({id: 'basic-form.usermemEx.placeholder'})}/>)}
              </FormItem>

              <FormItem {...formItemLayout} label={<FormattedMessage id="basic-form.userother.label"/>}>
                {getFieldDecorator('clientOther', {
                  initialValue: this.props.entrustdata.data.clientOther || '',
                  rules: [
                    {
                      required: true,
                      message: formatMessage({id: 'basic-form.userother.required'}),
                    },
                  ],
                })(<Input placeholder={formatMessage({id: 'basic-form.userother.placeholder'})}/>)}
              </FormItem>
            </div>
            <div>
              <h2>服务器端</h2>
              <Divider/>
              <h3>硬件</h3>

              <FormItem {...formItemLayout} label={<FormattedMessage id="basic-form.hardframe.label"/>}>
                <div>
                  {getFieldDecorator('serverHardFrame', {
                      initialValue: this.props.entrustdata.data.serverHardFrame || ["basic-form.checkbox.architecture1"],
                      rules:[{
                        required:true,
                        message: formatMessage({id: 'basic-form.hardframe.required'}),
                      }],
                    }
                  )(
                    <Checkbox.Group style={{width: '100%'}}>
                      <Row>
                        <Col span={8}>
                          <Checkbox value="basic-form.checkbox.architecture1">
                            <FormattedMessage id="basic-form.checkbox.architecture1"/>
                          </Checkbox>
                        </Col>
                        <Col span={8}>
                          <Checkbox value="basic-form.checkbox.architecture2">
                            <FormattedMessage id="basic-form.checkbox.architecture2"/>
                          </Checkbox>
                        </Col>
                        <Col span={8}>
                          <Checkbox value="basic-form.checkbox.architecture3">
                            <FormattedMessage id="basic-form.checkbox.architecture3"/>
                          </Checkbox>
                        </Col>
                      </Row>
                    </Checkbox.Group>,
                  )}
                </div>

              </FormItem>

              <FormItem {...formItemLayout} label={<FormattedMessage id="basic-form.hardInStorage.label"/>}>
                {getFieldDecorator('serverInStorage', {
                  initialValue: this.props.entrustdata.data.serverInStorage || '',
                  rules: [
                    {
                      required: true,
                      message: formatMessage({id: 'basic-form.hardInStorage.required'}),
                    },
                  ],
                })(<Input placeholder={formatMessage({id: 'basic-form.hardInStorage.placeholder'})}/>)}
              </FormItem>

              <FormItem {...formItemLayout} label={<FormattedMessage id="basic-form.harddisk.label"/>}>
                {getFieldDecorator('serverExStorage', {
                  initialValue: this.props.entrustdata.data.serverExStorage || '',
                  rules: [
                    {
                      required: true,
                      message: formatMessage({id: 'basic-form.harddisk.required'}),
                    },
                  ],
                })(<Input placeholder={formatMessage({id: 'basic-form.harddisk.placeholder'})}/>)}
              </FormItem>

              <FormItem {...formItemLayout} label={<FormattedMessage id="basic-form.hardother.label"/>}>
                {getFieldDecorator('serverHardOther', {
                  initialValue: this.props.entrustdata.data.serverHardOther || '',
                  rules: [
                    {
                      required: true,
                      message: formatMessage({id: 'basic-form.hardother.required'}),
                    },
                  ],
                })(<Input placeholder={formatMessage({id: 'basic-form.hardother.placeholder'})}/>)}
              </FormItem>
              <h3>软件</h3>
              <FormItem {...formItemLayout} label={<FormattedMessage id="basic-form.softsystem.label"/>}>
                {getFieldDecorator('serverSystem', {
                  initialValue: this.props.entrustdata.data.serverSystem || '',
                  rules: [
                    {
                      required: true,
                      message: formatMessage({id: 'basic-form.softsystem.required'}),
                    },
                  ],
                })(<Input placeholder={formatMessage({id: 'basic-form.softsystem.placeholder'})}/>)}
              </FormItem>

              <FormItem {...formItemLayout} label={<FormattedMessage id="basic-form.softversion.label"/>}>
                {getFieldDecorator('serverSoftVersion', {
                  initialValue: this.props.entrustdata.data.serverSoftVersion || '',
                  rules: [
                    {
                      required: true,
                      message: formatMessage({id: 'basic-form.softversion.required'}),
                    },
                  ],
                })(<Input placeholder={formatMessage({id: 'basic-form.softversion.placeholder'})}/>)}
              </FormItem>

              <FormItem {...formItemLayout} label={<FormattedMessage id="basic-form.softprolan.label"/>}>
                {getFieldDecorator('serverLanguage', {
                  initialValue: this.props.entrustdata.data.serverLanguage || '',
                  rules: [
                    {
                      required: true,
                      message: formatMessage({id: 'basic-form.softprolan.required'}),
                    },
                  ],
                })(<Input placeholder={formatMessage({id: 'basic-form.softprolan.placeholder'})}/>)}
              </FormItem>

              <FormItem {...formItemLayout} label={<FormattedMessage id="basic-form.softdata.label"/>}>
                {getFieldDecorator('serverDataBase', {
                  initialValue: this.props.entrustdata.data.serverDataBase || '',
                  rules: [
                    {
                      required: true,
                      message: formatMessage({id: 'basic-form.softdata.required'}),
                    },
                  ],
                })(<Input placeholder={formatMessage({id: 'basic-form.softdata.placeholder'})}/>)}
              </FormItem>

              <FormItem {...formItemLayout} label={<FormattedMessage id="basic-form.softmiddle.label"/>}>
                {getFieldDecorator('serverSoftMidW', {
                  initialValue: this.props.entrustdata.data.serverSoftMidW || '',
                  rules: [
                    {
                      required: true,
                      message: formatMessage({id: 'basic-form.softmiddle.required'}),
                    },
                  ],
                })(<Input placeholder={formatMessage({id: 'basic-form.softmiddle.placeholder'})}/>)}
              </FormItem>

              <FormItem {...formItemLayout} label={<FormattedMessage id="basic-form.radio.softarch"/>}>
                <div>
                  {getFieldDecorator('serverSoftFrame', {
                      initialValue: this.props.entrustdata.data.serverSoftFrame || ['basic-form.checkbox.softarch1'],
                      rules:[{
                        required:true,
                        message: formatMessage({id: 'basic-form.radio.softarch.required'}),
                      }],
                    }
                  )(
                    <Checkbox.Group style={{width: '100%'}}>
                      <Row>
                        <Col span={8}>
                          <Checkbox value="basic-form.checkbox.softarch1">
                            <FormattedMessage id="basic-form.checkbox.softarch1"/>
                          </Checkbox>
                        </Col>
                        <Col span={8}>
                          <Checkbox value="basic-form.checkbox.softarch2">
                            <FormattedMessage id="basic-form.checkbox.softarch2"/>
                          </Checkbox>
                        </Col>
                        <Col span={8}>
                          <Checkbox value="basic-form.checkbox.softarch3">
                            <FormattedMessage id="basic-form.checkbox.softarch3"/>
                          </Checkbox>
                        </Col>
                      </Row>
                    </Checkbox.Group>,
                  )}
                </div>
              </FormItem>

              <FormItem {...formItemLayout} label={<FormattedMessage id="其它支撑软件"/>}>
                {getFieldDecorator('serverSupport', {
                  initialValue: this.props.entrustdata.data.serverSupport || '',
                  rules: [
                    {
                      required: true,
                      message: formatMessage({id: 'basic-form.softmiddle.required'}),
                    },
                  ],
                })(<Input placeholder={formatMessage({id: 'basic-form.softmiddle.placeholder'})}/>)}
              </FormItem>
              <h3>网络环境</h3>
              <FormItem {...formItemLayout} label={<FormattedMessage id="basic-form.netenvironment.label"/>}>
                {getFieldDecorator('webEnvironment', {
                  initialValue: this.props.entrustdata.data.webEnvironment || '',
                  rules: [
                    {
                      required: true,
                      message: formatMessage({id: 'basic-form.netenvironment.required'}),
                    },
                  ],
                })(<Input placeholder={formatMessage({id: 'basic-form.netenvironment.placeholder'})}/>)}
              </FormItem>
            </div>

            <div>
              <h2>样品和数量</h2>
              <Divider/>
              <FormItem
                {...formItemLayout}
                label={<FormattedMessage id="form.sampleType.label"/>}
              >
                <div>
                  {getFieldDecorator('sampleType', {
                    initialValue: this.props.entrustdata.data.sampleType || 'basic-form.mediumg.label',
                    rules:[{
                      required:true,
                      message:"请选择样本类型"
                    }],
                  })(
                    <Radio.Group>
                      <Radio value="basic-form.mediumg.label">
                        <FormattedMessage id="basic-form.mediumg.label"/>
                      </Radio>
                      <Radio value="basic-form.mediumu.label">
                        <FormattedMessage id="basic-form.mediumu.label"/>
                      </Radio>
                      <Radio value="basic-form.mediumo.label">
                        <FormattedMessage id="basic-form.mediumo.label"/>
                      </Radio>
                    </Radio.Group>
                  )}
                </div>
              </FormItem>

              <FormItem {...formItemLayout} label={<FormattedMessage id="form.sample_document.label"/>}>
                <Tooltip title={<FormattedMessage id="form.sample_document.label.tooltip"/>}>
                  <Icon type="info-circle-o" style={{marginRight: 4}}/>
                </Tooltip>
                {getFieldDecorator('sampleFile', {
                  initialValue: this.props.entrustdata.data.sampleFile || '',
                  rules: [
                    {
                      required: true,
                      message: formatMessage({id: 'validation.sample_document.required'}),
                    },
                  ],
                })(
                  <TextArea
                    style={{minHeight: 32}}
                    placeholder={formatMessage({id: 'form.sample_document.placeholder'})}
                    rows={10}
                  />
                )}
              </FormItem>

              <FormItem
                {...formItemLayout}
                label={<FormattedMessage id="form.sample.label"/>}
              >
                <div>
                  {getFieldDecorator('sampleChoice', {
                    initialValue: this.props.entrustdata.data.sampleChoice || 'form.sample.radio.destruction',
                    rules:[{
                      required:true,
                      message:"请选择对样品的处理方式"
                    }],
                  })(
                    <Radio.Group>
                      <Radio value="form.sample.radio.destruction">
                        <FormattedMessage id="form.sample.radio.destruction"/>
                      </Radio>
                      <Radio value="form.sample.radio.return">
                        <FormattedMessage id="form.sample.radio.return"/>
                      </Radio>
                    </Radio.Group>
                  )}
                </div>
              </FormItem>

              <FormItem {...formItemLayout} label={<FormattedMessage id="basic-form.date.label"/>}>
                {
                  getFieldDecorator('expectedDeadline', {
                    initialValue: this.props.entrustdata.data.expectedDeadline||'',
                    rules: [
                      {
                        required: true,
                        message: formatMessage({id: 'basic-form.date.required'}),
                      },
                    ],
                  })(<Input placeholder={formatMessage({id: 'basic-form.date.placeholder'})}/>)}
              </FormItem>
              <div>
                <h2>委托单位信息</h2>
                <Divider/>
                <FormItem {...formItemLayout} label={<FormattedMessage id="basic-form.cusInfo.phone.label"/>}>
                  {getFieldDecorator('infoTEL', {
                    initialValue: this.props.entrustdata.data.infoTEL || '',
                    rules: [
                      {
                        required: true,
                        message: formatMessage({id: 'basic-form.cusInfo.phone.required'}),
                      },
                    ],
                  })(<Input/>)}
                </FormItem>
                <FormItem {...formItemLayout} label={<FormattedMessage id="basic-form.cusInfo.fax.label"/>}>
                  {getFieldDecorator('infoFAX', {
                    initialValue: this.props.entrustdata.data.infoFAX || '',
                    rules: [
                      {
                        required: true,
                        message: formatMessage({id: 'basic-form.fax.required'}),
                      },
                    ],
                  })(<Input/>)}
                </FormItem>
                <FormItem {...formItemLayout} label={<FormattedMessage id="basic-form.cusInfo.address.label"/>}>
                  {getFieldDecorator('infoAddr', {
                    initialValue: this.props.entrustdata.data.infoAddr || '',
                    rules: [
                      {
                        required: true,
                        message: formatMessage({id: 'basic-form.cusInfo.address.required'}),
                      },
                    ],
                  })(<Input/>)}
                </FormItem>
                <FormItem {...formItemLayout} label={<FormattedMessage id="basic-form.cusInfo.postcode.label"/>}>
                  {getFieldDecorator('infoPostcode', {
                    initialValue: this.props.entrustdata.data.infoPostcode || '',
                    rules: [
                      {
                        required: true,
                        message: formatMessage({id: 'basic-form.cusInfo.postcode.required'}),
                      },
                    ],
                  })(<Input/>)}
                </FormItem>
                <FormItem {...formItemLayout} label={<FormattedMessage id="basic-form.cusInfo.contactor.label"/>}>
                  {getFieldDecorator('infoName', {
                    initialValue: this.props.entrustdata.data.infoName || '',
                    rules: [
                      {
                        required: true,
                        message: formatMessage({id: 'basic-form.cusInfo.contactor.required'}),
                      },
                    ],
                  })(<Input/>)}
                </FormItem>
                <FormItem {...formItemLayout} label={<FormattedMessage id="basic-form.cusInfo.tel.label"/>}>
                  {getFieldDecorator('infoPhone', {
                    initialValue: this.props.entrustdata.data.infoPhone || '',
                    rules: [
                      {
                        required: true,
                        message: formatMessage({id: 'basic-form.cusInfo.tel.required'}),
                      },
                    ],
                  })(<Input/>)}
                </FormItem>
                <FormItem {...formItemLayout} label={<FormattedMessage id="basic-form.cusInfo.email.label"/>}>
                  {getFieldDecorator('infoEmail', {
                    initialValue: this.props.entrustdata.data.infoEmail || '',
                    rules: [
                      {
                        required: true,
                        message: formatMessage({id: 'basic-form.cusInfo.email.required'}),
                      },
                    ],
                  })(<Input/>)}
                </FormItem>
                <FormItem {...formItemLayout} label={<FormattedMessage id="basic-form.cusInfo.url.label"/>}>
                  {getFieldDecorator('infoURL', {
                    initialValue: this.props.entrustdata.data.infoURL || '',
                    rules: [
                      {
                        required: true,
                        message: formatMessage({id: 'basic-form.cusInfo.url.required'}),
                      },
                    ],
                  })(<Input placeholder={formatMessage({id: 'basic-form.cusInfo.url.placeholder'})}/>)}
                </FormItem>
                <FormItem
                  {...formItemLayout}
                  label={<FormattedMessage id="basic-form.others.SecLev.label"/>}
                >
                  <div>
                    {getFieldDecorator('encryptionLev', {
                      initialValue: this.props.entrustdata.data.encryptionLev || 'basic-form.others.SecLev.public',
                      rules:[{
                        required:true,
                        message:'basic-form.others.SecLev.required'
                      }],
                    })(
                      <Radio.Group>
                        <Radio value="basic-form.others.SecLev.public">
                          <FormattedMessage id="basic-form.others.SecLev.public"/>
                        </Radio>
                        <Radio value="basic-form.others.SecLev.partially-public">
                          <FormattedMessage id="basic-form.others.SecLev.partially-public"/>
                        </Radio>
                        <Radio value="basic-form.others.SecLev.private">
                          <FormattedMessage id="basic-form.others.SecLev.private"/>
                        </Radio>
                      </Radio.Group>
                    )}
                  </div>
                </FormItem>
                <FormItem
                  {...formItemLayout}
                  label={<FormattedMessage id="basic-form.others.viruses.label"/>}
                >
                  <div>
                    {getFieldDecorator('antiVirus', {
                      initialValue: this.props.entrustdata.data.antiVirus ||'basic-form.others.viruses.complete',
                      rules:[{
                        required:true,
                        message:'未选择'
                      }],
                    })(
                      <Radio.Group>
                        <Radio value="basic-form.others.viruses.complete">
                          <FormattedMessage id="basic-form.others.viruses.complete"/>
                        </Radio>
                        <Radio value="basic-form.others.viruses.cannot">
                          <FormattedMessage id="basic-form.others.viruses.cannot"/>
                        </Radio>
                      </Radio.Group>
                    )}
                  </div>
                </FormItem>
                <FormItem
                  {...formItemLayout}
                  label={<FormattedMessage id="basic-form.others.tsample.label"/>}
                >
                  <div>
                    {getFieldDecorator('checkSample', {
                        initialValue: this.props.entrustdata.data.checkSample || ["basic-form.others.tsample.code"],
                        rules:[{
                          required:true,
                          message:'basic-form.others.tsample.required'
                        }],
                      }
                    )(
                      <Checkbox.Group style={{width: '100%'}}>
                        <Row>
                          <Col span={8}>
                            <Checkbox value="basic-form.others.tsample.code">
                              <FormattedMessage id="basic-form.others.tsample.code"/>
                            </Checkbox>
                          </Col>
                          <Col span={8}>
                            <Checkbox value="basic-form.others.tsample.exe">
                              <FormattedMessage id="basic-form.others.tsample.exe"/>
                            </Checkbox>
                          </Col>
                          <Col span={8}>
                            <Checkbox value="basic-form.others.reqword.plan">
                              <FormattedMessage id="basic-form.others.reqword.plan"/>
                            </Checkbox>
                          </Col>
                          <Col span={8}>
                            <Checkbox value="basic-form.others.reqword.report">
                              <FormattedMessage id="basic-form.others.reqword.report"/>
                            </Checkbox>
                          </Col>
                          <Col span={8}>
                            <Checkbox value="basic-form.others.reqword.contract">
                              <FormattedMessage id="basic-form.others.reqword.contract"/>
                            </Checkbox>
                          </Col>
                          <Col span={8}>
                            <Checkbox value="basic-form.others.userword.book">
                              <FormattedMessage id="basic-form.others.userword.book"/>
                            </Checkbox>
                          </Col>
                          <Col span={8}>
                            <Checkbox value="basic-form.others.userword.guide">
                              <FormattedMessage id="basic-form.others.userword.guide"/>
                            </Checkbox>
                          </Col>
                          <Col span={8}>
                            <Checkbox value="basic-form.others.opword.book1">
                              <FormattedMessage id="basic-form.others.opword.book1"/>
                            </Checkbox>
                          </Col>
                          <Col span={8}>
                            <Checkbox value="basic-form.others.opword.book2">
                              <FormattedMessage id="basic-form.others.opword.book2"/>
                            </Checkbox>
                          </Col>
                          <Col span={8}>
                            <Checkbox value="basic-form.others.opword.book3">
                              <FormattedMessage id="basic-form.others.opword.book3"/>
                            </Checkbox>
                          </Col>
                          <Col span={8}>
                            <Checkbox value="basic-form.others.opword.book4">
                              <FormattedMessage id="basic-form.others.opword.book4"/>
                            </Checkbox>
                          </Col>
                          <Col span={8}>
                            <Checkbox value="basic-form.checko.label">
                              <FormattedMessage id="basic-form.checko.label"/>
                            </Checkbox>
                          </Col>
                        </Row>
                      </Checkbox.Group>,
                    )}
                  </div>

                </FormItem>

                <div>
                  {FileDragger}
                </div>
                <a hidden={state.curFilename === ""}
                   href={'http://localhost:8080/api/project/files?pid=' + state.pid + '&filename=' + state.curFilename}>
                  下载文件 {state.curFilename}</a>
                <div className={style.fileList}>
                  {fileList}
                </div>
                <Affix offsetBottom={0}>
                  {/* onChange={affixed => console.log(affixed)} */}
                  <div className={style.submitBtns}>
                    <Button type="primary" onClick={() => {
                      this.showConfirm(this.props.form)
                    }}>
                      <FormattedMessage id="basic-form.form.submit"/>
                    </Button>
                    <Button style={{marginLeft: 8}} onClick={() => {
                      this.save(this.props.form)
                    }}>
                      <FormattedMessage id="basic-form.form.save"/>
                    </Button>
                    <Button onClick={() => {
                      this.showDelete(this.props.form)
                    }} style={{marginLeft: 8}}
                            type="danger">
                      <FormattedMessage id="basic-form.form.delete"/>
                    </Button>
                  </div>
                </Affix>
              </div>
            </div>
          </Form>
        </div>
        <div>
          <BackTop visibilityHeight={300}/>
          <strong style={{color: 'rgba(64, 64, 64, 0.6)'}}> </strong>
        </div>

      </div>
    );
  }
}

export default BasicForm;
