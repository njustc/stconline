
import { Divider, Tag,Menu} from 'antd';
import { getAllEntrust } from '@/services/user';
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
          render: () => (
            <span>
              <Link to='./basic-check'>查看项目详情</Link>
              <Divider type="vertical" />
              <Link to='../../basic-form'>编辑</Link>
            </span>
          ),
        },
      ],
        data : [],
        
    },
    effects:{
      *getAllEntrust(_,{call,put}){
        const response=yield call(getAllEntrust)
        yield put({type:'addListData',payload: response})
      }
    },
    reducers:{
      addListData(state,action){
        console.log(state)
        return{
          ...state,
          data:state.data.concat(action.payload.data),
        }
      }
    }
  };