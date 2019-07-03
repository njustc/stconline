import { Card, Table, Divider, Button, Tag ,Breadcrumb} from 'antd';
import React from "react";
import {connect} from "dva";
import { FormattedMessage } from 'umi/locale';


const namespace = 'report-detail';

const mapStateToProps = (state) => {
  const reportdata = state[namespace];
  console.log(reportdata.data);
  return {
    reportdata,
  };
};

@connect(mapStateToProps)
export default class report_detail extends React.Component{
  componentDidMount() {
    const {dispatch} = this.props;
    console.log(this.props.location.query)
    dispatch({
      type: `${namespace}/GetOneTestReport`,
      payload: this.props.location.query,
    });
  }

  render(){
    return (
      <div>
        <Breadcrumb>
          <Breadcrumb.Item href="/welcome.html">主页</Breadcrumb.Item>
          <Breadcrumb.Item>测试方案详情</Breadcrumb.Item>
        </Breadcrumb>

        <Card>
          <h2>软件委托测试报告</h2>
          <p>软件名称：<FormattedMessage id={this.props.reportdata.data.softwareName || ' '}/></p>
          <p>版本号：<FormattedMessage id={this.props.reportdata.data.version || ' '}/></p>
          <p>委托单位：<FormattedMessage id={this.props.reportdata.data.clientCompany || ' '}/></p>
          <p>测试类别：<FormattedMessage id={this.props.reportdata.data.testType || ' '}/></p>
          <p>报告日期：<FormattedMessage id={this.props.reportdata.data.reportDate || ' '}/></p>
          <p>项目编号：<FormattedMessage id={this.props.reportdata.data.codeId || ' '}/></p>
          <p>样品名称：<FormattedMessage id={this.props.reportdata.data.sampleName || ' '}/></p>
          <p>采样日期：<FormattedMessage id={this.props.reportdata.data.sampleDate || ' '}/></p>
          <p>测试日期：<FormattedMessage id={this.props.reportdata.data.testDate || ' '}/></p>
          <p>样品状态：<FormattedMessage id={this.props.reportdata.data.sameState || ' '}/></p>
          <p>测试依据：<FormattedMessage id={this.props.reportdata.data.testBasis || ' '}/></p>
          <p>样品清单：<FormattedMessage id={this.props.reportdata.data.sampleMenu || ' '}/></p>
          <p>测试结论：<FormattedMessage id={this.props.reportdata.data.testConclusion || ' '}/></p>
          <p>主测人：<FormattedMessage id={this.props.reportdata.data.tester || ' '}/></p>
          <p>主测人测试日期：<FormattedMessage id={this.props.reportdata.data.testerDate || ' '}/></p>
          <p>审核人：<FormattedMessage id={this.props.reportdata.data.auditor || ' '}/></p>
          <p>批准人：<FormattedMessage id={this.props.reportdata.data.approver || ' '}/></p>
          <p>批准日期：<FormattedMessage id={this.props.reportdata.data.approverDate || ' '}/></p>
          <p>委托单位电话：<FormattedMessage id={this.props.reportdata.data.clientTel || ' '}/></p>
          <p>委托单位传真：<FormattedMessage id={this.props.reportdata.data.clientFax || ' '}/></p>
          <p>委托单位地址：<FormattedMessage id={this.props.reportdata.data.clientAddr || ' '}/></p>
          <p>测试执行记录：<FormattedMessage id={this.props.reportdata.data.testExeRecord || ' '}/></p>
          <p>流程ID：<FormattedMessage id={this.props.reportdata.data.processInstanceId || ' '}/></p>
          <p>流程状态：<FormattedMessage id={this.props.reportdata.data.processState || ' '}/></p>
        </Card>
      </div>
    )
  }

};






