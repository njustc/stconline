import React, {Component} from 'react';
import {Table, Select, Input, Button, Breadcrumb, Divider, Tag, Menu, Modal} from 'antd';

const Search = Input.Search;

import {connect} from 'dva';
import Link from 'umi/link'
const data = [];
import {getRole} from "../../../utils/cookieUtils";
const confirm = Modal.confirm;

const namespace = 'test-report';
const mapStateToProps = (state) => {
  const listdata = state[namespace];
  return {
    listdata,
  };
};
const mapDispatchToProps = (dispatch) => {
  return {
    onDidMount: () => {
      dispatch({
        type: `${namespace}/GetAlltestReport`,
      })
    },
    DeleteTestReport: (params) => {
      dispatch({
        type: `${namespace}/DeleteTestReport`,
        payload: params
      })
    }
  }
}

@connect(mapStateToProps, mapDispatchToProps)
export default class ReportList extends Component {
  componentDidMount() {
    this.props.onDidMount();
  }
  
 //不同用户显示不同页面
 userLinkMaper={
  "TS":(key) => (
  <span>
  
  {<Link to={{pathname: './report-detail', query: {pid: key.pid}}}>查看项目详情</Link>}
  <Divider type="vertical"/>
  {<Link to={{pathname: '../../report-edit', query: {pid: key.pid}}}>编辑</Link>}
  <Divider type="vertical"/>
  <span style={{color: 'red', cursor: 'pointer'}} onClick={this.showDeleteConfirm.bind(this, key)}>删除</span>
</span>
  ),

  "CUS":(key) => (
    <span>
  {<Link to={{pathname: './report-detail', query: {pid: key.pid}}}>查看项目详情</Link> }
  <Divider type="vertical"/>
  <span style={{color: 'red', cursor: 'pointer'}} onClick={this.showDeleteConfirm.bind(this, key)}>删除</span>
  <Divider type="vertical"/>
</span>
  ),

  "QM":(key) => (
    <span>
  {<Link to={{pathname: './report-detail', query: {pid: key.pid}}}>查看项目详情</Link> }
  <Divider type="vertical"/>
 
  <Divider type="vertical"/>
</span>
  ),
  
  "TM":(key) => (
    <span>
  {<Link to={{pathname: './report-detail', query: {pid: key.pid}}}>查看项目详情</Link> }
  <Divider type="vertical"/>
 
  <Divider type="vertical"/>
</span>
  )


}








  columns = [
    {
      title: '测试报告ID',
      dataIndex: 'pid',
      key: 'pid',
      render: text => <a href="javascript:;">{text}</a>,
    },


    {
      title: '状态',
      key: 'processState',
      dataIndex: 'processState',
      render: processState => {
        var color = processState === 'Review' ? 'geekblue' : 'green'
        if (processState === 'Submit') {
          color = 'grey'
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
      render: this.link()
      // (key) => (
      // //   <span>
      // //     {<Link to = {{pathname: './report-detail', query: {pid: key.pid}}}>查看测试报告详情</Link>}
      // //     <Divider type="vertical"/>
      // //     {<Link to = {{pathname: '../../report-edit', query: {pid: key.pid}}}>编辑</Link>}
      // //     <Divider type="vertical"/>
      // //     <span style = {{color: 'red', cursor: 'pointer'}} onClick = {this.showDeleteConfirm.bind(this, key)}>删除</span>
      // //   </span>
      // // ),
    },
  ]

  link(){
    return this.userLinkMaper[getRole()[0]]
  }



  showDeleteConfirm(key) {
    var that = this
    confirm({
      title: '您是否要删除本测试报告?',
      content: `测试报告ID:${key.pid}`,
      okText: '确认删除',
      okType: 'danger',
      cancelText: '取消',
      onOk() {
        that.props.DeleteTestReport({pid: key.pid})
      },
      onCancel() {
        console.log('Cancel');
      },
    });
  }

  render() {
    return (
      <div>
        <Breadcrumb>
          <Breadcrumb.Item hr="/report-list.html">测试报告列表</Breadcrumb.Item>
        </Breadcrumb>
        {/* <div class="" */}
        <Table style={{marginTop: 50}} columns={this.columns} dataSource={(!this.props.listdata.data.length)?data:this.props.listdata.data}/>
        <Button
          style={{marginLeft: 400}}
          type="primary"
          href="/report-edit.html">
          新建测试报告
        </Button>
      </div>
    );
  }
}
