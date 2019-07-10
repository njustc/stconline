import React from 'react';
import {Card, Steps, Collapse, Row, Col, Divider, Avatar, Tag, Table} from 'antd'
import 'antd/dist/antd.css'
import {getRole} from "../../utils/cookieUtils";
import {connect} from 'dva';

const { Step } = Steps;
const { Panel } = Collapse;
const namespace = 'staff_first';

function callback(key) {
  console.log(key);
}

const mapStateToProps = (state) => {
  const listdata = state[namespace];
  return {
    listdata,
  };
};
const mapDispatchToProps = (dispatch,state) => {
  return {
    onDidMount: () => {
      dispatch({
        type: `${namespace}/InitWorkplace`,
        payload: getRole()[0],
      })
    },
  }
};
const data = [];

let pro = 0;

@connect(mapStateToProps, mapDispatchToProps)
export default class Sworkplace extends React.Component{
  componentDidMount() {
    this.props.onDidMount();
  }

  //列表
  entrustColumns = [
    {
      title: '项目编号',
      dataIndex: 'pid',
      key: 'pid',
      render: text => <a href="javascript:">{text}</a>,
    },
    {
      title: '软件名称',
      dataIndex: 'softwareName',
      key: 'softwareName',
      render: text => <a href="javascript:">{text}</a>,
    },
    {
      title: '委托单位',
      dataIndex: 'companyCh',
      key: 'companyCh',
      render: text => <a href="javascript:">{text}</a>,
    },
    {
      title: '状态',
      key: 'processState',
      dataIndex: 'processState',
      render: processState => {
        var color = processState === 'Review' ? 'geekblue' : 'green'
        if (processState==='Submit'){
          // color='volcano'
          color='gold'
        }
        var content = processState ==='Review'?"待审核":"已通过"
        if (processState==='Submit'){
          content='待提交'
        }
        return (
          <Tag color={color} key={processState}>
            {content}
          </Tag>
        );
      }
    },
    // {
    //   title: '操作',
    //   key: 'action',
    //   render: this.link()
    // },
  ]
  contractColumns = [
    {
      title: '项目编号',
      dataIndex: 'pid',
      key: 'pid',
      render: text => <a href="javascript:;">{text}</a>,
    },
    {
      title: '软件名称',
      dataIndex: 'softwareName',
      key: 'softwareName',
    },
    {
      title: '委托方',
      dataIndex: 'client',
      key: 'client',
    },
    {
      title: '状态',
      key: 'processState',
      dataIndex: 'processState',
      render: processState => {
        var color = 'gold';
        var res = "待提交";
        if (processState === 'Review') {
          color = 'geekblue';
          res = "待审核";
        }
        if (processState === 'Approve') {
          color = 'green';
          res = "已通过";
        }
        return (
          //console.log(processState);
          <Tag color={color} key={processState}>
            {res}
          </Tag>
        );
      }
    },
    // {
    //   title: '操作',
    //   key: 'action',
    //   render: this.link()
    // },
  ];
  planColumns = [
    {
      title: '项目编号',
      dataIndex: 'pid',
      key: 'pid',
      render: text => <a href="javascript:;">{text}</a>,
    },
    {
      title: '编辑人员',
      dataIndex: 'author',
      key: 'author',
    },
    {
      title: '状态',
      key: 'processState',
      dataIndex: 'processState',
      render: processState => {
        var content = processState === 'Review' ? '待审核' : '已通过';
        var color = processState === 'Review' ? 'geekblue' : 'green';
        if (processState === 'Submit') {
          color = 'gold';
          content = '待提交';
        }
        return (
          <Tag color={color} key={processState}>
            {content}
          </Tag>
        );
      }
    },
    // {
    //   title: '操作',
    //   key: 'action',
    //   render: this.link()
    // },
  ];
  reportColumns = [
    {
      title: '测试报告ID',
      dataIndex: 'pid',
      key: 'pid',
      render: text => <a href="javascript:;">{text}</a>,
    },

    //softwareName
    {
      title: '软件名称',
      dataIndex: 'softwareName',
      key: 'softwareName',
      render: text => <a href="javascript:;">{text}</a>,
    },
    //clientCompany
    {
      title: '委托单位',
      dataIndex: 'clientCompany',
      key: 'clientCompany',
      render: text => <a href="javascript:;">{text}</a>,
    },

    {
      title: '状态',
      key: 'processState',
      dataIndex: 'processState',
      render: processState => {
        var color = processState === 'Review' ? 'geekblue' : 'green'
        if (processState === 'Submit') {
          color = 'gold'
        }
        var content = processState ==='Review'?"待审核":"已通过"
        if (processState==='Submit'){
          content='待提交'}
        return (
          <Tag color={color} key={processState}>
            {content}
          </Tag>
        );
      }


    },
    // {
    //   title: '操作',
    //   key: 'action',
    //   render: this.link()
    // },
  ];

