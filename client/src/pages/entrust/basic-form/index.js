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
import PageHeaderWrapper from './components/PageHeaderWrapper';
import styles from './style.less';
import moment from 'moment';
const FormItem = Form.Item;
const { Option } = Select;
const { RangePicker } = DatePicker;
const { TextArea } = Input;
const confirm=Modal.confirm;
const namespace = 'basicForm';
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

//提交按钮的对话框方法，点击“提交”调取提交方法
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
const mapStateToProps=(state)=>{
  const entrustdata=state[namespace];
  return{
    entrustdata,
  };
}
const mapDispatchToProps=(dispatch)=>{
  return {
    DeleteEntrust:(params)=>{
      dispatch({
        type:`${namespace}/DeleteEntrust`,
        payload:params
      })
    }
  }
}
@connect(mapStateToProps,mapDispatchToProps)

@connect(({ loading }) => ({
  submitting: loading.effects['basicForm/submitRegularForm'],
}))
@Form.create()
class BasicForm extends PureComponent {
  componentDidMount() {
    const {dispatch}=this.props;
    dispatch({
      //
      type:'basicForm/initGetData',
      payload:this.props.location.query,
    })
  }

  handleSubmit = e => {
    const { dispatch, form } = this.props;
    e.preventDefault();
    form.validateFieldsAndScroll((err, values) => {
      if (!err) {
        dispatch({
          type: 'basicForm/submitRegularForm',
          payload: values,
        });
      }
    });
  };

