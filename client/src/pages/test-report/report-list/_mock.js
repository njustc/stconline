const data = [
  {
    key: '1',
    pid: 'mmm',
    author: "林黛玉",
    processState: ['Approve'],
  },
  {
    key: '2',
    pid: 'kkk',
    author: '123',
    processState: ['ToReview'],
  },
  {
    key: '3',
    pid: 'xxx',
    author: '李逵',
    processState: ['ToSubmit'],
  },
];

//let count=0;
export default {
  'get /dev/api/project/testplan': function (req, res) {
    res.json(data);
  },
  'get /dev/addPlan': function (req, res) {
    res.json(data);
  },

};
