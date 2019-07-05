import { getOneEntrust, reviewEntrust,replaceEntrust,queryEntrustState,addNewContract} from '@/services/user'
import router from "umi/router";
import {message} from "antd";
export default {
  namespace: 'checkentrust',
  state: {
    selectedKey: '/basic-list',
    columns: [
      {
        title: 'Name',
        dataIndex: 'name',
        key: 'name',
        render: text => <a href="javascript:;">{text}</a>,
      },
      {
        title: 'Age',
        dataIndex: 'age',
        key: 'age',
      },
      {
        title: 'Address',
        dataIndex: 'address',
        key: 'address',
      },
      {
        title: 'Tags',
        key: 'tags',
        dataIndex: 'tags',
        render: tags => (
          <span>
                {tags.map(tag => {
                  let color = tag.length > 5 ? 'geekblue' : 'green';
                  if (tag === 'loser') {
                    color = 'volcano';
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
        title: 'Action',
        key: 'action',
        render: (text, record) => (
          <span>
                <a href="javascript:;">Invite {record.name}</a>
                <Divider type="vertical"/>
                <a href="javascript:;">Delete</a>
              </span>
        ),
      },
    ],
    entrust: {},
  },
  effects: {
    * getOneEntrust({payload}, {call, put}) {
      const response = yield call(getOneEntrust, payload);
      console.log(response);
      yield put({type: 'initData', payload: response})
    },
    * ReviewEntrust({payload},{call}) {
      yield call(reviewEntrust, payload);
      if(payload.operation=="ReviewPass"){
        const res = yield call(queryEntrustState,payload)
        if(res.state=="Approve"){
        console.log("get")
          const contract=yield call(addNewContract,payload)
          console.log(contract)
          alert("已创建对应的合同")
        }
      }
      
      router.push("/basic-list.html")
    },


  },
  reducers: {
    initData(state, action) {
      return {
        ...state,
        entrust: action.payload,
      }
    }
  }

};
