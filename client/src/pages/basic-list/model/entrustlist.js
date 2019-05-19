
import { Divider, Tag,Menu} from 'antd';
import Link from 'umi/link'
export default {
    namespace: 'entrustlist',
    state: {
        columns : [
        {
          title: '委托ID',
          dataIndex: 'id',
          key: 'id',
          render: text => <a href="javascript:;">{text}</a>,
        },
        {
          title: '用户名',
          dataIndex: 'name',
          key: 'name',
        },
        {
          title: '委托建立时间',
          dataIndex: 'address',
          key: 'address',
        },

        {
          title: '状态',
          key: 'tags',
          dataIndex: 'tags',
          render: tags => (
            <span>
              {tags.map(tag => {
                let color = tag==='委托待审核' ? 'geekblue' : 'green';
                if (tag === '委托审核未通过') {
                  color = 'volcano';
                }
                return (
                  <Tag color={color} key={tag}>
                    {tag}
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
              <Link to='/checkentrust'>查看项目详情</Link>
              <Divider type="vertical" />
              <Link to='../../basic-form'>编辑</Link>
            </span>
          ),
        },
      ],
      data : [
        {
          key: '1',
          id: '131216456',
          name: 615616484,
          address: '2019-09-21 08:50:65',
          tags: ['委托审核未通过'], 
        },
        {
          key: '2',
          id: '131216456',
          name: 615616484,
          address: '2019-09-21 08:50:65',
          tags: ['委托审核通过'],
        },
        {
          key: '3',
          id: '131216456',
          name: 615616484,
          address: '2019-09-21 08:50:65',
          tags: ['委托待审核'],
        },
        {
            key: '1',
            id: '131216456',
            name: 615616484,
            address: '2019-09-21 08:50:65',
            tags: ['委托审核未通过'], 
          },
          {
            key: '2',
            id: '131216456',
            name: 615616484,
            address: '2019-09-21 08:50:65',
            tags: ['委托审核通过'],
          },
          {
            key: '3',
            id: '131216456',
            name: 615616484,
            address: '2019-09-21 08:50:65',
            tags: ['委托待审核'],
          },
          {
            key: '1',
            id: '131216456',
            name: 32,
            address: '2019-09-21 08:50:65',
            tags: ['委托审核未通过'], 
          },
          {
            key: '2',
            id: '131216456',
            name: 615616484,
            address: '2019-09-21 08:50:65',
            tags: ['委托审核通过'],
          },
          {
            key: '3',
            id: '131216456',
            name: 615616484,
            address: '2019-09-21 08:50:65',
            tags: ['委托待审核'],
          },
          {
            key: '1',
            id: '131216456',
            name: 615616484,
            address: '2019-09-21 08:50:65',
            tags: ['委托审核未通过'], 
          },
          {
            key: '2',
            id: '131216456',
            name: 615616484,
            address: '2019-09-21 08:50:65',
            tags: ['委托审核通过'],
          },
          {
            key: '3',
            id: '131216456',
            name: 615616484,
            address: '2019-09-21 08:50:65',
            tags: ['委托待审核'],
          },
      ],
      menu : (
        <Menu>
          <Menu.Item>
            
              1st menu item
           
          </Menu.Item>
          <Menu.Item>
            
              2nd menu item
           
          </Menu.Item>
          <Menu.Item>
            
              3rd menu item
            
          </Menu.Item>
        </Menu>
      ),
    }
  };