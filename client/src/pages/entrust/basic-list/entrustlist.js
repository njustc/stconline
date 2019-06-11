import React, { Component } from 'react';
import {Table,Select,Input,Button ,Breadcrumb,Divider, Tag,Menu,Modal} from 'antd';
const Search = Input.Search;
import { connect } from 'dva';
import Link from 'umi/link'
const confirm = Modal.confirm;
const namespace = 'entrustlist';

const mapStateToProps = (state) => {
  const listdata = state[namespace];
  return {
    listdata,
  };
};
const mapDispatchToProps=(dispatch)=>{
  return {
    onDidMount:()=>{
      dispatch({
        type:`${namespace}/GetAllEntrust`,
      })
    },
    DeleteEntrust:(params)=>{
      dispatch({
        type:`${namespace}/DeleteEntrust`,
        payload:params
      })
    }
  }
}
@connect(mapStateToProps,mapDispatchToProps)
export default class EntrustList extends Component {
  componentDidMount() {
    this.props.onDidMount();
  }

  columns =[
    {
      title: '委托ID',
      dataIndex: 'id',
      key: 'id',
      render: text => <a href="javascript:;">{text}</a>,
    },
    {
      title: '用户名',
      dataIndex: 'name',
      key: 'name',
    },
    {
      title: '委托建立时间',
      dataIndex: 'address',
      key: 'address',
    },
  
    {
      title: '状态',
      key: 'tags',
      dataIndex: 'tags',
      render: tags => (
        <span>
          {tags.map(tag => {
            let color = tag==='委托待审核' ? 'geekblue' : 'green';
            if (tag === '委托审核未通过') {
              color = 'volcano';
            }
            return (
              <Tag color={color} key={tag}>
                {tag}
              </Tag>
            );
          })}
        </span>
      ),
    },
    {
      title: '操作',
      key: 'action',
      render: (key) => (
        <span>
          <Link to={{pathname:'./basic-check.html',query:key}}>查看项目详情</Link>
          <Divider type="vertical" />
          <Link to={{pathname:'../../basic-form.html',query:key}}>编辑</Link>
          <Divider type="vertical" />
          <span style={{color:'red', cursor:'pointer'}} onClick={this.showDeleteConfirm.bind(this, key)} >删除</span >
        </span>
      ),
    },
  ]

  showDeleteConfirm(key) {
    console.log(key.key)
    var that=this
    confirm({
      title: 'Are you sure delete this task?',
      content: `委托ID:${key.id} 用户名：${key.name}`,
      // content: `委托ID:`,
      okText: 'Yes',
      okType: 'danger',
      cancelText: 'No',
      onOk() {
        that.props.DeleteEntrust({pid:key.key})
        
        // console.log('OK');
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
		<Breadcrumb.Item hr ="/basic-list">委托列表</Breadcrumb.Item>
	  </Breadcrumb>
        <Select
          style={{ width: 200  }}
          defaultValue="1"
        >
          <Option value="1">按委托ID</Option>
          <Option value="2">按委托状态</Option>
        </Select>
        <Search
            style={{marginLeft:100,width: 200 }}
        />
        <Table  style={{marginTop:50 }} columns={this.columns} dataSource={this.props.listdata.data} />
		<Button
		style={{ marginLeft: 400 }}
		type="primary"
		href="/basic-form.html">
		新建委托
		</Button>
      </div>
    );
  }
}