import { Card, Table, Divider, Button, Tag ,Breadcrumb} from 'antd';
import React from "react";
import {connect} from "dva";
import { FormattedMessage } from 'umi/locale';


const namespace='testreportCheck';

const mapStateToProps = (state) => {
const dataCheck = state[namespace];
console.log(dataCheck.check);
return {
dataCheck,
};
};

@connect(mapStateToProps)
export default class report_detail extends React.Component{
  componentDidMount() {
    const {dispatch} = this.props;

    dispatch({
      type: `${namespace}/queryOneTestReport`,
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
          <p>软件名称：<FormattedMessage id={this.props.dataCheck.check.softwareName || ' '}/></p>
          <p>版本号：<FormattedMessage id={this.props.dataCheck.check.version || ' '}/></p>
          <p>委托单位：<FormattedMessage id={this.props.dataCheck.check.clientCompany || ' '}/></p>
          <p>测试类别：<FormattedMessage id={this.props.dataCheck.check.testType || ' '}/></p>
          <p>报告日期：<FormattedMessage id={this.props.dataCheck.check.reportDate || ' '}/></p>
          <p>项目编号：<FormattedMessage id={this.props.dataCheck.check.codeId || ' '}/></p>
          <p>样品名称：<FormattedMessage id={this.props.dataCheck.check.sampleName || ' '}/></p>
          <p>采样日期：<FormattedMessage id={this.props.dataCheck.check.sampleDate || ' '}/></p>
          <p>测试日期：<FormattedMessage id={this.props.dataCheck.check.testDate || ' '}/></p>
          <p>样品状态：<FormattedMessage id={this.props.dataCheck.check.sameState || ' '}/></p>
          <p>测试依据：<FormattedMessage id={this.props.dataCheck.check.testBasis || ' '}/></p>
          <p>样品清单：<FormattedMessage id={this.props.dataCheck.check.sampleMenu || ' '}/></p>
          <p>测试结论：<FormattedMessage id={this.props.dataCheck.check.testConclusion || ' '}/></p>
          <p>主测人：<FormattedMessage id={this.props.dataCheck.check.tester || ' '}/></p>
          <p>主测人测试日期：<FormattedMessage id={this.props.dataCheck.check.testerDate || ' '}/></p>
          <p>审核人：<FormattedMessage id={this.props.dataCheck.check.auditor || ' '}/></p>
          <p>批准人：<FormattedMessage id={this.props.dataCheck.check.approver || ' '}/></p>
          <p>批准日期：<FormattedMessage id={this.props.dataCheck.check.approverDate || ' '}/></p>
          <p>委托单位电话：<FormattedMessage id={this.props.dataCheck.check.clientTel || ' '}/></p>
          <p>委托单位传真：<FormattedMessage id={this.props.dataCheck.check.clientFax || ' '}/></p>
          <p>委托单位地址：<FormattedMessage id={this.props.dataCheck.check.clientAddr || ' '}/></p>


        </Card>
      </div>

    )
  }

};






