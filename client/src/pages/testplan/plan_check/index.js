import { Card, Table, Divider, Button, Tag ,Breadcrumb} from 'antd';
import React from "react";
import {connect} from "dva";
import { FormattedMessage } from 'umi/locale';

// const data= {
//   /** 编制人 */
//   author: 'mmm',
//
//   /** 审核人 */
//   auditor: 'kkk',
//
//   /** 批准人 */
//   approver: 'xxx',
//
//   /** 测试环境--硬件 */
//   hardware: 'hard',
//
//   /** 测试环境--软件 */
//   software: 'soft',
//
//   /** 测试环境--人员 */
//   staff: 'eee',
//
//   /** 测试进度表 */
//   progressTable: 'pppppp',
// };

const namespace='testplanCheck';

const mapStateToProps = (state) => {
  const dataCheck = state[namespace];
  //console.log(dataCheck.check);
  return {
    dataCheck,
  };
};

@connect(mapStateToProps)
export default class List extends React.Component{
  componentDidMount() {
    const {dispatch} = this.props;

    dispatch({
      type: `${namespace}/queryGetOnePlan`,
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
          <h2>软件委托测试方案</h2>
          <p>编制人：<FormattedMessage id={this.props.dataCheck.check.author || ' '}/></p>
          <p>审核人：<FormattedMessage id={this.props.dataCheck.check.auditor || ' '}/></p>
          <p>批准人：<FormattedMessage id={this.props.dataCheck.check.approver || ' '}/></p>
          <p>测试环境-硬件：<FormattedMessage id={this.props.dataCheck.check.hardware || ' '}/></p>
          <p>测试环境-软件：<FormattedMessage id={this.props.dataCheck.check.software || ' '}/></p>
          <p>测试环境-人员：<FormattedMessage id={this.props.dataCheck.check.staff || ' '}/></p>
          <p>测试进度表：<FormattedMessage id={this.props.dataCheck.check.progressTable || ' '}/></p>
        </Card>
      </div>

    )
  }

};
