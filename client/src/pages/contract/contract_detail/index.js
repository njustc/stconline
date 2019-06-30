import {Card ,Breadcrumb ,Button} from 'antd';
import React from "react";
import {connect} from "dva";
import { FormattedMessage } from 'umi/locale';

const namespace='contractDetail';

const mapStateToProps = (state) => {
  const dataCheck = state[namespace];
  console.log(dataCheck);
  return {
    dataCheck,
  };
};

@connect(mapStateToProps)
export default class Detail extends React.Component{
  componentDidMount() {
    const {dispatch} = this.props;
    //console.log('aaa');
    dispatch({
      type: `${namespace}/queryGetOneContract`,
      payload: this.props.location.query,
    });
  }
  render() {
    return (
      <div>
        <Breadcrumb>
          <Breadcrumb.Item href="/welcome.html">主页</Breadcrumb.Item>
          <Breadcrumb.Item>合同详情</Breadcrumb.Item>
        </Breadcrumb>
        <Card>
          <h2>软件委托测试合同</h2>
        </Card>
        <Card>
          <p>项目名称：小猪佩奇测试</p>
          <p>委托方（甲方）：<FormattedMessage id={this.props.dataCheck.client || ' '}/></p>
          {/*<p>受托方（乙方）: <FormattedMessage id={this.props.dataCheck.check.assignee || ' '}/></p>*/}
          {/*<p>签订地点：<FormattedMessage id={this.props.dataCheck.check.signPlace || ' '}/></p>*/}
          {/*<p>签订日期：<FormattedMessage id={this.props.dataCheck.check.signDate || ' '}/></p>*/}
          {/*<p>质量特性：<FormattedMessage id={this.props.dataCheck.check.quality || ' '}/></p>*/}
          {/*<p>合同价款：<FormattedMessage id={this.props.dataCheck.check.price || ' '}/></p>*/}
          {/*<p>履行期限：<FormattedMessage id={this.props.dataCheck.check.finishTime || ' '}/></p>*/}
          {/*<p>委托方--单位全称：<FormattedMessage id={this.props.dataCheck.check.clientCompanyName || ' '}/></p>*/}
          {/*<p>委托方--授权代表：<FormattedMessage id={this.props.dataCheck.check.clientAuthRepre || ' '}/></p>*/}
          {/*<p>委托方--签章日期：<FormattedMessage id={this.props.dataCheck.check.clientSignDate || ' '}/></p>*/}
          {/*<p>委托方--联系人：<FormattedMessage id={this.props.dataCheck.check.clientContact || ' '}/></p>*/}
          {/*<p>委托方--通讯地址：<FormattedMessage id={this.props.dataCheck.check.clientAddr || ' '}/></p>*/}
          {/*<p>委托方--电话：<FormattedMessage id={this.props.dataCheck.check.clientTel || ' '}/></p>*/}
          {/*<p>委托方--传真：<FormattedMessage id={this.props.dataCheck.check.clientFax || ' '}/></p>*/}
          {/*<p>委托方--开户银行：<FormattedMessage id={this.props.dataCheck.check.clientBank || ' '}/></p>*/}
          {/*<p>委托方--账号：<FormattedMessage id={this.props.dataCheck.check.clientUserName || ' '}/></p>*/}
          {/*<p>委托方--邮编：<FormattedMessage id={this.props.dataCheck.check.clientPostCode || ' '}/></p>*/}
          {/*<p>受托方--单位全称：<FormattedMessage id={this.props.dataCheck.check.assigneeCompanyName || ' '}/></p>*/}
          {/*<p>受托方--授权代表：<FormattedMessage id={this.props.dataCheck.check.assigneeAuthRepre || ' '}/></p>*/}
          {/*<p>受托方--签章日期：<FormattedMessage id={this.props.dataCheck.check.assigneeSignDate || ' '}/></p>*/}
          {/*<p>受托方--联系人：<FormattedMessage id={this.props.dataCheck.check.assigneeContact || ' '}/></p>*/}
          {/*<p>受托方--通讯地址：<FormattedMessage id={this.props.dataCheck.check.assigneeAddr || ' '}/></p>*/}
          {/*<p>受托方--电话：<FormattedMessage id={this.props.dataCheck.check.assigneeTel || ' '}/></p>*/}
          {/*<p>受托方--传真：<FormattedMessage id={this.props.dataCheck.check.assigneeFax || ' '}/></p>*/}
          {/*<p>受托方--开户银行：<FormattedMessage id={this.props.dataCheck.check.assigneeBank || ' '}/></p>*/}
          {/*<p>受托方--账号：<FormattedMessage id={this.props.dataCheck.check.assigneeUserName || ' '}/></p>*/}
          {/*<p>受托方--邮编：<FormattedMessage id={this.props.dataCheck.check.assigneePostCode || ' '}/></p>*/}

        </Card>
        <Card>
          <h1>一、任务表述</h1>
        </Card>
        <Card>
          <h1>二、双方的主要义务</h1>
        </Card>
        <Button>通过</Button>
        <Button>不通过</Button>
      </div>
    )
  }
};
