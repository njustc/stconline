const data = [
  {
    key: '1',
    testplan_name: 'mmm',
    client: "林黛玉",
    tags: ['审核通过'],
  },
  {
    key: '2',
    testplan_name: 'kkk',
    client: 123,
    tags: ['未通过'],
  },
  {
    key: '3',
    testplan_name: 'xxx',
    client: '李逵',
    tags: ['待提交审核'],
  },
];

const newdata = [
  {
    testplan_name: '小红',
    client: "小明",
    tags: ['审核通过'],
  },
];

//let count=0;
export default {
  'get /dev/api/project/testplan': function (req, res) {
    res.json(data);
  },
  'get /dev/addPlan': function (req, res) {
    res.json(newdata);
  },

};
