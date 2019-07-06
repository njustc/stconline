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
  componentDidMount() {
    const {dispatch} = this.props;
    console.log(this.props.location.query);
    dispatch({
      type: `${namespace}/queryInitRecords`,
      payload: this.props.location.query,
    });
  }

  showDeleteConfirm(key) {
        var that = this;
        confirm({
            title: '您是否要删除本记录?',
            content: `测试方案ID:${key.testId}`,
            okText: '确认删除',
            okType: 'danger',
            cancelText: '取消',
            onOk() {
                that.props.queryDeleteRecord({testId:key.testId})
            },
            onCancel() {
                console.log('Cancel');
            },
        });
    }

    userLinkMapper= {
        "TM": (key) => (
        <span>
            <Divider type="vertical"/>
            {<Link to = {{pathname: './record-detail', query: {testId: key.testId}}}>查看详情</Link>}
        </span>
        ),
        
        "TS": (key) => (
        <span>
            {<Link to={{pathname: './record-detail', query: {testId: key.testId}}}>查看详情</Link>}
            <Divider type = "vertical"/>
            {key.processState === 'Submit' ? <Link to={{pathname: '../../record-edit', query: {testId: key.testId}}}>编辑</Link>:null}
        </span>
        ),
    };
    
    link(){
        return this.userLinkMapper[getRole()[0]]
    }
    
    columns = [
        {
            title: '测试记录ID',
            dataIndex: 'testId',
            key: 'testId',
            render: text => <a href="javascript:;">{text}</a>,
        },
        {
            title: '状态',
            key: 'processState',
            dataIndex: 'processState',
            render: processState => {
                var color = processState === 'Review' ? 'geekblue' : 'green';
                if (processState === 'Submit') {
                    color = 'grey'
                }
                return (
                <Tag color = {color} key = {processState}>
                {processState}
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
            <Breadcrumb.Item href = "/welcome.html">主页</Breadcrumb.Item>
            <Breadcrumb.Item>测试记录列表</Breadcrumb.Item>
            </Breadcrumb>
        <br/>

        <Table columns = {this.columns} dataSource = {(!this.props.dataList.length) ? data : this.props.dataList}/>
        </div>
        );
    }
}
