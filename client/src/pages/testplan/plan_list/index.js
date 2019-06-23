import { Table, Divider, Tag ,Breadcrumb} from 'antd';

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
          if (tag === '未通过') {
            color = 'volcano';
          }
          else if(tag === '待提交审核'){
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
    render: (text, record) => (
      <span>
        <a href="/plan_check.html">查看详情</a>
        <Divider type="vertical" />
        <a>删除</a>
      </span>
    ),
  },
];

const data = [
  {
    key: '1',
    contract_name: 'mmm测试',
    client: "林黛玉",
    tags: ['审核通过'],
  },
  {
    key: '2',
    contract_name: 'kkk测试',
    client: 123,
    tags: ['未通过'],
  },
  {
    key: '3',
    contract_name: 'xxx测试',
    client: '李逵',
    tags: ['待提交审核'],
  },
];

class List extends React.Component{
  render(){
    return(
      <div>
        <Breadcrumb>
          <Breadcrumb.Item href="/welcome.html">主页</Breadcrumb.Item>
          <Breadcrumb.Item>测试方案列表</Breadcrumb.Item>
        </Breadcrumb>
        <br />
        <Table columns={columns} dataSource={data} />
      </div>
    );
  }
}

export default List;
