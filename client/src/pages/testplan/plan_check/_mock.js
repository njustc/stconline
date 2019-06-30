const datacheck=
  {
    /** 编制人 */
    author: 'mmm',

    /** 审核人 */
    auditor: 'kkk',

    /** 批准人 */
    approver: 'xxx',

    /** 测试环境--硬件 */
    hardware: 'hard',

    /** 测试环境--软件 */
    software: 'soft',

    /** 测试环境--人员 */
    staff: 'eee',

    /** 测试进度表 */
    progressTable: 'pppppp',
  };


export default {
  '/dev/api/project/testplan/${params.pid}': function (req, res) {
    res.json(datacheck);
  },
};

