import {getFilenames, fileDelete} from "../services/fileService";

export default {
  namespace: 'file',
  state: {
    //文件列表
    fileList: [
    ]
  },
  effects: {
    //文件列表获取
    * fetchFileList({payload}, {call, put}) {
      const response = yield call(getFilenames, payload);
      yield put({
        type: 'updateFiles',
        payload: response
      })
    },
    //文件删除
    * deleteFile({payload}, {call, put}) {
      yield call(fileDelete, payload);
      const response = yield call(getFilenames, payload);
      yield put({
        type: 'updateFiles',
        payload: response
      })
    }
  },
  reducers: {
    /**
     * 刷新文件列表
     * */
    updateFiles(state, action) {
      state.fileList = action.payload;
      return {
        fileList: action.payload
      }
    }
  }
}
