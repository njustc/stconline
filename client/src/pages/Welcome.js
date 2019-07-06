import React from 'react';
import {Card} from "antd";

/**
 * 主页内容
 * */
export default class Welcome extends React.Component {
  state = {
    role: ''  //角色信息
  };

  constructor(props) {
    super(props)
  }

  render() {
    const cards = (props) => {
      const gidStyle = {
        width: '50%'
      };
      return (
        <Card title="南京大学测试中心在线业务系统">
          <Card.Grid style={gidStyle}>委托</Card.Grid>
          <Card.Grid style={gidStyle}>合同</Card.Grid>
          <Card.Grid style={gidStyle}>测试方案</Card.Grid>
          <Card.Grid style={gidStyle}>测试报告</Card.Grid>
          <Card.Grid style={gidStyle}>测试用例</Card.Grid>
        </Card>
      )
    };

    return (
      <div>
        {cards(this.props)}
      </div>
    )
  }
};
