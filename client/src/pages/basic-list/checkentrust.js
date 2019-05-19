import {Card,Table, Divider, Tag,Input,Button} from 'antd';
export default () => {

  const style={
    width:'400px',
    margin:'30px',
    boxShadow:'0 4px 8px 0 rgba(0, 0, 0, 0.2)',
    border:'1px solid #e8e8e8',
  }
  const columns = [
    {
      title: '模块编号',
      dataIndex: 'name',
      key: 'name',
      render: text => <a href="javascript:;">{text}</a>,
    },
    {
      title: '模块名称',
      dataIndex: 'age',
      key: 'age',
    },
    {
      title: '功能描述',
      key: 'action',
      render: (text, record) => (
        <span>
          {record.describe}
        </span>
      ),
    },
  ];
  
  const data = [
    {
      key: '1',
      name: 'M1',
      age: "佩奇",
      describe:"客户可在委托管理页面按照委托ID和委托名称对委托进行搜索，按照委托ID、委托名称和委托日期对委托进行排序。点击委托列表中的详情按钮可进入委托详",
    },
    {
      key: '1',
      name: 'M2',
      age: "佩奇",
      describe:"客户可在委托管理页面按照委托ID和委托名称对委托进行搜索，按照委托ID、委托名称和委托日期对委托进行排序。点击委托列表中的详情按钮可进入委托详",
    },
    {
      key: '1',
      name: 'M3',
      age: "佩奇",
      describe:"客户可在委托管理页面按照委托ID和委托名称对委托进行搜索，按照委托ID、委托名称和委托日期对委托进行排序。点击委托列表中的详情按钮可进入委托详",
    }
  ];
  return (
    <div>
      <div><h3>NST-04-JS002-2011-软件项目委托测试申请表(只读)</h3></div>
      <Card style={{ width: 300 }}>
        <p>测试类型：软件确认测试，成果技术鉴定测试</p>
        <p>软件名称：小猪佩奇软件测试</p>
        <p>版本号</p>
        <p>下略...</p>
      </Card>
      
      <div><h3>NST-04-JS002-2011-软件项目委托测试申请表(只读)</h3></div>
      <div style={{ width: "100%", border:"1px solid"}}>
        测试类型：软件确认测试，成果技术鉴定测试<br/>
        软件名称：小猪佩奇软件测试
      </div>
      <Table columns={columns} dataSource={data} pagination={false} />
      <div><h3>委托状态及意见</h3></div>
      <div>待受理/已受理/已驳回</div>
      <Input.TextArea style={{width:400,height:200}} placeholder="//意见" />
      <div><h3>样品</h3></div>
      <Input.TextArea style={{width:400,height:200}} placeholder="//样品" />
      <div>已提交样品：a.zip</div>
      <Button style={{marginLeft:300}} type="primary">提交</Button><Button style={{marginLeft:300}} type="primary">删除</Button>
    </div>
  );
  
  
}