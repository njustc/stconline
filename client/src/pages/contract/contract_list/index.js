import { Table, Divider, Tag ,Breadcrumb, Button, Modal} from 'antd';
import Link from 'umi/link'
import React from "react";
import {connect} from "dva";
import {getRole} from "../../../utils/cookieUtils";
//import {getRole} from "src/utils/cookieUtils"

const data=[];
var loading=true;
const namespace='contractList';
const mapStateToProps = (state) => {
  const dataList = state[namespace].data;
  //console.log("=============");
  //console.log(dataList);
  loading=false;
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

  userMap={
    "SS":(key)=>(
        <span>
           <Divider type="vertical"/>
           {key.processState == 'Submit' ?   <Link to={{pathname: './contract_edit', query: {pid: key.pid}}}>编辑</Link> : ""}
          <Divider type="vertical"/>     
          {/*<a href="/plan_edit.html">编辑</a>*/}
          <Link to={{pathname: './contract_check', query: {pid: key.pid}}}>查看详情</Link>
          <Divider type="vertical"/>
          {/* <Divider type="vertical"/>
          <span style={{color: 'red', cursor: 'pointer'}} onClick={this.showDeleteConfirm.bind(this,key)}>废止</span> */}
        </span>
    ),
    "CUS":(key)=>(
      <span>
        <Divider type="vertical"/>
        <Link to={{pathname: './contract_check',query: {pid: key.pid}}}>查看详情</Link>
        <Divider type="vertical"/>
        {key.processState == 'Review' ? <span style={{color: 'red', cursor: 'pointer'}} onClick={this.showDeleteConfirm.bind(this,key)}>废止</span> : ""}
        <Divider type="vertical"/>
      </span>
    ),
    "SM":(key)=>(
      <span>
        <Divider type="vertical"/>
        <Link to={{pathname: './contract_check',query: {pid:key.pid}}}>查看详情</Link>
        <Divider type="vertical"/>
        {key.processState == 'Review' ? <span style={{color: 'red', cursor: 'pointer'}} onClick={this.showDeleteConfirm.bind(this,key)}>废止</span> : ""}
        <Divider type="vertical"/>
      </span>
    ),
    "QM":(key)=>(
      <span>
        <Divider type="vertical"/>
        <Link to={{pathname: './contract_check',query: {pid:key.pid}}}>查看详情</Link>
        <Divider type="vertical"/>
        {key.processState == 'Review' ? <span style={{color: 'red', cursor: 'pointer'}} onClick={this.showDeleteConfirm.bind(this,key)}>废止</span> : ""}
        <Divider type="vertical"/>
      </span>
    )
  }

  columns = [
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
    {
      title: '操作',
      key: 'action',
      render: this.link()
      // (key) => (
      //   <span>
      //     {key.processState == 'Submit' ? <Link to={{pathname: './contract_detail', query: {pid: key.pid}}}>查看详情</Link> :
      //       <Link to={{pathname: './contract_detail', query: {pid: key.pid}}}>查看详情</Link>}
      //     <Divider type="vertical"/>
      //     {/*<a href="/plan_edit.html">编辑</a>*/}
      //     {<Link to={{pathname: '../../contract_edit', query: {pid: key.pid}}}>编辑</Link>}
      //     <Divider type="vertical"/>
      //     <span style={{color: 'red', cursor: 'pointer'}} onClick={this.showDeleteConfirm.bind(this,key)}>删除</span>
      //   </span>
      // ),
    },
  ];

  link(){
    return this.userMap[getRole()[0]]
  }

  showDeleteConfirm(key) {
    var that = this;
    confirm({
      title: '您是否要废止本合同?',
      content: `
      对应委托会被一同被删除
      合同ID： ${key.pid}   受托方: ${key.assignee}`,
      okText: '确认废止',
      okType: 'danger',
      concelText: '取消',
      onOk() {
        //console.log("AAAAAAAAAAAAA")；
        //console.log('Cancel');
        that.props.queryDeleteCon({pid: key.pid});
        //console.log("到这里啦");
      },
      onCancel() {
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
		<Table columns={this.columns} dataSource={(!this.props.dataList.length)?data:this.props.dataList} loading={loading} />
		{/*<Button href="/contract_new.html">新建</Button>*/}
		</div>
		);
	}
}

export default List;
