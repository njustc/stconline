import { Table, Divider, Tag ,Breadcrumb, Button, Modal} from 'antd';
import Link from 'umi/link'
import React from "react";
import {connect} from "dva";

const data=[];
const columns = [
  {
    title: '方案ID',
    dataIndex: 'pid',
    key: 'pid',
    render: text => <a href="javascript:;">{text}</a>,
  },
  {
    title: '受托方',
    dataIndex: 'assignee',
    key: 'assignee',
  },
  {
    title: '状态',
    key: 'processState',
    dataIndex: 'processState',
    render: processState => {
      var color = processState === 'Approve' ? 'purple' : 'green';
      if (processState === 'ToReview') {
        color = 'orange';
      }
      if (processState === 'ToSubmit') {
        color = 'blue';
      }
      return (
        <Tag color={color} key={processState}>
          {processState}
        </Tag>
      );
    }
  },
  {
    title: '操作',
    key: 'action',
    render: (key) => (
      <span>
        {key.processState == 'Submit' ? <Link to={{pathname: './contract_detail', query: {pid: key.pid}}}>查看详情</Link> :
          <Link to={{pathname: './contract_detail', query: {pid: key.pid}}}>查看详情</Link>}
        <Divider type="vertical"/>
        {/*<a href="/plan_edit.html">编辑</a>*/}
        {<Link to={{pathname: '../../contract_edit', query: {pid: key.pid}}}>编辑</Link>}
        <Divider type="vertical"/>
          <span style={{color: 'red', cursor: 'pointer'}}>删除</span>
      </span>
    ),
  },
];

// const data = [
//   {
//     key: '1',
//     contract_name: '小猪佩奇测试',
//     client: "林黛玉",
//     tags: ['待提交'],
//   },
//   {
//     key: '2',
//     contract_name: '小猪乔治测试',
//     client: 123,
//     tags: ['待审核'],
//   },
//   {
//     key: '3',
//     contract_name: '小羊苏西测试',
//     client: '李逵',
//     tags: ['待确认'],
//   },
//   {
//     key: '4',
//     contract_name: '飞天小女警测试',
//     client: '吕布',
//     tags: ['已确认'],
//   },
// ];

const namespace='contractList';
const mapStateToProps = (state) => {
  const dataList = state[namespace].data;
  //console.log(dataList);
  return {
    dataList,
  };
};
const mapDispatchToProps = (dispatch) => {
  return {
    //页面在mount完后发送一个queryInitPlans的action，被effects处理
    onDidMount: () => {
      dispatch({
        type: `${namespace}/queryInitContracts`,
      });
    },
    queryDeleteCon:(params) =>{
      dispatch({
        type:`${namespace}/queryDeleteCon`,
        payload:params
      })
    },
  };
};

const confirm = Modal.confirm;

@connect(mapStateToProps,mapDispatchToProps)
class List extends React.Component{
  componentDidMount() {
    this.props.onDidMount();
  };

  columns = [
    {
      title: '方案ID',
      dataIndex: 'pid',
      key: 'pid',
      render: text => <a href="javascript:;">{text}</a>,
    },
    {
      title: '受托方',
      dataIndex: 'assignee',
      key: 'assignee',
    },
    {
      title: '状态',
      key: 'processState',
      dataIndex: 'processState',
      render: processState => {
        var color = processState === 'Approve' ? 'purple' : 'green';
        if (processState === 'ToReview') {
          color = 'orange';
        }
        if (processState === 'ToSubmit') {
          color = 'blue';
        }
        return (
          <Tag color={color} key={processState}>
            {processState}
          </Tag>
        );
      }
    },
    {
      title: '操作',
      key: 'action',
      render: (key) => (
        <span>
          {key.processState == 'Submit' ? <Link to={{pathname: './contract_detail', query: {pid: key.pid}}}>查看详情</Link> :
            <Link to={{pathname: './contract_detail', query: {pid: key.pid}}}>查看详情</Link>}
          <Divider type="vertical"/>
          {/*<a href="/plan_edit.html">编辑</a>*/}
          {<Link to={{pathname: '../../contract_edit', query: {pid: key.pid}}}>编辑</Link>}
          <Divider type="vertical"/>
            <span style={{color: 'red', cursor: 'pointer'}} onClick={this.showDeleteConfirm.bind(this,key)}>删除</span>
        </span>
      ),
    },
  ];

  showDeleteConfirm(key) {
    var that = this;
    confirm({
      title: '您是否需要删除本合同?',
      content: `合同ID： ${key.pid}   受托方: ${key.assignee}`,
      okText: '确认删除',
      okType: 'danger',
      concelText: '取消',
      onOK() {
        that.props.queryDeleteCon({pid: key.pid});
        console.log("到这里啦");
      },
      conCancel() {
        console.log('Cancel');
      },
    });
  };
  

  render(){
		return(
		<div>
		<Breadcrumb>
			<Breadcrumb.Item href="/welcome.html">主页</Breadcrumb.Item>
			<Breadcrumb.Item>合同列表</Breadcrumb.Item>
		</Breadcrumb>
		<br />
		<Table columns={columns} dataSource={(!this.props.dataList.length)?data:this.props.dataList} />
		{/*<Table columns={this.columns} dataSource={this.props.dataList} />*/}
		<Button a href="contract_edit.html">新建</Button>
		</div>
		);
	}
}

export default List;
