import React, { Component } from 'react';
import {Table,Select,Input} from 'antd';
const Search = Input.Search;
import { connect } from 'dva';

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
      </div>
    );
  }
}