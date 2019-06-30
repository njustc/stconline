import {Table, Divider, Button, Tag, Breadcrumb, Modal} from 'antd';
import React from "react";
import {connect} from "dva";
const confirm = Modal.confirm;
import Link from 'umi/link'

// const data = [
//   {
//     key: '1',
//     testplan_name: 'mmm测试',
//     client: "林黛玉",
//     tags: ['审核通过'],
//   },
//   {
//     key: '2',
//     testplan_name: 'kkk测试',
//     client: 123,
//     tags: ['未通过'],
//   },
//   {
//     key: '3',
//     testplan_name: 'xxx测试',
//     client: '李逵',
//     tags: ['待提交审核'],
//   },
// ];

const namespace='testplanList';
const mapStateToProps = (state) => {
  const dataList = state[namespace].data;
  return {
    dataList,
  };
};
const mapDispatchToProps = (dispatch) => {
  return {
    //页面在mount完后发送一个queryInitPlans的action，被effects处理
    onDidMount: () => {
      dispatch({
        type: `${namespace}/queryInitPlans`,
      });
    },
    queryAddPlan:(newPlan)=>{
      dispatch({
        type:`${namespace}/queryAddPlan`,
        payload:newPlan,
      });
    },
    queryDeletePlan:(params)=>{
      dispatch({
        type:`${namespace}/queryDeletePlan`,
        payload:params
      })
    },

  };
};

// const mapDispatchToProps = (dispatch) => {
//   return {
//     onClickAdd: (newPlan) => {
//       const action = {
//         type: `${namespace}/addNewPlan`,
//         payload: newPlan,
//       };
//       dispatch(action);
//     },
//   };
// };

@connect(mapStateToProps,mapDispatchToProps)
export default class List extends React.Component{
  // constructor(props){
  //   super(props);
  //   this.counter=100;
  //   this.state= {
  //     dataList: [
  //       {
  //         id: 1,
  //         testplan_name: 'mmm',
  //         client: "林黛玉",
  //         tags: ['审核通过'],
  //       },
  //       {
  //         id: 2,
  //         testplan_name: 'kkk',
  //         client: 123,
  //         tags: ['未通过'],
  //       },
  //       {
  //         id: 3,
  //         testplan_name: 'xxx',
  //         client: '李逵',
  //         tags: ['待提交审核'],
  //       },
  //     ],
  //   }
  // }
  // addNewPlan=()=>{
  //   this.setState(prevState=>{
  //     const prevDataList = prevState.dataList;
  //     this.counter += 1;
  //     const data = {
  //       id: this.counter,
  //       testplan_name: 'elit',
  //       client: 'aliqua',
  //       tags:['未通过'],
  //     };
  //     return {
  //       dataList: prevDataList.concat(data),
  //     };
  //   });
  // }

  componentDidMount() {
    this.props.onDidMount();
  }
  showDeleteConfirm(key) {
    // console.log(key.pid)
    var that=this;
    confirm({
      title: '您是否要删除本方案?',
      content: `测试方案ID:${key.pid}  编辑人员:${key.author}`,
      okText: '确认删除',
      okType: 'danger',
      cancelText: '取消',
      onOk() {
        that.props.queryDeletePlan({pid:key.pid})
        // console.log('OK');
      },
      onCancel() {
        console.log('Cancel');
      },
    });
  }

  columns = [
    {
      title: '方案ID',
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
        {key.processState == 'Submit' ? <Link to={{pathname: './plan_check', query: {pid: key.pid}}}>查看详情</Link> :
          <Link to={{pathname: './plan_check', query: {pid: key.pid}}}>查看详情</Link>}
          <Divider type="vertical"/>
          {/*<a href="/plan_edit.html">编辑</a>*/}
          {<Link to={{pathname: '../../plan_edit', query: {pid: key.pid}}}>编辑</Link>}
          <Divider type="vertical"/>
          <span style={{color: 'red', cursor: 'pointer'}} onClick={this.showDeleteConfirm.bind(this, key)}>删除</span>
      </span>
      ),
    },
  ];

  render() {
    return (
      <div>
        <Breadcrumb>
          <Breadcrumb.Item href="/welcome.html">主页</Breadcrumb.Item>
          <Breadcrumb.Item>测试方案列表</Breadcrumb.Item>
        </Breadcrumb>
        <br/>

        <Table columns={this.columns} dataSource={this.props.dataList}/>

        {/*<div>*/}
        {/*  <Button onClick={*/}
        {/*    () => this.props.queryAddPlan(this.props.newdataList)}>添加方案</Button>*/}
        {/*</div>*/}
      </div>
    );
  }
}

//export default List;
