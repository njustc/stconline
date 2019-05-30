import React, { Component } from 'react';
import {Table,Select,Input,Button ,Breadcrumb} from 'antd';
const Search = Input.Search;
import { connect } from 'dva';
import Link from 'umi/link'

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
        type:`${namespace}/getAllEntrust`,
      })
    }
  }
}
@connect(mapStateToProps,mapDispatchToProps)
export default class EntrustList extends Component {
  componentDidMount() {
    this.props.onDidMount();
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
        <Table  style={{marginTop:50 }} columns={this.props.listdata.columns} dataSource={this.props.listdata.data} />
		<Button
		style={{ marginLeft: 400 }}
		type="primary"
		href="/basic-form">
		新建委托
		</Button>
      </div>
    );
  }
}