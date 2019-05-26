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
  Breadcrumb
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
	<Breadcrumb>
			<Breadcrumb.Item href="/basic-list">委托列表</Breadcrumb.Item>
			<Breadcrumb.Item href="/basic-form">编辑委托</Breadcrumb.Item>
		<h1></h1>
      <PageHeaderWrapper
        title={<FormattedMessage id="basic-form.basic.title" />}
        content={<FormattedMessage id="basic-form.basic.description" />}
      >
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
                  <Radio value="5">
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

          <h3>软件规模</h3>
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
          <FormItem
            {...formItemLayout}
            label={<FormattedMessage id="basic-form.radio.system" />}
          >
            <div>
              {getFieldDecorator('support1', {
                initialValue: '1',
              })(
                <Radio.Group>
                  <Radio value="1">
                    <FormattedMessage id="basic-form.radio.system1" />
                  </Radio>
                  <Radio value="2">
                    <FormattedMessage id="basic-form.radio.system2" />
                  </Radio>
                  <Radio value="3">
                    <FormattedMessage id="basic-form.radio.system3" />
                  </Radio>
                  <Radio value="4">
                    <FormattedMessage id="basic-form.radio.system4" />
                  </Radio>
                  <Radio value="5">
                    <FormattedMessage id="basic-form.radio.system5" />
                  </Radio>
                </Radio.Group>
              )}
            </div>
          </FormItem>

          <FormItem
            {...formItemLayout}
            label={<FormattedMessage id="basic-form.radio.support" />}
          >
            <div>
              {getFieldDecorator('support1', {
                initialValue: '1',
              })(
                <Radio.Group>
                  <Radio value="1">
                    <FormattedMessage id="basic-form.radio.support1" />
                  </Radio>
                  <Radio value="2">
                    <FormattedMessage id="basic-form.radio.support2" />
                  </Radio>
                  <Radio value="3">
                    <FormattedMessage id="basic-form.radio.support3" />
                  </Radio>
                  <Radio value="4">
                    <FormattedMessage id="basic-form.radio.support4" />
                  </Radio>
                  <Radio value="5">
                    <FormattedMessage id="basic-form.radio.support5" />
                  </Radio>
                  <Radio value="6">
                    <FormattedMessage id="basic-form.radio.support6" />
                  </Radio>
                </Radio.Group>
              )}
            </div>
          </FormItem>
          <FormItem
            {...formItemLayout}
            label={<FormattedMessage id="basic-form.radio.application" />}
          >
            <div>
              {getFieldDecorator('application1', {
                initialValue: '1',
              })(
                <Radio.Group>
                  <Radio value="1">
                    <FormattedMessage id="basic-form.radio.application1" />
                  </Radio>
                  <Radio value="2">
                    <FormattedMessage id="basic-form.radio.application2" />
                  </Radio>
                  <Radio value="3">
                    <FormattedMessage id="basic-form.radio.application3" />
                  </Radio>
                  <Radio value="4">
                    <FormattedMessage id="basic-form.radio.application4" />
                  </Radio>
                  <Radio value="5">
                    <FormattedMessage id="basic-form.radio.application5" />
                  </Radio>
                  <Radio value="6">
                    <FormattedMessage id="basic-form.radio.application6" />
                  </Radio>
                  <Radio value="7">
                    <FormattedMessage id="basic-form.radio.application7" />
                  </Radio>
                  <Radio value="8">
                    <FormattedMessage id="basic-form.radio.application8" />
                  </Radio>
                  <Radio value="9">
                    <FormattedMessage id="basic-form.radio.application9" />
                  </Radio>
                  <Radio value="10">
                    <FormattedMessage id="basic-form.radio.application10" />
                  </Radio>
                  <Radio value="11">
                    <FormattedMessage id="basic-form.radio.application11" />
                  </Radio>
                  <Radio value="12">
                    <FormattedMessage id="basic-form.radio.application12" />
                  </Radio>
                  <Radio value="13">
                    <FormattedMessage id="basic-form.radio.application13" />
                  </Radio>
                </Radio.Group>
              )}
            </div>
          </FormItem>
          <FormItem
            {...formItemLayout}
            label={<FormattedMessage id="basic-form.radio.othersoft" />}
          >
            <div>
              {getFieldDecorator('othersoft1', {
                initialValue: '1',
              })(
                <Radio.Group>
                  <Radio value="1">
                    <FormattedMessage id="basic-form.radio.othersoft1" />
                  </Radio>
                </Radio.Group>
              )}
            </div>
          </FormItem>

          <h3>运行环境</h3>
          <h4>客户端</h4>
          <FormItem
            {...formItemLayout}
            label={<FormattedMessage id="basic-form.radio.opsystem" />}
          >
            <div>
              {getFieldDecorator('opsystem1', {
                initialValue: '1',
              })(
                <Radio.Group>
                  <Radio value="1">
                    <FormattedMessage id="basic-form.radio.opsystem1" />
                  </Radio>
                  <Radio value="2">
                    <FormattedMessage id="basic-form.radio.opsystem2" />
                  </Radio>
                  <Radio value="3">
                    <FormattedMessage id="basic-form.radio.opsystem3" />
                  </Radio>
                </Radio.Group>
              )}
            </div>
          </FormItem>
          <FormItem {...formItemLayout} label={<FormattedMessage id="basic-form.usermem.label" />}>
            {getFieldDecorator('usermem', {
              rules: [
                {
                  required: true,
                  message: formatMessage({ id: 'basic-form.usermem.required' }),
                },
              ],
            })(<Input placeholder={formatMessage({ id: 'basic-form.usermem.placeholder' })} />)}
          </FormItem>
          <FormItem {...formItemLayout} label={<FormattedMessage id="basic-form.userother.label" />}>
            {getFieldDecorator('userother', {
              rules: [
                {
                  required: true,
                  message: formatMessage({ id: 'basic-form.userother.required' }),
                },
              ],
            })(<Input placeholder={formatMessage({ id: 'basic-form.userother.placeholder' })} />)}
          </FormItem>
          <h4>服务器端</h4>
          <h5>硬件</h5>
          <FormItem {...formItemLayout} label={<FormattedMessage id="basic-form.hardmem.label" />}>
            {getFieldDecorator('hardmem', {
              rules: [
                {
                  required: true,
                  message: formatMessage({ id: 'basic-form.hardmem.required' }),
                },
              ],
            })(<Input placeholder={formatMessage({ id: 'basic-form.hardmem.placeholder' })} />)}
          </FormItem>
          <FormItem {...formItemLayout} label={<FormattedMessage id="basic-form.harddisk.label" />}>
            {getFieldDecorator('harddisk', {
              rules: [
                {
                  required: true,
                  message: formatMessage({ id: 'basic-form.harddisk.required' }),
                },
              ],
            })(<Input placeholder={formatMessage({ id: 'basic-form.harddisk.placeholder' })} />)}
          </FormItem>
          <FormItem {...formItemLayout} label={<FormattedMessage id="basic-form.hardother.label" />}>
            {getFieldDecorator('hardother', {
              rules: [
                {
                  required: true,
                  message: formatMessage({ id: 'basic-form.hardother.required' }),
                },
              ],
            })(<Input placeholder={formatMessage({ id: 'basic-form.hardother.placeholder' })} />)}
          </FormItem>
          <h5>软件</h5>
          <FormItem {...formItemLayout} label={<FormattedMessage id="basic-form.softsystem.label" />}>
            {getFieldDecorator('softsystem', {
              rules: [
                {
                  required: true,
                  message: formatMessage({ id: 'basic-form.softsystem.required' }),
                },
              ],
            })(<Input placeholder={formatMessage({ id: 'basic-form.softsystem.placeholder' })} />)}
          </FormItem>
          <FormItem {...formItemLayout} label={<FormattedMessage id="basic-form.softversion.label" />}>
            {getFieldDecorator('softversion', {
              rules: [
                {
                  required: true,
                  message: formatMessage({ id: 'basic-form.softversion.required' }),
                },
              ],
            })(<Input placeholder={formatMessage({ id: 'basic-form.softversion.placeholder' })} />)}
          </FormItem>
          <FormItem {...formItemLayout} label={<FormattedMessage id="basic-form.softprolan.label" />}>
            {getFieldDecorator('softprolan', {
              rules: [
                {
                  required: true,
                  message: formatMessage({ id: 'basic-form.softprolan.required' }),
                },
              ],
            })(<Input placeholder={formatMessage({ id: 'basic-form.softprolan.placeholder' })} />)}
          </FormItem>
          <FormItem {...formItemLayout} label={<FormattedMessage id="basic-form.softdata.label" />}>
            {getFieldDecorator('softdata', {
              rules: [
                {
                  required: true,
                  message: formatMessage({ id: 'basic-form.softdata.required' }),
                },
              ],
            })(<Input placeholder={formatMessage({ id: 'basic-form.softdata.placeholder' })} />)}
          </FormItem>
          <FormItem {...formItemLayout} label={<FormattedMessage id="basic-form.softmiddle.label" />}>
            {getFieldDecorator('softmiddle', {
              rules: [
                {
                  required: true,
                  message: formatMessage({ id: 'basic-form.softmiddle.required' }),
                },
              ],
            })(<Input placeholder={formatMessage({ id: 'basic-form.softmiddle.placeholder' })} />)}
          </FormItem>
          <h4>网络环境</h4>
          <FormItem {...formItemLayout} label={<FormattedMessage id="basic-form.netenvironment.label" />}>
            {getFieldDecorator('netenvironment', {
              rules: [
                {
                  required: true,
                  message: formatMessage({ id: 'basic-form.netenvironment.required' }),
                },
              ],
            })(
              <TextArea
                style={{ minHeight: 32 }}
                placeholder={formatMessage({ id: 'basic-form.netenvironment.placeholder' })}
                rows={9}
              />
            )}
          </FormItem>

          <h3>样品和数量</h3>
          <h4>软件介质</h4>
          <FormItem {...formItemLayout} label={<FormattedMessage id="basic-form.mediumg.label" />}>
            {getFieldDecorator('mediumg', {
              rules: [
                {
                  required: true,
                  message: formatMessage({ id: 'basic-form.mediumg.required' }),
                },
              ],
            })(<Input placeholder={formatMessage({ id: 'basic-form.mediumg.placeholder' })} />)}
          </FormItem>
          <FormItem {...formItemLayout} label={<FormattedMessage id="basic-form.mediumu.label" />}>
            {getFieldDecorator('mediumu', {
              rules: [
                {
                  required: true,
                  message: formatMessage({ id: 'basic-form.mediumu.required' }),
                },
              ],
            })(<Input placeholder={formatMessage({ id: 'basic-form.mediumu.placeholder' })} />)}
          </FormItem>
          <FormItem {...formItemLayout} label={<FormattedMessage id="basic-form.mediumo.label" />}>
            {getFieldDecorator('mediumo', {
              rules: [
                {
                  required: true,
                  message: formatMessage({ id: 'basic-form.mediumo.required' }),
                },
              ],
            })(<Input placeholder={formatMessage({ id: 'basic-form.softmiddle.placeholder' })} />)}
          </FormItem>

          <h4>文档资料</h4>
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
                rows={10}
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
          <FormItem {...formItemLayout} label={<FormattedMessage id="basic-form.date.label" />}>
            {getFieldDecorator('date', {
              rules: [
                {
                  required: true,
                  message: formatMessage({ id: 'basic-form.date.required' }),
                },
              ],
            })(
              <RangePicker
                style={{ width: '100%' }}
                placeholder={[
                  formatMessage({ id: 'basic-form.placeholder.start' }),
                  formatMessage({ id: 'basic-form.placeholder.end' }),
                ]}
              />
            )}
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
            <FormItem
              {...formItemLayout}
              label={<FormattedMessage id="basic-form.others.viruses.label" />}
            >
              <div>
                {getFieldDecorator('viruses', {
                  initialValue: '1',
                })(
                  <Radio.Group>
                    <Radio value="1">
                      <FormattedMessage id="basic-form.others.viruses.complete" />
                    </Radio>
                    <Radio value="2">
                      <FormattedMessage id="basic-form.others.viruses.cannot" />
                    </Radio>
                  </Radio.Group>
                )}
              </div>
            </FormItem>
            <FormItem
              {...formItemLayout}
              label={<FormattedMessage id="basic-form.others.tsample.label" />}
            >
              <div>
                {getFieldDecorator('viruses', {
                  initialValue: '1',
                })(
                  <Radio.Group>
                    <Radio value="1">
                      <FormattedMessage id="basic-form.others.tsample.code" />
                    </Radio>
                    <Radio value="2">
                      <FormattedMessage id="basic-form.others.tsample.exe" />
                    </Radio>
                  </Radio.Group>
                )}
              </div>
            </FormItem>
            <FormItem
              {...formItemLayout}
              label={<FormattedMessage id="basic-form.others.reqword.label" />}
            >
              <div>
                {getFieldDecorator('reqword', {
                  initialValue: '1',
                })(
                  <Radio.Group>
                    <Radio value="1">
                      <FormattedMessage id="basic-form.others.reqword.plan" />
                    </Radio>
                    <Radio value="2">
                      <FormattedMessage id="basic-form.others.reqword.report" />
                    </Radio>
                    <Radio value="3">
                      <FormattedMessage id="basic-form.others.reqword.contract" />
                    </Radio>
                  </Radio.Group>
                )}
              </div>
            </FormItem>
            <FormItem
              {...formItemLayout}
              label={<FormattedMessage id="basic-form.others.userword.label" />}
            >
              <div>
                {getFieldDecorator('userword', {
                  initialValue: '1',
                })(
                  <Radio.Group>
                    <Radio value="1">
                      <FormattedMessage id="basic-form.others.userword.book" />
                    </Radio>
                    <Radio value="2">
                      <FormattedMessage id="basic-form.others.userword.guide" />
                    </Radio>
                  </Radio.Group>
                )}
              </div>
            </FormItem>
            <FormItem
              {...formItemLayout}
              label={<FormattedMessage id="basic-form.others.opword.label" />}
            >
              <div>
                {getFieldDecorator('opword', {
                  initialValue: '1',
                })(
                  <Radio.Group>
                    <Radio value="1">
                      <FormattedMessage id="basic-form.others.opword.book1" />
                    </Radio>
                    <Radio value="2">
                      <FormattedMessage id="basic-form.others.opword.book2" />
                    </Radio>
                    <Radio value="3">
                      <FormattedMessage id="basic-form.others.opword.book3" />
                    </Radio>
                    <Radio value="4">
                      <FormattedMessage id="basic-form.others.opword.book4" />
                    </Radio>
                  </Radio.Group>
                )}
              </div>
            </FormItem>
            <FormItem
              {...formItemLayout}
              label={<FormattedMessage id="form.Confirmation.label" />}
            >
              <div>
                {getFieldDecorator('Confirmation', {
                  initialValue: '1',
                })(
                  <Radio.Group>
                    <Radio value="1">
                      <FormattedMessage id="form.Confirmation.radio.one" />
                    </Radio>
                    <Radio value="2">
                      <FormattedMessage id="form.Confirmation.radio.two" />
                    </Radio>
                    <Radio value="3">
                      <FormattedMessage id="form.Confirmation.radio.three" />
                    </Radio>
                    <Radio value="4">
                      <FormattedMessage id="form.Confirmation.radio.four" />
                    </Radio>
                  </Radio.Group>
                )}
              </div>
            </FormItem>
            <FormItem
              {...formItemLayout}
              label={<FormattedMessage id="form.Acceptance_opinion.label" />}
            >
              <div>
                {getFieldDecorator('Acceptance_opinion', {
                  initialValue: '1',
                })(
                  <Radio.Group>
                    <Radio value="1">
                      <FormattedMessage id="form.Acceptance_opinion.radio.one" />
                    </Radio>
                    <Radio value="2">
                      <FormattedMessage id="form.Acceptance_opinion.radio.two" />
                    </Radio>
                    <Radio value="3">
                      <FormattedMessage id="form.Acceptance_opinion.radio.three" />
                    </Radio>
                  </Radio.Group>
                )}
              </div>
            </FormItem>

            <FormItem {...formItemLayout} label={<FormattedMessage id="form.test_number.label" />}>
              {getFieldDecorator('test_number', {
                rules: [
                  {
                    required: true,
                    message: formatMessage({ id: 'validation.test_number.required' }),
                  },
                ],
              })(<Input placeholder={formatMessage({ id: 'form.test_number.placeholder' })} />)}
            </FormItem>
            <FormItem {...formItemLayout} label={<FormattedMessage id="form.remarks.label" />}>
              {getFieldDecorator('remarks', {
                rules: [
                  {
                    required: true,
                    message: formatMessage({ id: 'validation.remarks.required' }),
                  },
                ],
              })(
                <TextArea
                  style={{ minHeight: 32 }}
                  placeholder={formatMessage({ id: 'form.remarks.placeholder' })}
                  rows={10}
                />
              )}
            </FormItem>

            <FormItem {...formItemLayout} label={<FormattedMessage id="form.acceptee_signature.label" />}>
              {getFieldDecorator('acceptee_signature', {
                rules: [
                  {
                    required: true,
                    message: formatMessage({ id: 'validation.acceptee_signature.required' }),
                  },
                ],
              })(<Input placeholder={formatMessage({ id: 'form.acceptee_signature.placeholder' })} />)}
            </FormItem>

            <FormItem {...formItemLayout} label={<FormattedMessage id="form.acceptee_signature_time.label" />}>
              {getFieldDecorator('acceptee_signature_time', {
                rules: [
                  {
                    required: true,
                    message: formatMessage({ id: 'validation.acceptee_signature_time.required' }),
                  },
                ],
              })(<Input placeholder={formatMessage({ id: 'form.acceptee_signature_time.placeholder' })} />)}
            </FormItem>
            <FormItem {...formItemLayout} label={<FormattedMessage id="form.client.label" />}>
              {getFieldDecorator('client', {
                rules: [
                  {
                    required: true,
                    message: formatMessage({ id: 'validation.client.required' }),
                  },
                ],
              })(
                <TextArea
                  style={{ minHeight: 32 }}
                  placeholder={formatMessage({ id: 'form.client.placeholder' })}
                  rows={8}
                />
              )}
            </FormItem>

            <FormItem {...formItemLayout} label={<FormattedMessage id="form.client_signature.label" />}>
              {getFieldDecorator('client_signature', {
                rules: [
                  {
                    required: true,
                    message: formatMessage({ id: 'validation.client_signature.required' }),
                  },
                ],
              })(<Input placeholder={formatMessage({ id: 'form.client_signature.placeholder' })} />)}
            </FormItem>
            <FormItem {...formItemLayout} label={<FormattedMessage id="form.client_signature_time.label" />}>
              {getFieldDecorator('client_signature_time', {
                rules: [
                  {
                    required: true,
                    message: formatMessage({ id: 'validation.client_signature_time.required' }),
                  },
                ],
              })(<Input placeholder={formatMessage({ id: 'form.client_signature_time.placeholder' })} />)}
            </FormItem>

            <FormItem {...submitFormLayout} style={{ marginTop: 32 }}>
              <Button type="primary" htmlType="submit" loading={submitting}>
                <FormattedMessage id="basic-form.form.submit" />
              </Button>
              <Button style={{ marginLeft: 8 }}>
                <FormattedMessage id="basic-form.form.save" />
              </Button>
			  <Button style={{ marginLeft: 8}}
			  type="danger">
				<FormattedMessage id="basic-form.form.delete" />
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
