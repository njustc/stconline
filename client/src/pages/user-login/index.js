import React, {Component} from 'react';
import {connect} from 'dva';
import {formatMessage, FormattedMessage} from 'umi/locale';
import Link from 'umi/link';
import {Checkbox, Alert, Icon, Skeleton, Upload, message} from 'antd';
import {Login} from 'ant-design-pro';
import router from 'umi/router';
import Button from "antd/es/button";
import styles from './style.less';
import {readCookie, getRole} from "../../utils/cookieUtils";
const {Tab, UserName, Password, Mobile, Captcha, Submit} = Login;

@connect(({userInfo, loading}) => ({
  userInfo,
  submitting: loading.effects['user/login'],
}))
class LoginPage extends Component {
  state = {
    type: 'userInfo',
    autoLogin: true,
  };

  onTabChange = type => {
    this.setState({type});
  };

  /**
   * 登录操作
   * */
  handleSubmit = (err, values) => {
    const {type} = this.state;
    if (!err) {
      const {dispatch} = this.props;
      dispatch({
        type: 'userInfo/login',
        payload: {
          ...values,
          type,
        },
      }).then(res => {
        //TODO: 登录成功与失败处理逻辑
        //console.log(res.status);
        //router.push("/welcome")
        const role = getRole()[0]
        if (role === "CUS") {
          location.replace("/user-first.html")
        }
        else {
          location.replace("/staff-first.html")
        }
        //cookie内容
      });
    }
  };

  /**
   * 登出操作
   * */
  handleLogout = () => {
    const {dispatch} = this.props;
    dispatch({
      type: 'userInfo/logout',
    }).then(res => {
      //console.log(res)
      location.replace("/user-login.html")
    })
  };

  changeAutoLogin = e => {
    this.setState({
      autoLogin: e.target.checked,
    });
  };

  renderMessage = content => (
    <Alert style={{marginBottom: 24}} message={content} type="error" showIcon/>
  );

  render() {
    const {userInfo, submitting} = this.props;
    const {status} = userInfo.data;
    const {type, autoLogin} = this.state;

    return (

      <div className={styles.main}>
        <Login
          defaultActiveKey={type}
          onTabChange={this.onTabChange}
          onSubmit={this.handleSubmit}
          ref={form => {
            this.loginForm = form;
          }}
        >

          <img src="https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1562687762685&di=628eddb2e06b3b76d564250771be406e&imgtype=0&src=http%3A%2F%2Fmmbiz.qpic.cn%2Fmmbiz_png%2Fj9L86C5IO6ibciaA50hmu7NVUdVkSsyZ3TsEUdhpjarWw4CIxu2O25tYdxQkru5mcu8ibVGsPwTmodFOhCbFSRS2g%2F640%3Fwx_fmt%3Dpng"/>
          {/*<div>*/}
          {/*  <img src={require('src/assets/timg.jpeg')} />*/}
          {/*</div>*/}
          <br/>
          <UserName
            name="username"
            placeholder={`${formatMessage({id: 'user-login.login.userName'})}`}
            rules={[
              {
                required: true,
                message: formatMessage({id: 'user-login.userName.required'}),
              },
            ]}
          />
          <Password
            name="password"
            placeholder={`${formatMessage({id: 'user-login.login.password'})}`}
            rules={[
              {
                required: true,
                message: formatMessage({id: 'user-login.password.required'}),
              },
            ]}
            onPressEnter={() => this.loginForm.validateFields(this.handleSubmit)}
          />
          <a href="http://keysoftlab.nju.edu.cn/_upload/article/6c/9a/b64d969d4332a2fb45563890bd7f/5aefef9e-50c1-4ba3-96ae-f4ba96384b05.pdf">下载文件</a>

          {/*<div>*/}
          {/*  <Checkbox checked={autoLogin} onChange={this.changeAutoLogin}>*/}
          {/*    <FormattedMessage id="user-login.login.remember-me"/>*/}
          {/*  </Checkbox>*/}
          {/*  <a style={{float: 'right'}} href="">*/}
          {/*    <FormattedMessage id="user-login.login.forgot-password"/>*/}
          {/*  </a>*/}
          {/*</div>*/}
          <Submit loading={submitting}>
            <FormattedMessage id="user-login.login.login"/>
          </Submit>
          {/*<Button*/}
          {/*  style={{width: '100%'}}*/}
          {/*  onClick={this.handleLogout}*/}
          {/*>登出*/}
          {/*</Button>*/}
          {/*<div className={styles.other}>*/}
          {/*  <FormattedMessage id="user-login.login.sign-in-with"/>*/}
          {/*  <Icon type="alipay-circle" className={styles.icon} theme="outlined"/>*/}
          {/*  <Icon type="taobao-circle" className={styles.icon} theme="outlined"/>*/}
          {/*  <Icon type="weibo-circle" className={styles.icon} theme="outlined"/>*/}
          {/*  <Link className={styles.register} to="/user/register">*/}
          {/*    <FormattedMessage id="user-login.login.signup"/>*/}
          {/*  </Link>*/}
          {/*</div>*/}
          {/*<a href="http://keysoftlab.nju.edu.cn/_upload/article/6c/9a/b64d969d4332a2fb45563890bd7f/5aefef9e-50c1-4ba3-96ae-f4ba96384b05.pdf">下载文件</a>*/}
        </Login>
      </div>

    );
  }
}

export default LoginPage;
