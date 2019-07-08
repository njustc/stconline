import React, {Component} from 'react';
import {Table, Select, Input, Button, Breadcrumb, Divider, Tag, Menu, Modal} from 'antd';

const Search = Input.Search;
import {connect} from 'dva';
import Link from 'umi/link'
import {getRole} from "../../../utils/cookieUtils";
import style from './style.less'
import router from 'umi/router'

const confirm = Modal.confirm;
const namespace = 'entrustlist';


var userFootMaper = {
  "SS": <div></div>,

  "CUS":
    <Button
      type="primary"
      // onClick={handleJump.bind(this, '/basic-form')}
      href="/basic-form.html"
    >
      新建委托
    </Button>

}

/**
 * 处理路由跳转函数
 * */
function handleJump(url, e) {
  router.push(url)
}

function footer() {
  return userFootMaper[getRole()[0]]
}

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
        type: `${namespace}/GetAllEntrust`,
      })
    },
    DeleteEntrust: (params) => {
      dispatch({
        type: `${namespace}/DeleteEntrust`,
        payload: params
      })
    }
  }
}
const data = [];

@connect(mapStateToProps, mapDispatchToProps)
export default class EntrustList extends Component {
  componentDidMount() {
    this.props.onDidMount();
  }

  userLinkMaper = {
    "SS": (key) => (
      <span>
  {key.processState === 'ToReview' ? <Link to={{pathname: './basic-check', query: {pid: key.pid}}}>审核</Link> :
    <span></span>}
        <Divider type="vertical"/>
        {<Link to={{pathname: './basic-check', query: {pid: key.pid}}}>查看详情</Link>}
  </span>
    ),

    "CUS": (key) => (
    <span>
    <Link to={{pathname: './basic-check', query: {pid: key.pid}}}>查看项目详情</Link>
    <Divider type="vertical"/>
    {key.processState === 'Submit' ? <Link to={{pathname: '../../basic-form', query: {pid: key.pid}}}>编辑</Link> :
    <span/>}
    <Divider type="vertical"/>
    {key.processState == 'Submit' ? <span style={{color: 'red', cursor: 'pointer'}} onClick={this.showDeleteConfirm.bind(this, key)}>删除</span>:
    <span>   </span>}
  
  </span>
    )
  }


  columns = [
    {
      title: '项目编号',
      dataIndex: 'pid',
      key: 'pid',
      render: text => <a href="javascript:">{text}</a>,
    },
    {
      title: '软件名称',
      dataIndex: 'softwareName',
      key: 'softwareName',
      render: text => <a href="javascript:">{text}</a>,
    },
    {
      title: '委托单位',
      dataIndex: 'companyCh',
      key: 'companyCh',
      render: text => <a href="javascript:">{text}</a>,
    },
    {
      title: '状态',
      key: 'processState',
      dataIndex: 'processState',
      render: processState => {
        var color = processState === 'Review' ? 'geekblue' : 'green'
        if (processState==='Submit'){
          // color='volcano'
          color='gold'
        }
        var content = processState ==='Review'?"待审核":"已通过"
        if (processState==='Submit'){
          content='待提交'
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
  ]


  link() {
    return this.userLinkMaper[getRole()[0]]
  }

  showDeleteConfirm(key) {
    // console.log(key.pid)
    var that = this
    confirm({
      title: '您是否要删除本委托?',
      content: `委托ID:${key.pid}  用户名:${key.name}`,
      // content: `委托ID:`,
      okText: '确认删除',
      okType: 'danger',
      cancelText: '取消',
      onOk() {
        that.props.DeleteEntrust({pid: key.pid})
        // that.props.onDidMount()
        // console.log('OK');
      },
      onCancel() {
        console.log('Cancel');
      },
    });
  }


  render() {
    return (
      <div className={style.body}>
        <div className={style.header}>
          <Breadcrumb className={style.curmbBody}>
            <Breadcrumb.Item href="/welcome.html"
                             className={style.curmbItem}
            >主页
            </Breadcrumb.Item>
            <Breadcrumb.Item 
                             className={style.curmbItem}
            >委托列表
            </Breadcrumb.Item>
          </Breadcrumb>
          <div>{footer()}</div>
        </div>
        <Table columns={this.columns}
               style={{
                 paddingTop: 20,
               }}
               dataSource={(!this.props.listdata.data.length) ? data : this.props.listdata.data}
        />
      </div>
    );
  }
}
