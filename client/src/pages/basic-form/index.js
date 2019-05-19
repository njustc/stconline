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
} from 'antd';
import PageHeaderWrapper from './components/PageHeaderWrapper';
import styles from './style.less';

const FormItem = Form.Item;
const { Option } = Select;
const { RangePicker } = DatePicker;
const { TextArea } = Input;

@connect(({ loading }) => ({
  submitting: loading.effects['basicForm/submitRegularForm'],
}))
@Form.create()
class BasicForm extends PureComponent {
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
      type: 'basicForm/submitRegularForm',
      payload: values,
    });
  };


  render() {
    const { submitting } = this.props;
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
      <PageHeaderWrapper
        title={<FormattedMessage id="basic-form.basic.title" />}
        content={<FormattedMessage id="basic-form.basic.description" />}
      >
        <Button type="primary" onClick={this.submit}>click me</Button>
        <Card bordered={false}>
          <FormItem
              {...formItemLayout}
              label={<FormattedMessage id="basic-form.radio.testtype" />}
            >
              <div>
                {getFieldDecorator('confirm', {
                  initialValue: '1',
                })(
                  <Radio.Group>
                    <Radio value="1">
                      <FormattedMessage id="basic-form.radio.confirm" />
                    </Radio>
                    <Radio value="2">
                      <FormattedMessage id="basic-form.radio.test" />
                    </Radio>
                    <Radio value="3">
                      <FormattedMessage id="basic-form.radio.tothers" />
                    </Radio>
                  </Radio.Group>
                )}
              </div>
            </FormItem>
            <FormItem {...formItemLayout} label={<FormattedMessage id="basic-form.softname.label" />}>
              {getFieldDecorator('softname', {
                rules: [
                  {
                    required: true,
                    message: formatMessage({ id: 'basic-form.softname.required' }),
                  },
                ],
              })(<Input placeholder={formatMessage({ id: 'basic-form.softname.placeholder' })} />)}
            </FormItem>
            <FormItem {...formItemLayout} label={<FormattedMessage id="basic-form.version.label" />}>
              {getFieldDecorator('version', {
                rules: [
                  {
                    required: true,
                    message: formatMessage({ id: 'basic-form.version.required' }),
                  },
                ],
              })(<Input placeholder={formatMessage({ id: 'basic-form.version.placeholder' })} />)}
            </FormItem>
            <FormItem {...formItemLayout} label={<FormattedMessage id="basic-form.unitc.label" />}>
              {getFieldDecorator('unitc', {
                rules: [
                  {
                    required: true,
                    message: formatMessage({ id: 'basic-form.unitc.required' }),
                  },
                ],
              })(<Input placeholder={formatMessage({ id: 'basic-form.unitc.placeholder' })} />)}
            </FormItem>
            <FormItem {...formItemLayout} label={<FormattedMessage id="basic-form.unite.label" />}>
              {getFieldDecorator('unite', {
                rules: [
                  {
                    required: true,
                    message: formatMessage({ id: 'basic-form.unite.required' }),
                  },
                ],
              })(<Input placeholder={formatMessage({ id: 'basic-form.unite.placeholder' })} />)}
            </FormItem>

            <FormItem {...formItemLayout} label={<FormattedMessage id="basic-form.unitd.label" />}>
              {getFieldDecorator('unitd', {
                rules: [
                  {
                    required: true,
                    message: formatMessage({ id: 'basic-form.unitd.required' }),
                  },
                ],
              })(<Input placeholder={formatMessage({ id: 'basic-form.unitd.placeholder' })} />)}
            </FormItem>
            <FormItem
              {...formItemLayout}
              label={<FormattedMessage id="basic-form.radio.unit" />}
            >
              <div>
                {getFieldDecorator('domestic', {
                  initialValue: '1',
                })(
                  <Radio.Group>
                    <Radio value="1">
                      <FormattedMessage id="basic-form.radio.domestic" />
                    </Radio>
                    <Radio value="2">
                      <FormattedMessage id="basic-form.radio.foreign" />
                    </Radio>
                    <Radio value="3">
                      <FormattedMessage id="basic-form.radio.hmt" />
                    </Radio>
                    <Radio value="4">
                      <FormattedMessage id="basic-form.radio.research" />
                    </Radio>
                    <Radio value="5">
                      <FormattedMessage id="basic-form.radio.government" />
                    </Radio>
                    <Radio value="6">
                      <FormattedMessage id="basic-form.radio.uothers" />
                    </Radio>
                  </Radio.Group>
                )}
              </div>
            </FormItem>
            <FormItem {...formItemLayout} label={<FormattedMessage id="basic-form.userobject.label" />}>
              {getFieldDecorator('userobject', {
                rules: [
                  {
                    required: true,
                    message: formatMessage({ id: 'basic-form.userobject.required' }),
                  },
                ],
              })(
                <TextArea
                  style={{ minHeight: 32 }}
                  placeholder={formatMessage({ id: 'basic-form.userobject.placeholder' })}
                  rows={4}
                />
              )}
            </FormItem>
            <FormItem {...formItemLayout} label={<FormattedMessage id="basic-form.intro.label" />}>
              {getFieldDecorator('intro', {
                rules: [
                  {
                    required: true,
                    message: formatMessage({ id: 'basic-form.intro.required' }),
                  },
                ],
              })(
                <TextArea
                  style={{ minHeight: 32 }}
                  placeholder={formatMessage({ id: 'basic-form.intro.placeholder' })}
                  rows={9}
                />
              )}
            </FormItem>
            <FormItem
              {...formItemLayout}
              label={<FormattedMessage id="basic-form.radio.basis" />}
            >
              <div>
                {getFieldDecorator('basis1', {
                  initialValue: '1',
                })(
                  <Radio.Group>
                    <Radio value="1">
                      <FormattedMessage id="basic-form.radio.basis1" />
                    </Radio>
                    <Radio value="2">
                      <FormattedMessage id="basic-form.radio.basis2" />
                    </Radio>
                    <Radio value="3">
                      <FormattedMessage id="basic-form.radio.basis3" />
                    </Radio>
                    <Radio value="4">
                      <FormattedMessage id="basic-form.radio.basis4" />
                    </Radio>
                    <Radio value="4">
                      <FormattedMessage id="basic-form.radio.basis5" />
                    </Radio>
                  </Radio.Group>
                )}
              </div>
            </FormItem>
            <FormItem
              {...formItemLayout}
              label={<FormattedMessage id="basic-form.radio.target" />}
            >
              <div>
                {getFieldDecorator('target1', {
                  initialValue: '1',
                })(
                  <Radio.Group>
                    <Radio value="1">
                      <FormattedMessage id="basic-form.radio.target1" />
                    </Radio>
                    <Radio value="2">
                      <FormattedMessage id="basic-form.radio.target2" />
                    </Radio>
                    <Radio value="3">
                      <FormattedMessage id="basic-form.radio.target3" />
                    </Radio>
                    <Radio value="4">
                      <FormattedMessage id="basic-form.radio.target4" />
                    </Radio>
                    <Radio value="5">
                      <FormattedMessage id="basic-form.radio.target5" />
                    </Radio>
                    <Radio value="6">
                      <FormattedMessage id="basic-form.radio.target6" />
                    </Radio>
                    <Radio value="7">
                      <FormattedMessage id="basic-form.radio.target7" />
                    </Radio>
                    <Radio value="8">
                      <FormattedMessage id="basic-form.radio.target8" />
                    </Radio>
                    <Radio value="9">
                      <FormattedMessage id="basic-form.radio.target9" />
                    </Radio>
                    <Radio value="10">
                      <FormattedMessage id="basic-form.radio.target10" />
                    </Radio>
                    <Radio value="11">
                      <FormattedMessage id="basic-form.radio.target11" />
                    </Radio>
                    <Radio value="12">
                      <FormattedMessage id="basic-form.radio.target12" />
                    </Radio>
                    <Radio value="13">
                      <FormattedMessage id="basic-form.radio.target13" />
                    </Radio>
                  </Radio.Group>
                )}
              </div>
            </FormItem>
            <FormItem {...formItemLayout} label={<FormattedMessage id="form.softscale_function_number.label" />}>
              {getFieldDecorator('softscale_function_number', {
                rules: [
                  {
                    required: true,
                    message: formatMessage({ id: 'validation.softscale_function_number.required' }),
                  },
                ],
              })(<Input placeholder={formatMessage({ id: 'form.softscale_function_number.placeholder' })} />)}
            </FormItem>
            <FormItem {...formItemLayout} label={<FormattedMessage id="form.softscale_function_point.label" />}>
                    {getFieldDecorator('softscale_function_point', {
                      rules: [
                        {
                          required: true,
                          message: formatMessage({ id: 'validation.softscale_function_point.required' }),
                        },
                      ],
                    })(<Input placeholder={formatMessage({ id: 'form.softscale_function_point.placeholder' })} />)}
            </FormItem>
            <FormItem {...formItemLayout} label={<FormattedMessage id="form.softscale_code_number.label" />}>
                    {getFieldDecorator('softscale_code_number', {
                      rules: [
                        {
                          required: true,
                          message: formatMessage({ id: 'validation.softscale_code_number.required' }),
                        },
                      ],
                    })(<Input placeholder={formatMessage({ id: 'form.softscale_code_number.placeholder' })} />)}
            </FormItem>
            <FormItem {...formItemLayout} label={<FormattedMessage id="form.sample_document.label" />}>
            <Tooltip title={<FormattedMessage id="form.sample_document.label.tooltip" />}>
                            <Icon type="info-circle-o" style={{ marginRight: 4 }} />
                          </Tooltip>
                    {getFieldDecorator('sample_document', {
                      rules: [
                        {
                          required: true,
                          message: formatMessage({ id: 'validation.sample_document.required' }),
                        },
                      ],
                    })(
                      <TextArea
                        style={{ minHeight: 32 }}
                        placeholder={formatMessage({ id: 'form.sample_document.placeholder' })}
                        rows={20}
                      />
                    )}
            </FormItem>
            <FormItem
                    {...formItemLayout}
                    label={<FormattedMessage id="form.sample.label" />}
                  >
                    <div>
                      {getFieldDecorator('sample', {
                        initialValue: '1',
                      })(
                        <Radio.Group>
                          <Radio value="1">
                            <FormattedMessage id="form.sample.radio.destruction" />
                          </Radio>
                          <Radio value="2">
                            <FormattedMessage id="form.sample.radio.return" />
                          </Radio>
                        </Radio.Group>
                      )}
                    </div>
            </FormItem>

          <Form onSubmit={this.handleSubmit} hideRequiredMark style={{ marginTop: 8 }}>
            <h3>委托单位信息</h3>
            <FormItem {...formItemLayout} label={<FormattedMessage id="basic-form.cusInfo.phone.label" />}>
              {getFieldDecorator('cusInfo.phone', {
                rules: [
                  {
                    required: true,
                    message: formatMessage({ id: 'basic-form.cusInfo.phone.required' }),
                  },
                ],
              })(<Input />)}
            </FormItem>
            <FormItem {...formItemLayout} label={<FormattedMessage id="basic-form.cusInfo.fax.label" />}>
              {getFieldDecorator('cusInfo.fax', {
                rules: [
                  {
                    required: true,
                    message: formatMessage({ id: 'basic-form.cusInfo.fax.required' }),
                  },
                ],
              })(<Input />)}
            </FormItem>
            <FormItem {...formItemLayout} label={<FormattedMessage id="basic-form.cusInfo.address.label" />}>
              {getFieldDecorator('cusInfo.address', {
                rules: [
                  {
                    required: true,
                    message: formatMessage({ id: 'basic-form.cusInfo.address.required' }),
                  },
                ],
              })(<Input />)}
            </FormItem>
            <FormItem {...formItemLayout} label={<FormattedMessage id="basic-form.cusInfo.postcode.label" />}>
              {getFieldDecorator('cusInfo.postcode', {
                rules: [
                  {
                    required: true,
                    message: formatMessage({ id: 'basic-form.cusInfo.postcode.required' }),
                  },
                ],
              })(<Input />)}
            </FormItem>
            <FormItem {...formItemLayout} label={<FormattedMessage id="basic-form.cusInfo.contactor.label" />}>
              {getFieldDecorator('cusInfo.contactor', {
                rules: [
                  {
                    required: true,
                    message: formatMessage({ id: 'basic-form.cusInfo.contactor.required' }),
                  },
                ],
              })(<Input/>)}
            </FormItem>
            <FormItem {...formItemLayout} label={<FormattedMessage id="basic-form.cusInfo.tel.label" />}>
              {getFieldDecorator('cusInfo.tel', {
                rules: [
                  {
                    required: true,
                    message: formatMessage({ id: 'basic-form.cusInfo.tel.required' }),
                  },
                ],
              })(<Input  />)}
            </FormItem>
            <FormItem {...formItemLayout} label={<FormattedMessage id="basic-form.cusInfo.email.label" />}>
              {getFieldDecorator('cusInfo.email', {
                rules: [
                  {
                    required: true,
                    message: formatMessage({ id: 'basic-form.cusInfo.email.required' }),
                  },
                ],
              })(<Input />)}
            </FormItem>
            <FormItem {...formItemLayout} label={<FormattedMessage id="basic-form.cusInfo.url.label" />}>
              {getFieldDecorator('cusInfo.url', {
                rules: [
                  {
                    required: true,
                    message: formatMessage({ id: 'basic-form.cusInfo.url.required' }),
                  },
                ],
              })(<Input placeholder={formatMessage({ id: 'basic-form.cusInfo.url.placeholder' })}/>)}
            </FormItem>



            <FormItem
              {...formItemLayout}
              label={<FormattedMessage id="basic-form.others.SecLev.label" />}
            >
              <div>
                {getFieldDecorator('SecLev', {
                  initialValue: '1',
                })(
                  <Radio.Group>
                    <Radio value="1">
                      <FormattedMessage id="basic-form.others.SecLev.public" />
                    </Radio>
                    <Radio value="2">
                      <FormattedMessage id="basic-form.others.SecLev.partially-public" />
                    </Radio>
                    <Radio value="3">
                      <FormattedMessage id="basic-form.others.SecLev.private" />
                    </Radio>
                  </Radio.Group>
                )}
              </div>
            </FormItem>
            <FormItem {...submitFormLayout} style={{ marginTop: 32 }}>
              <Button type="primary" htmlType="submit" loading={submitting}>
                <FormattedMessage id="basic-form.form.submit" />
              </Button>
              <Button style={{ marginLeft: 8 }}>
                <FormattedMessage id="basic-form.form.save" />
              </Button>
            </FormItem>
          </Form>
        </Card>
      </PageHeaderWrapper>
    );
  }
}

export default BasicForm;
