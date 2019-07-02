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
          <p>批准人：<FormattedMessage id={this.props.dataCheck.check.approver || ' '}/></p>
          <p>批准日期：<FormattedMessage id={this.props.dataCheck.check.approverDate || ' '}/></p>

        </Card>
      </div>

    )
  }

};