  render(){
    return (
      <div>
        <Card title="工作台">
          <Row>
            <Col span={3}>
              <Avatar
                size={64}
                src='https://gw.alipayobjects.com/zos/rmsportal/BiazfanxmamNRoxxVxka.png'
              />
            </Col>
            <Col span={12}>
              <div>你好，{getRole()[0]}，祝你度过开心的一天！</div>
            </Col>
            <Col span={4}>
              <h1>南京大学计算机系</h1>
            </Col>
            <Avatar size = 'large' src="https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1562667040758&di=aa96df6f6968abfb82e47917abc12ec3&imgtype=0&src=http%3A%2F%2Fmmbiz.qpic.cn%2Fmmbiz_png%2Fj9L86C5IO6ibciaA50hmu7NVUdVkSsyZ3TsEUdhpjarWw4CIxu2O25tYdxQkru5mcu8ibVGsPwTmodFOhCbFSRS2g%2F640%3Fwx_fmt%3Dpng" />
          </Row>
        </Card>
        <br />
        <br />

        {
          {
            "TS":
              <Card
                title="待办事项"
                bordered={false}
              >

                <Collapse onChange={callback}>

                  <Panel header={(!(this.props.listdata.planData.length)) ? "无待办方案" : "待办方案"}
                         disabled={(!this.props.listdata.planData.length)}>
                    <Table columns={this.planColumns}
                           dataSource={(!this.props.listdata.planData.length) ? data : this.props.listdata.planData}/>
                  </Panel>
                  <Panel header={(!(this.props.listdata.reportData.length)) ? "无待办报告" : "待办报告"}
                         disabled={(!this.props.listdata.reportData.length)}>
                    <Table columns={this.reportColumns}
                           dataSource={(!this.props.listdata.reportData.length) ? data : this.props.listdata.reportData}/>
                  </Panel>


                </Collapse>
              </Card>
            ,
            "TM":
              <Card
                title="待办事项"
                bordered={false}
              >

                <Collapse onChange={callback}>

                  <Panel header={(!(this.props.listdata.planData.length)) ? "无待办方案" : "待办方案"}
                         disabled={(!this.props.listdata.planData.length)}>
                    <Table columns={this.planColumns}
                           dataSource={(!this.props.listdata.planData.length) ? data : this.props.listdata.planData}/>
                  </Panel>
                  <Panel header={(!(this.props.listdata.reportData.length)) ? "无待办报告" : "待办报告"}
                         disabled={(!this.props.listdata.reportData.length)}>
                    <Table columns={this.reportColumns}
                           dataSource={(!this.props.listdata.reportData.length) ? data : this.props.listdata.reportData}/>
                  </Panel>


                </Collapse>
              </Card>
            ,
            "SS":
              <Card
              title="待办事项"
              bordered={false}
            >

              <Collapse onChange={callback}>
                <Panel header={(!(this.props.listdata.entrustData.length)) ? "无待办委托" : "待办委托"}
                       disabled={(!this.props.listdata.entrustData.length)}>
                  <Table columns={this.entrustColumns}
                         dataSource={(!this.props.listdata.entrustData.length) ? data : this.props.listdata.entrustData}/>
                </Panel>
                <Panel header={(!(this.props.listdata.contractData.length)) ? "无待办合同" : "待办合同"}
                       disabled={(!this.props.listdata.contractData.length)}>
                  <Table columns={this.contractColumns}
                         dataSource={(!this.props.listdata.contractData.length) ? data : this.props.listdata.contractData}/>
                </Panel>
              </Collapse>
            </Card>
            ,
            "SM":
              <Card
                title="待办事项"
                bordered={false}
              >
                <Collapse onChange={callback}>
                  <Panel header={(!(this.props.listdata.contractData.length)) ? "无待办合同" : "待办合同"}
                         disabled={(!this.props.listdata.contractData.length)}>
                    <Table columns={this.contractColumns}
                           dataSource={(!this.props.listdata.contractData.length) ? data : this.props.listdata.contractData}/>
                  </Panel>
                </Collapse>
              </Card>
            ,
            "QM":
              <Card
                title="待办事项"
                bordered={false}
              >

                <Collapse onChange={callback}>
                  <Panel header={(!(this.props.listdata.contractData.length)) ? "无待办合同" : "待办合同"}
                         disabled={(!this.props.listdata.contractData.length)}>
                    <Table columns={this.contractColumns}
                           dataSource={(!this.props.listdata.contractData.length) ? data : this.props.listdata.contractData}/>
                  </Panel>
                  <Panel header={(!(this.props.listdata.planData.length)) ? "无待办方案" : "待办方案"}
                         disabled={(!this.props.listdata.planData.length)}>
                    <Table columns={this.planColumns}
                           dataSource={(!this.props.listdata.planData.length) ? data : this.props.listdata.planData}/>
                  </Panel>
                  <Panel header={(!(this.props.listdata.reportData.length)) ? "无待办报告" : "待办报告"}
                         disabled={(!this.props.listdata.reportData.length)}>
                    <Table columns={this.reportColumns}
                           dataSource={(!this.props.listdata.reportData.length) ? data : this.props.listdata.reportData}/>
                  </Panel>


                </Collapse>
              </Card>
            ,
          }[getRole()[0]]
        }
      </div>
    )
  }
};
