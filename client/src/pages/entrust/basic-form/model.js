import { message } from 'antd';
import { fakeSubmitForm } from './service';

export default {
  namespace: 'basicForm',

  state: {},

  effects: {
    *submitRegularForm({ payload }, { call }) {
      yield call(fakeSubmitForm, payload);
      message.success('提交成功');
    },
  },
};
