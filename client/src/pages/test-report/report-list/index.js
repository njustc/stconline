import {Table, Divider, Button, Tag, Breadcrumb, Modal} from 'antd';
import React, {Component} from "react";
import {connect} from "dva";
const confirm = Modal.confirm;
import Link from 'umi/link'


const columns = [
  {
    title: '测试报告',
    dataIndex: 'testreport_name',
    key: 'name',
    render: text => <a href="javascript:;">{text}</a>,
  },
  {
    title: '状态',
    key: 'tags',
    dataIndex: 'tags',
    render: tags => (
      <span>
        {tags.map(tag => {
          let color = 'green';
          if (tag === '待审核') {
            color = 'volcano';
          }
		  else if(tag === '待确认'){
			  color = 'geekblue';
		  }
          return (
            <Tag color={color} key={tag}>
              {tag.toUpperCase()}
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
        {key.processState == 'Submit' ? <Link to={{pathname: './contract_detail', query: {pid: 'kkk'}}}>查看详情</Link> :
          <Link to={{pathname: './contract_detail', query: {pid: 'kkk'}}}>查看详情</Link>}
        <Divider type="vertical"/>
        {/*<a href="/plan_edit.html">编辑</a>*/}
        {<Link to={{pathname: '../../contract_edit', query: {pid: key.pid}}}>编辑</Link>}
        <Divider type="vertical"/>
          <span style={{color: 'red', cursor: 'pointer'}}>删除</span>
      </span>
    ),
  },
];

const data = [
  {
    key: '1',
    testreport_name: '测试报告1',
    client: "123",
    tags: ['待审核'],
  },
  {
    key: '2',
    testreport_name: '测试报告2',
    client: 123,
    tags: ['待审核'],
  },

];

class List extends React.Component{
	render(){
		return(
		<div>
		<Breadcrumb>
			<Breadcrumb.Item href="/welcome.html">主页</Breadcrumb.Item>
			<Breadcrumb.Item>测试报告列表</Breadcrumb.Item>
		</Breadcrumb>
		<br />
		<Table columns={columns} dataSource={data} />
		<Button a href="/report_edit.html">新建</Button>
		</div>
		);
	}
}

export default List;