  submit = () => {
    this.setState({
      visible: true,
      current: undefined,
    });
    dispatch({
      type: 'basicForm/saveForm',
      payload: values,
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
      <Breadcrumb>
        <Breadcrumb.Item href="/basic-list">委托列表</Breadcrumb.Item>
        <Breadcrumb.Item href="/basic-form">编辑委托</Breadcrumb.Item>
        <h1></h1>
        <PageHeaderWrapper
          title={<FormattedMessage id="basic-form.basic.title"/>}
          content={<FormattedMessage id="basic-form.basic.description"/>}
        >
          <Card bordered={false}>
            <FormItem
              {...formItemLayout}
              label={<FormattedMessage id="basic-form.radio.testtype"/>}
            >
              <div>
                {getFieldDecorator('testType', {
                  initialValue: this.props.entrustdata.data.testType || 'basic-form.radio.confirm',
                })(
                  <Radio.Group>
                    <Radio value="basic-form.radio.confirm">
                      <FormattedMessage id="basic-form.radio.confirm"/>
                    </Radio>
                    <Radio value="basic-form.radio.test">
                      <FormattedMessage id="basic-form.radio.test"/>
                    </Radio>
                    <Radio value="basic-form.radio.tothers">
                      <FormattedMessage id="basic-form.radio.tothers"/>
                    </Radio>
                  </Radio.Group>
                )}
              </div>
            </FormItem>
            <FormItem {...formItemLayout} label={<FormattedMessage id="basic-form.softname.label"/>}>
              {getFieldDecorator('softname', {
                initialValue: this.props.entrustdata.data.softname || '',
              }, {
                rules: [
                  {
                    required: true,
                    message: formatMessage({id: 'basic-form.softname.required'}),
                  },
                ],
              })(<Input placeholder={formatMessage({id: 'basic-form.softname.placeholder'})}/>)}
            </FormItem>
            <FormItem {...formItemLayout} label={<FormattedMessage id="basic-form.version.label"/>}>
              {getFieldDecorator('version', {
                initialValue: this.props.entrustdata.data.version || '',
              }, {
                rules: [
                  {
                    required: true,
                    message: formatMessage({id: 'basic-form.version.required'}),
                  },
                ],
              })(<Input placeholder={formatMessage({id: 'basic-form.version.placeholder'})}/>)}
            </FormItem>
            <FormItem {...formItemLayout} label={<FormattedMessage id="basic-form.unitc.label"/>}>
              {getFieldDecorator('companyCh', {
                initialValue: this.props.entrustdata.data.companyCh || '',
              }, {
                rules: [
                  {
                    required: true,
                    message: formatMessage({id: 'basic-form.unitc.required'}),
                  },
                ],
              })(<Input placeholder={formatMessage({id: 'basic-form.unitc.placeholder'})}/>)}
            </FormItem>
            <FormItem {...formItemLayout} label={<FormattedMessage id="basic-form.unite.label"/>}>
              {getFieldDecorator('companyEn', {
                initialValue: this.props.entrustdata.data.companyEn || '',
              }, {
                rules: [
                  {
                    required: true,
                    message: formatMessage({id: 'basic-form.unite.required'}),
                  },
                ],
              })(<Input placeholder={formatMessage({id: 'basic-form.unite.placeholder'})}/>)}
            </FormItem>

            <FormItem {...formItemLayout} label={<FormattedMessage id="basic-form.unitd.label"/>}>
              {getFieldDecorator('developer', {
                initialValue: this.props.entrustdata.data.developer || '',
              }, {
                rules: [
                  {
                    required: true,
                    message: formatMessage({id: 'basic-form.unitd.required'}),
                  },
                ],
              })(<Input placeholder={formatMessage({id: 'basic-form.unitd.placeholder'})}/>)}
            </FormItem>
            <FormItem
              {...formItemLayout}
              label={<FormattedMessage id="basic-form.radio.unit"/>}
            >
              <div>
                {getFieldDecorator('unitProperty', {
                  initialValue: 'basic-form.radio.domestic',
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
            <FormItem {...formItemLayout} label={<FormattedMessage id="basic-form.userobject.label"/>}>
              {getFieldDecorator('userDescription', {
                initialValue: this.props.entrustdata.data.userDescription || '',
              }, {
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
            <FormItem {...formItemLayout} label={<FormattedMessage id="basic-form.intro.label"/>}>
              {getFieldDecorator('funcDescription', {
                initialValue: this.props.entrustdata.data.funcDescription || '',
              }, {
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
                  initialValue: this.props.entrustdata.data.testBasis || 'basic-form.radio.basis1',
                })(
                  <Radio.Group>
                    <Radio value="basic-form.radio.basis1">
                      <FormattedMessage id="basic-form.radio.basis1"/>
                    </Radio>
                    <Radio value="basic-form.radio.basis2">
                      <FormattedMessage id="basic-form.radio.basis2"/>
                    </Radio>
                    <Radio value="basic-form.radio.basis3">
                      <FormattedMessage id="basic-form.radio.basis3"/>
                    </Radio>
                    <Radio value="basic-form.radio.basis4">
                      <FormattedMessage id="basic-form.radio.basis4"/>
                    </Radio>
                    <Radio value="basic-form.radio.basis5">
                      <FormattedMessage id="basic-form.radio.basis5"/>
                    </Radio>
                  </Radio.Group>
                )}
              </div>
            </FormItem>
            <FormItem
              {...formItemLayout}
              label={<FormattedMessage id="basic-form.radio.target"/>}
            >
              <div>
                {getFieldDecorator('testSpecification', {
                  initialValue: this.props.entrustdata.data.testSpecification || 'basic-form.radio.target1',
                })(
                  <Radio.Group>
                    <Radio value="basic-form.radio.target1">
                      <FormattedMessage id="basic-form.radio.target1"/>
                    </Radio>
                    <Radio value="basic-form.radio.target2">
                      <FormattedMessage id="basic-form.radio.target2"/>
                    </Radio>
                    <Radio value="basic-form.radio.target3">
                      <FormattedMessage id="basic-form.radio.target3"/>
                    </Radio>
                    <Radio value="basic-form.radio.target4">
                      <FormattedMessage id="basic-form.radio.target4"/>
                    </Radio>
                    <Radio value="basic-form.radio.target5">
                      <FormattedMessage id="basic-form.radio.target5"/>
                    </Radio>
                    <Radio value="basic-form.radio.target6">
                      <FormattedMessage id="basic-form.radio.target6"/>
                    </Radio>
                    <Radio value="basic-form.radio.target7">
                      <FormattedMessage id="basic-form.radio.target7"/>
                    </Radio>
                    <Radio value="basic-form.radio.target8">
                      <FormattedMessage id="basic-form.radio.target8"/>
                    </Radio>
                    <Radio value="basic-form.radio.target9">
                      <FormattedMessage id="basic-form.radio.target9"/>
                    </Radio>
                    <Radio value="basic-form.radio.target10">
                      <FormattedMessage id="basic-form.radio.target10"/>
                    </Radio>
                    <Radio value="basic-form.radio.target11">
                      <FormattedMessage id="basic-form.radio.target11"/>
                    </Radio>
                    <Radio value="basic-form.radio.target12">
                      <FormattedMessage id="basic-form.radio.target12"/>
                    </Radio>
                    <Radio value="basic-form.radio.target13">
                      <FormattedMessage id="basic-form.radio.target13"/>
                    </Radio>
                  </Radio.Group>
                )}
              </div>
            </FormItem>

            <h3>软件规模</h3>
            <FormItem {...formItemLayout} label={<FormattedMessage id="form.softscale_function_number.label"/>}>
              {getFieldDecorator('funcNum', {
                initialValue: this.props.entrustdata.data.funcNum || '',
              }, {
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
              }, {
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
              }, {
                rules: [
                  {
                    required: true,
                    message: formatMessage({id: 'validation.softscale_code_number.required'}),
                  },
                ],
              })(<Input placeholder={formatMessage({id: 'form.softscale_code_number.placeholder'})}/>)}
            </FormItem>
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
              label={<FormattedMessage id="basic-form.radio.support"/>}
            >
              <div>
                {getFieldDecorator('supportSoftware', {
                  initialValue: this.props.entrustdata.data.supportSoftware || 'basic-form.radio.support1',
                })(
                  <Radio.Group>
                    <Radio value="basic-form.radio.support1">
                      <FormattedMessage id="basic-form.radio.support1"/>
                    </Radio>
                    <Radio value="basic-form.radio.support2">
                      <FormattedMessage id="basic-form.radio.support2"/>
                    </Radio>
                    <Radio value="basic-form.radio.support3">
                      <FormattedMessage id="basic-form.radio.support3"/>
                    </Radio>
                    <Radio value="basic-form.radio.support4">
                      <FormattedMessage id="basic-form.radio.support4"/>
                    </Radio>
                    <Radio value="basic-form.radio.support5">
                      <FormattedMessage id="basic-form.radio.support5"/>
                    </Radio>
                    <Radio value="basic-form.radio.support6">
                      <FormattedMessage id="basic-form.radio.support6"/>
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
                {getFieldDecorator('internetApplications', {
                  initialValue: this.props.entrustdata.data.internetApplications || 'basic-form.radio.application1',
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
                {getFieldDecorator('othersoft1', {
                  initialValue: this.props.entrustdata.data.othersoft1 || 'basic-form.radio.othersoft1',
                })(
                  <Radio.Group>
                    <Radio value="basic-form.radio.othersoft1">
                      <FormattedMessage id="basic-form.radio.othersoft1"/>
                    </Radio>
                  </Radio.Group>
                )}
              </div>
            </FormItem>

            <h3>运行环境</h3>
            <h4>客户端</h4>
            <FormItem
              {...formItemLayout}
              label={<FormattedMessage id="basic-form.radio.opsystem"/>}
            >
              <div>
                {getFieldDecorator('clientSystem', {
                  initialValue: this.props.entrustdata.data.clientSystem || 'basic-form.radio.opsystem1',
                })(
                  <Radio.Group>
                    <Radio value="basic-form.radio.opsystem1">
                      <FormattedMessage id="basic-form.radio.opsystem1"/>
                    </Radio>
                    <Radio value="basic-form.radio.opsystem2">
                      <FormattedMessage id="basic-form.radio.opsystem2"/>
                    </Radio>
                    <Radio value="basic-form.radio.opsystem3">
                      <FormattedMessage id="basic-form.radio.opsystem3"/>
                    </Radio>
                  </Radio.Group>
                )}
              </div>
            </FormItem>
            <FormItem {...formItemLayout} label={<FormattedMessage id="basic-form.usermem.label"/>}>
              {getFieldDecorator('clientExStorage', {
                initialValue: this.props.entrustdata.data.clientExStorage || '',
              }, {
                rules: [
                  {
                    required: true,
                    message: formatMessage({id: 'basic-form.usermem.required'}),
                  },
                ],
              })(<Input placeholder={formatMessage({id: 'basic-form.usermem.placeholder'})}/>)}
            </FormItem>
            <FormItem {...formItemLayout} label={<FormattedMessage id="basic-form.userother.label"/>}>
              {getFieldDecorator('clientOther', {
                initialValue: this.props.entrustdata.data.clientOther || '',
              }, {
                rules: [
                  {
                    required: true,
                    message: formatMessage({id: 'basic-form.userother.required'}),
                  },
                ],
              })(<Input placeholder={formatMessage({id: 'basic-form.userother.placeholder'})}/>)}
            </FormItem>
            <h4>服务器端</h4>
            <h5>硬件</h5>
            <FormItem {...formItemLayout} label={<FormattedMessage id="basic-form.hardmem.label"/>}>
              {getFieldDecorator('serverSystem', {
                initialValue: this.props.entrustdata.data.serverSystem || '',
              }, {
                rules: [
                  {
                    required: true,
                    message: formatMessage({id: 'basic-form.hardmem.required'}),
                  },
                ],
              })(<Input placeholder={formatMessage({id: 'basic-form.hardmem.placeholder'})}/>)}
            </FormItem>
            <FormItem {...formItemLayout} label={<FormattedMessage id="basic-form.harddisk.label"/>}>
              {getFieldDecorator('serverHardDiskRequire', {
                initialValue: this.props.entrustdata.data.serverHardDiskRequire || '',
              }, {
                rules: [
                  {
                    required: true,
                    message: formatMessage({id: 'basic-form.harddisk.required'}),
                  },
                ],
              })(<Input placeholder={formatMessage({id: 'basic-form.harddisk.placeholder'})}/>)}
            </FormItem>
            <FormItem {...formItemLayout} label={<FormattedMessage id="basic-form.hardother.label"/>}>
              {getFieldDecorator('serverOther', {
                initialValue: this.props.entrustdata.data.serverOther || '',
              }, {
                rules: [
                  {
                    required: true,
                    message: formatMessage({id: 'basic-form.hardother.required'}),
                  },
                ],
              })(<Input placeholder={formatMessage({id: 'basic-form.hardother.placeholder'})}/>)}
            </FormItem>
            <h5>软件</h5>
            <FormItem {...formItemLayout} label={<FormattedMessage id="basic-form.softsystem.label"/>}>
              {getFieldDecorator('serverSystem', {
                initialValue: this.props.entrustdata.data.serverSystem || '',
              }, {
                rules: [
                  {
                    required: true,
                    message: formatMessage({id: 'basic-form.softsystem.required'}),
                  },
                ],
              })(<Input placeholder={formatMessage({id: 'basic-form.softsystem.placeholder'})}/>)}
            </FormItem>
            <FormItem {...formItemLayout} label={<FormattedMessage id="basic-form.softversion.label"/>}>
              {getFieldDecorator('softversion', {
                initialValue: this.props.entrustdata.data.softversion || '',
              }, {
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
              }, {
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
              }, {
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
              }, {
                rules: [
                  {
                    required: true,
                    message: formatMessage({id: 'basic-form.softmiddle.required'}),
                  },
                ],
              })(<Input placeholder={formatMessage({id: 'basic-form.softmiddle.placeholder'})}/>)}
            </FormItem>
            <h4>网络环境</h4>
            <FormItem {...formItemLayout} label={<FormattedMessage id="basic-form.netenvironment.label"/>}>
              {getFieldDecorator('webEnvironment', {
                initialValue: this.props.entrustdata.data.webEnvironment || '',
              }, {
                rules: [
                  {
                    required: true,
                    message: formatMessage({id: 'basic-form.netenvironment.required'}),
                  },
                ],
              })(
                <TextArea
                  style={{minHeight: 32}}
                  placeholder={formatMessage({id: 'basic-form.netenvironment.placeholder'})}
                  rows={9}
                />
              )}
            </FormItem>

            <h3>样品和数量</h3>
            <h4>软件介质</h4>
            <FormItem {...formItemLayout} label={<FormattedMessage id="basic-form.mediumg.label"/>}>
              {getFieldDecorator('CD', {
                initialValue: this.props.entrustdata.data.CD || '',
              }, {
                rules: [
                  {
                    required: true,
                    message: formatMessage({id: 'basic-form.mediumg.required'}),
                  },
                ],
              })(<Input placeholder={formatMessage({id: 'basic-form.mediumg.placeholder'})}/>)}
            </FormItem>
            <FormItem {...formItemLayout} label={<FormattedMessage id="basic-form.mediumu.label"/>}>
              {getFieldDecorator('usbFlashDrive', {
                initialValue: this.props.entrustdata.data.usbFlashDrive || '',
              }, {
                rules: [
                  {
                    required: true,
                    message: formatMessage({id: 'basic-form.mediumu.required'}),
                  },
                ],
              })(<Input placeholder={formatMessage({id: 'basic-form.mediumu.placeholder'})}/>)}
            </FormItem>
            <FormItem {...formItemLayout} label={<FormattedMessage id="basic-form.mediumo.label"/>}>
              {getFieldDecorator('softwareMediumOther', {
                initialValue: this.props.entrustdata.data.softwareMediumOther || '',
              }, {
                rules: [
                  {
                    required: true,
                    message: formatMessage({id: 'basic-form.mediumo.required'}),
                  },
                ],
              })(<Input placeholder={formatMessage({id: 'basic-form.softmiddle.placeholder'})}/>)}
            </FormItem>

            <h4>文档资料</h4>
            <FormItem {...formItemLayout} label={<FormattedMessage id="form.sample_document.label"/>}>
              <Tooltip title={<FormattedMessage id="form.sample_document.label.tooltip"/>}>
                <Icon type="info-circle-o" style={{marginRight: 4}}/>
              </Tooltip>
              {getFieldDecorator('sample_document', {
                initialValue: this.props.entrustdata.data.sample_document || '',
              }, {
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
                {getFieldDecorator('sampleChocie', {
                  initialValue: this.props.entrustdata.data.sampleChocie || 'form.sample.radio.destruction',
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
                getFieldDecorator('expectedDeadLine', {
                  initialValue: this.props.entrustdata.data.expectedDeadLine1 ? [moment(this.props.entrustdata.data.expectedDeadLine1 || ' ', 'YYYY/MM/DD'), moment(this.props.entrustdata.data.expectedDeadLine2 || ' ', 'YYYY/MM/DD')] : null
                }, {
                  rules: [
                    {
                      required: true,
                      message: formatMessage({id: 'basic-form.date.required'}),
                    },
                  ],
                })(
                  <RangePicker

                    style={{width: '100%'}}
                    placeholder={[
                      formatMessage({id: 'basic-form.placeholder.start'}),
                      formatMessage({id: 'basic-form.placeholder.end'}),
                    ]}
                  />
                )}
            </FormItem>
            <Form onSubmit={this.handleSubmit} hideRequiredMark style={{marginTop: 8}}>
              <h3>委托单位信息</h3>
              <FormItem {...formItemLayout} label={<FormattedMessage id="basic-form.cusInfo.phone.label"/>}>
                {getFieldDecorator('cusInfo.infoTE', {
                  initialValue: this.props.entrustdata.data.infoTE || '',
                }, {
                  rules: [
                    {
                      required: true,
                      message: formatMessage({id: 'basic-form.cusInfo.phone.required'}),
                    },
                  ],
                })(<Input/>)}
              </FormItem>
              <FormItem {...formItemLayout} label={<FormattedMessage id="basic-form.cusInfo.fax.label"/>}>
                {getFieldDecorator('cusInfo.infoFAX', {
                  initialValue: this.props.entrustdata.data.infoFAX || '',
                }, {
                  rules: [
                    {
                      required: true,
                      message: formatMessage({id: 'basic-form.fax.required'}),
                    },
                  ],
                })(<Input/>)}
              </FormItem>
              <FormItem {...formItemLayout} label={<FormattedMessage id="basic-form.cusInfo.address.label"/>}>
                {getFieldDecorator('cusInfo.infoAddr', {
                  initialValue: this.props.entrustdata.data.infoAddr || '',
                }, {
                  rules: [
                    {
                      required: true,
                      message: formatMessage({id: 'basic-form.cusInfo.address.required'}),
                    },
                  ],
                })(<Input/>)}
              </FormItem>
              <FormItem {...formItemLayout} label={<FormattedMessage id="basic-form.cusInfo.postcode.label"/>}>
                {getFieldDecorator('cusInfo.infoPostcode', {
                  initialValue: this.props.entrustdata.data.infoPostcode || '',
                }, {
                  rules: [
                    {
                      required: true,
                      message: formatMessage({id: 'basic-form.cusInfo.postcode.required'}),
                    },
                  ],
                })(<Input/>)}
              </FormItem>
              <FormItem {...formItemLayout} label={<FormattedMessage id="basic-form.cusInfo.contactor.label"/>}>
                {getFieldDecorator('cusInfo.contactorName', {
                  initialValue: this.props.entrustdata.data.contactorName || '',
                }, {
                  rules: [
                    {
                      required: true,
                      message: formatMessage({id: 'basic-form.cusInfo.contactor.required'}),
                    },
                  ],
                })(<Input/>)}
              </FormItem>
              <FormItem {...formItemLayout} label={<FormattedMessage id="basic-form.cusInfo.tel.label"/>}>
                {getFieldDecorator('cusInfo.infoMobilePhone', {
                  initialValue: this.props.entrustdata.data.infoMobilePhone || '',
                }, {
                  rules: [
                    {
                      required: true,
                      message: formatMessage({id: 'basic-form.cusInfo.tel.required'}),
                    },
                  ],
                })(<Input/>)}
              </FormItem>
              <FormItem {...formItemLayout} label={<FormattedMessage id="basic-form.cusInfo.email.label"/>}>
                {getFieldDecorator('cusInfo.infoEmail', {
                  initialValue: this.props.entrustdata.data.infoEmail || '',
                }, {
                  rules: [
                    {
                      required: true,
                      message: formatMessage({id: 'basic-form.cusInfo.email.required'}),
                    },
                  ],
                })(<Input/>)}
              </FormItem>
              <FormItem {...formItemLayout} label={<FormattedMessage id="basic-form.cusInfo.url.label"/>}>
                {getFieldDecorator('cusInfo.infoURL', {
                  initialValue: this.props.entrustdata.data.infoURL || '',
                }, {
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
                    initialValue: this.props.entrustdata.data.antiVirus || 'basic-form.others.viruses.complete',
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
                    initialValue: this.props.entrustdata.data.checkSample || 'basic-form.others.tsample.code',
                  })(
                    <Radio.Group>
                      <Radio value="basic-form.others.tsample.code">
                        <FormattedMessage id="basic-form.others.tsample.code"/>
                      </Radio>
                      <Radio value="basic-form.others.tsample.exe">
                        <FormattedMessage id="basic-form.others.tsample.exe"/>
                      </Radio>
                    </Radio.Group>
                  )}
                </div>
              </FormItem>
              <FormItem
                {...formItemLayout}
                label={<FormattedMessage id="basic-form.others.reqword.label"/>}
              >
                <div>
                  {getFieldDecorator('reqword', {
                    initialValue: this.props.entrustdata.data.reqword || 'basic-form.others.reqword.plan',
                  })(
                    <Radio.Group>
                      <Radio value="basic-form.others.reqword.plan">
                        <FormattedMessage id="basic-form.others.reqword.plan"/>
                      </Radio>
                      <Radio value="basic-form.others.reqword.report">
                        <FormattedMessage id="basic-form.others.reqword.report"/>
                      </Radio>
                      <Radio value="basic-form.others.reqword.contract">
                        <FormattedMessage id="basic-form.others.reqword.contract"/>
                      </Radio>
                    </Radio.Group>
                  )}
                </div>
              </FormItem>
              <FormItem
                {...formItemLayout}
                label={<FormattedMessage id="basic-form.others.userword.label"/>}
              >
                <div>
                  {getFieldDecorator('userDocumentation', {
                    initialValue: this.props.entrustdata.data.userDocumentation || 'basic-form.others.userword.book',
                  })(
                    <Radio.Group>
                      <Radio value="basic-form.others.userword.book">
                        <FormattedMessage id="basic-form.others.userword.book"/>
                      </Radio>
                      <Radio value="basic-form.others.userword.guide">
                        <FormattedMessage id="basic-form.others.userword.guide"/>
                      </Radio>
                    </Radio.Group>
                  )}
                </div>
              </FormItem>
              <FormItem
                {...formItemLayout}
                label={<FormattedMessage id="basic-form.others.opword.label"/>}
              >
                <div>
                  {getFieldDecorator('operationDocument', {
                    initialValue: this.props.entrustdata.data.operationDocument || 'basic-form.others.opword.book1',
                  })(
                    <Radio.Group>
                      <Radio value="basic-form.others.opword.book1">
                        <FormattedMessage id="basic-form.others.opword.book1"/>
                      </Radio>
                      <Radio value="basic-form.others.opword.book2">
                        <FormattedMessage id="basic-form.others.opword.book2"/>
                      </Radio>
                      <Radio value="basic-form.others.opword.book3">
                        <FormattedMessage id="basic-form.others.opword.book3"/>
                      </Radio>
                      <Radio value="basic-form.others.opword.book4">
                        <FormattedMessage id="basic-form.others.opword.book4"/>
                      </Radio>
                    </Radio.Group>
                  )}
                </div>
              </FormItem>
              <FormItem
                {...formItemLayout}
                label={<FormattedMessage id="form.Confirmation.label"/>}
              >
                <div>
                  {getFieldDecorator('confirmationOpinions', {
                    initialValue: this.props.entrustdata.data.confirmationOpinions || 'form.Confirmation.radio.one',
                  })(
                    <Radio.Group>
                      <Radio value="form.Confirmation.radio.one">
                        <FormattedMessage id="form.Confirmation.radio.one"/>
                      </Radio>
                      <Radio value="form.Confirmation.radio.two">
                        <FormattedMessage id="form.Confirmation.radio.two"/>
                      </Radio>
                      <Radio value="form.Confirmation.radio.three">
                        <FormattedMessage id="form.Confirmation.radio.three"/>
                      </Radio>
                      <Radio value="form.Confirmation.radio.four">
                        <FormattedMessage id="form.Confirmation.radio.four"/>
                      </Radio>
                    </Radio.Group>
                  )}
                </div>
              </FormItem>
              <FormItem
                {...formItemLayout}
                label={<FormattedMessage id="form.Acceptance_opinion.label"/>}
              >
                <div>
                  {getFieldDecorator('acceptOpinions', {
                    initialValue: this.props.entrustdata.data.acceptOpinions || 'form.Acceptance_opinion.radio.one',
                  })(
                    <Radio.Group>
                      <Radio value="form.Acceptance_opinion.radio.one">
                        <FormattedMessage id="form.Acceptance_opinion.radio.one"/>
                      </Radio>
                      <Radio value="form.Acceptance_opinion.radio.two">
                        <FormattedMessage id="form.Acceptance_opinion.radio.two"/>
                      </Radio>
                      <Radio value="form.Acceptance_opinion.radio.three">
                        <FormattedMessage id="form.Acceptance_opinion.radio.three"/>
                      </Radio>
                    </Radio.Group>
                  )}
                </div>
              </FormItem>

              <FormItem {...formItemLayout} label={<FormattedMessage id="form.test_number.label"/>}>
                {getFieldDecorator('test_number', {
                  initialValue: this.props.entrustdata.data.test_number || '',
                }, {
                  rules: [
                    {
                      required: true,
                      message: formatMessage({id: 'validation.test_number.required'}),
                    },
                  ],
                })(<Input placeholder={formatMessage({id: 'form.test_number.placeholder'})}/>)}
              </FormItem>
              <FormItem {...formItemLayout} label={<FormattedMessage id="form.remarks.label"/>}>
                {getFieldDecorator('remarks', {
                  initialValue: this.props.entrustdata.data.remarks || '',
                }, {
                  rules: [
                    {
                      required: true,
                      message: formatMessage({id: 'validation.remarks.required'}),
                    },
                  ],
                })(
                  <TextArea
                    style={{minHeight: 32}}
                    placeholder={formatMessage({id: 'form.remarks.placeholder'})}
                    rows={10}
                  />
                )}
              </FormItem>

              <FormItem {...formItemLayout} label={<FormattedMessage id="form.acceptee_signature.label"/>}>
                {getFieldDecorator('acceptee_signature', {
                  initialValue: this.props.entrustdata.data.acceptee_signature || '',
                }, {
                  rules: [
                    {
                      required: true,
                      message: formatMessage({id: 'validation.acceptee_signature.required'}),
                    },
                  ],
                })(<Input placeholder={formatMessage({id: 'form.acceptee_signature.placeholder'})}/>)}
              </FormItem>

              <FormItem {...formItemLayout} label={<FormattedMessage id="form.acceptee_signature_time.label"/>}>
                {getFieldDecorator('acceptee_signature_time', {
                  initialValue: this.props.entrustdata.data.acceptee_signature_time || '',
                }, {
                  rules: [
                    {
                      required: true,
                      message: formatMessage({id: 'validation.acceptee_signature_time.required'}),
                    },
                  ],
                })(<Input placeholder={formatMessage({id: 'form.acceptee_signature_time.placeholder'})}/>)}
              </FormItem>
              <FormItem {...formItemLayout} label={<FormattedMessage id="form.client.label"/>}>
                {getFieldDecorator('completedByClient', {
                  initialValue: this.props.entrustdata.data.completedByClient || '',
                }, {
                  rules: [
                    {
                      required: true,
                      message: formatMessage({id: 'validation.client.required'}),
                    },
                  ],
                })(
                  <TextArea
                    style={{minHeight: 32}}
                    placeholder={formatMessage({id: 'form.client.placeholder'})}
                    rows={8}
                  />
                )}
              </FormItem>

              <FormItem {...formItemLayout} label={<FormattedMessage id="form.client_signature.label"/>}>
                {getFieldDecorator('client_signature', {
                  initialValue: this.props.entrustdata.data.client_signature || '',
                }, {
                  rules: [
                    {
                      required: true,
                      message: formatMessage({id: 'validation.client_signature.required'}),
                    },
                  ],
                })(<Input placeholder={formatMessage({id: 'form.client_signature.placeholder'})}/>)}
              </FormItem>
              <FormItem {...formItemLayout} label={<FormattedMessage id="form.client_signature_time.label"/>}>
                {getFieldDecorator('client_signature_time', {
                  initialValue: this.props.entrustdata.data.client_signature_time || '',
                }, {
                  rules: [
                    {
                      required: true,
                      message: formatMessage({id: 'validation.client_signature_time.required'}),
                    },
                  ],
                })(<Input placeholder={formatMessage({id: 'form.client_signature_time.placeholder'})}/>)}
              </FormItem>

              <FormItem {...submitFormLayout} style={{marginTop: 32}}>
                <Button type="primary" onClick={showConfirm.bind(this)}>
                  <FormattedMessage id="basic-form.form.submit"/>
                </Button>

                <Button htmlType="submit" style={{marginLeft: 8}}>
                  <FormattedMessage id="basic-form.form.save"/>
                </Button>

                <Button onClick={showDeleteConfirm.bind(this, this.props.location.query.pid)} style={{marginLeft: 8}}
                        type="danger">
                  <FormattedMessage id="basic-form.form.delete"/>
                </Button>
              </FormItem>
            </Form>
          </Card>
        </PageHeaderWrapper>
      </Breadcrumb>
    );
  }
}

export default BasicForm;
