

const data= [
      {
        key: '1',
        id: '131216456',
        name: '中美合拍',
        address: '2019-09-21 08:50:65',
        tags: ['委托审核未通过'], 
      },
      {
        key: '2',
        id: '131216456',
        name: '两开花',
        address: '2019-09-21 08:50:65',
        tags: ['委托审核通过'],
      },
      {
        key: '3',
        id: '131216456',
        name: '我爸是李刚',
        address: '2019-09-21 08:50:65',
        tags: ['委托待审核'],
      },
      {
          key: '4',
          id: '131216456',
          name: '总有刁民想害朕',
          address: '2019-09-21 08:50:65',
          tags: ['委托审核未通过'], 
        },
        {
          key: '5',
          id: '131216456',
          name: '漏油奔',
          address: '2019-09-21 08:50:65',
          tags: ['委托审核通过'],
        },
        {
          key: '6',
          id: '131216456',
          name: '隔壁老王',
          address: '2019-09-21 08:50:65',
          tags: ['委托待审核'],
        },
        {
          key: '7',
          id: '131216456',
          name: '蔡徐坤',
          address: '2019-09-21 08:50:65',
          tags: ['委托审核未通过'], 
        },
        {
          key: '8',
          id: '131216456',
          name: '鸡你太美',
          address: '2019-09-21 08:50:65',
          tags: ['委托审核通过'],
        },
        {
          key: '9',
          id: '131216456',
          name: '特朗普',
          address: '2019-09-21 08:50:65',
          tags: ['委托待审核'],
        },
        {
          key: '10',
          id: '131216456',
          name: '奥巴马',
          address: '2019-09-21 08:50:65',
          tags: ['委托审核未通过'], 
        },
        {
          key: '11',
          id: '131216456',
          name: '大碗宽面',
          address: '2019-09-21 08:50:65',
          tags: ['委托审核通过'],
        },
        {
          key: '12',
          id: '131216456',
          name: '金三胖',
          address: '2019-09-21 08:50:65',
          tags: ['委托待审核'],
        },
    ]
    export default {
      'get /dev/api/customers/cid/projects': function (req, res) {
          // console.log(data);
          res.json(data);
      },
      'get /dev/api/customers/projects/entrust': function (req, res) {
        for(var index in data){
          if(data[index].key===req.query.pid){
            data.splice(index,1)
            res.json(data);
          }
        }
        // console.log(Number(req.query.pid))
        
        // console.log(data.length);
        
     }
    };