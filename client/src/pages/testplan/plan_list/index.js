import {Table, Divider, Button, Tag, Breadcrumb, Modal} from 'antd';
import React from "react";
import {connect} from "dva";
const confirm = Modal.confirm;
import Link from 'umi/link'
import {getRole} from "../../../utils/cookieUtils";

const data = [];
const namespace='testplanList';
const mapStateToProps = (state) => {
  const dataList = state[namespace].data;
  // console.log(dataList);
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
    // queryAddPlan:(newPlan)=>{
    //   dispatch({
    //     type:`${namespace}/queryAddPlan`,
    //     payload:newPlan,
    //   });
    // },
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
export default class List extends React.Component {
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
    var that = this;
    confirm({
      title: '您是否要删除本方案?',
      content: `测试方案ID:${key.pid}  编辑人员:${key.author}`,
      okText: '确认删除',
      okType: 'danger',
      cancelText: '取消',
      onOk() {
        that.props.queryDeletePlan({pid: key.pid})
        // console.log('OK');
      },
      onCancel() {
        //console.log('Cancel');
      },
    });
  }

  userLinkMapper = {
    "QM": (key) => (
      <span>
        <Divider type="vertical"/>
        {<Link to={{pathname: './plan_check', query: {pid: key.pid}}}>查看详情</Link>}
  </span>
    ),

    "TM": (key) => (
      <span>
        <Divider type="vertical"/>
        {<Link to={{pathname: './plan_check', query: {pid: key.pid}}}>查看详情</Link>}
        <Divider type="vertical"/>
        {key.processState === 'Approve' ?
          <Link to={{pathname: './record-list', query: {pid: key.pid}}}>查看测试记录</Link> : null}

  </span>
    ),


    "TS": (key) => (
      <span>
        {<Link to={{pathname: './plan_check', query: {pid: key.pid}}}>查看详情</Link>}
        <Divider type="vertical"/>
        {key.processState === 'Submit' ?
          <Link to={{pathname: '../../plan_edit', query: {pid: key.pid}}}>编辑</Link> : null}
        <Divider type="vertical"/>
        {key.processState === 'Approve' ?
          <Link to={{pathname: './record-list', query: {pid: key.pid}}}>查看测试记录</Link> : null}
      </span>
    ),
  };

  link() {
    return this.userLinkMapper[getRole()[0]]
  }

  columns = [
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
    {
      title: '操作',
      key: 'action',
      render: this.link()
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

        <Table columns={this.columns} dataSource={(!this.props.dataList.length) ? data : this.props.dataList}/>

        {/*<div>*/}
        {/*  <Button onClick={*/}
        {/*    () => this.props.queryAddPlan(this.props.newdataList)}>添加方案</Button>*/}
        {/*</div>*/}
      </div>
    );
  }
}

//export default List;
