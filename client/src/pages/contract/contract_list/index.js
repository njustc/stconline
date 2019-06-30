import { Table, Divider, Tag ,Breadcrumb, Button} from 'antd';
import Link from 'umi/link'
import React from "react";

const columns = [
  {
    title: '合同名称',
    dataIndex: 'contract_name',
    key: 'name',
    render: text => <a href="javascript:;">{text}</a>,
  },
  {
    title: '委托人',
    dataIndex: 'client',
    key: 'age',
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

const data = [
  {
    key: '1',
    contract_name: '小猪佩奇测试',
    client: "林黛玉",
    tags: ['待提交'],
  },
  {
    key: '2',
    contract_name: '小猪乔治测试',
    client: 123,
    tags: ['待审核'],
  },
  {
    key: '3',
    contract_name: '小羊苏西测试',
    client: '李逵',
    tags: ['待确认'],
  },
  {
    key: '4',
    contract_name: '飞天小女警测试',
    client: '吕布',
    tags: ['已确认'],
  },
];

class List extends React.Component{
	render(){
		return(
		<div>
		<Breadcrumb>
			<Breadcrumb.Item href="/welcome.html">主页</Breadcrumb.Item>
			<Breadcrumb.Item>合同列表</Breadcrumb.Item>
		</Breadcrumb>
		<br />
		<Table columns={columns} dataSource={data} />
		<Button a href="contract_edit.html">新建</Button>
		</div>
		);
	}
}

export default List;
