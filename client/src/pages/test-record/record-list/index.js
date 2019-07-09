import {Table, Divider, Button, Tag, Breadcrumb, Modal} from 'antd';
import React from "react";
import {connect} from "dva";
const confirm = Modal.confirm;
import Link from 'umi/link'
import {getRole} from "../../../utils/cookieUtils";

const data = [];
const namespace = 'testRecordList';
const mapStateToProps = (state) => {
    const dataList = state[namespace].data;
    console.log(dataList);
    return {
        dataList,
    };
};
// var userFootMaper = {
//   "TM": <div></div>,
//
//   "TS":
//     <Button
//       //     type="primary"
//       //     // onClick={handleJump.bind(this, '/basic-form')}
//       //     href="/record-edit.html"
//     >
//       {/*新建委托 */}
//       <Link to={{pathname: './record-edit', query: {pid: this.props.location.query.pid}}}>新建委托</Link>
//     </Button>
//
// }
//
// function footer() {
//   return userFootMaper[getRole()[0]]
// }

// const mapDispatchToProps = (dispatch) => {
//     return {
//         //页面在mount完后发送一个queryInitRecords的action，被effects处理
//         onDidMount: () => {
//             dispatch({
//                 type: `${namespace}/queryInitRecords`,
//                 payload:params,
//             });
//         },
//         queryAddRecord:(newRecord)=>{
//             dispatch({
//                 type:`${namespace}/queryAddRecord`,
//                 payload:newRecord,
//             });
//         },
//         queryDeleteRecord:(params)=>{
//             dispatch({
//                 type:`${namespace}/queryDeleteRecord`,
//                 payload:params
//             })
//         },
//     };
// };

@connect(mapStateToProps)
export default class List extends React.Component {
  // constructor(props) {
  //   super(props)
  //   this.state = {
  //     pid: "",
  //   }
  // }

  componentDidMount() {
    const {dispatch} = this.props;
    console.log(this.props.location.query);
    // if (this.props.location.query.pid) {
    //   this.state.pid = this.props.location.query.pid
    // } else {
    //   this.state.pid = this.props.dataList.pid || ""
    // }
    dispatch({
      type: `${namespace}/queryInitRecords`,
      payload: this.props.location.query,
    });
  }

  //删除
  delete = (value) => {
    const {dispatch} = this.props;
    dispatch({
      type: `${namespace}/queryDeleteRecord`,
      payload: value,
    })
  };

  showDeleteConfirm(key) {
    var that = this;
    confirm({
      title: '您是否要删除本记录?',
      content: `测试方案ID:${key.testId}`,
      okText: '确认删除',
      okType: 'danger',
      cancelText: '取消',
      onOk() {
        console.log(key);
        that.delete(key);
      },
      onCancel() {
        console.log('Cancel');
      },
    });
  }

  userFootMapper = {
    "TM": <div></div>,

    "TS":
      <Button
         type="primary"
      >
               <Link to={{pathname: './record-edit', query: {pid: this.props.location.query.pid}}}>新建测试记录</Link>

        {/*新建委托*/}
      </Button>

  }

  footer() {
    return this.userFootMapper[getRole()[0]]
  }

  userLinkMapper = {
    "TM": (key) => (
      <span>
        {<Link to={{pathname: './record-detail', query: {testId: key.testId}}}>查看详情</Link>}
        </span>
    ),

    "TS": (key) => (
      <span>
            {<Link to={{pathname: './record-detail', query: {testId: key.testId}}}>查看详情</Link>}
        <Divider type="vertical"/>
        {key.processState === 'Submit' ?
          <Link to={{pathname: '../../record-edit', query: {testId: key.testId}}}>编辑</Link> : null}
        <Divider type="vertical"/>
        {key.processState === 'Submit' ? <span style={{color: 'red', cursor: 'pointer'}} onClick={this.showDeleteConfirm.bind(this, key)}>删除</span>:
          <span></span>}
        </span>
    ),
  };

  link() {
    return this.userLinkMapper[getRole()[0]]
  }

  columns = [
    {
      title: '测试记录ID',
      dataIndex: 'testId',
      key: 'testId',
      render: text => <a href="javascript:;">{text}</a>,
    },
    // {
    //   title: '状态',
    //   key: 'processState',
    //   dataIndex: 'processState',
    //   render: processState => {
    //     var color = processState === 'Review' ? 'geekblue' : 'green';
    //     if (processState === 'Submit') {
    //       color = 'grey'
    //     }
    //     return (
    //       <Tag color={color} key={processState}>
    //         {processState}
    //       </Tag>
    //     );
    //   }
    // },
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
          <Breadcrumb.Item>测试记录列表</Breadcrumb.Item>
        </Breadcrumb>

        <br/>
        <div>{this.footer()}</div>
        <br/>

        <Table columns={this.columns} dataSource={(!this.props.dataList.length) ? data : this.props.dataList}/>
      </div>
    );
  }
}
