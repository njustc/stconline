
// ref: https://umijs.org/config/
import {primaryColor} from '../src/defaultSettings';

export default {
  base: '/',                           //-----------------------------
  publicPath: 'http://localhost:8080/', //这几行千万别再改了,求求各位了orz.|
  exportStatic: {htmlSuffix: true},    //这几行千万别再改了,求求各位了orz.|
  treeShaking: true,                   //-----------------------------
  plugins: [
    [
      'umi-plugin-react',
      {
        antd: true,
        dva: {hmr: true},
        targets: {ie: 11},
        locale: {
          enable: true,
          // default false
          default: 'zh-CN',
          // default zh-CNY
          baseNavigator: true,
        },
        // default true, when it is true, will use `navigator.language` overwrite default
        dynamicImport: {loadingComponent: './components/PageLoading/index'},
      },
    ],
    [
      'umi-plugin-pro-block',
      {
        moveMock: false,
        moveService: false,
        modifyRequest: true,
        autoAddMenu: true,
      },
    ],
  ],
  targets: {ie: 11},
  /**
   * 路由相关配置
   */
  routes: [
    {
      path: '/',
      component: '../layouts/BasicLayout',
      Routes:['src/utils/Authorized'],
      //authority:['CUS'],
      routes: [
        {
          path: '/',
          redirect: '/user-login',
        },
        // dashboard
        {
          path: '/welcome',
          // name: 'welcome',
          // icon: 'smile',
          component: './Welcome',
        },
        { //待办事项
          name:'项目列表',
          icon:'smile',
          path:'/staff-first',
          component:'./staff-first',
          authority:['TS','TM','SS','SM','QM'],
        },
        {
          name:'项目列表',
          icon: 'smile',
          path: '/user-first',
          component: './user-first',
          authority:['CUS'],
        },
        {
          path: 'basic-form',
          component: './entrust/basic-form',
        },
        {
          path: 'basic-check',
          component: './entrust/basic-check',
        },
        {
          name: '委托列表',
          icon: 'pie-chart',
          path: '/basic-list',
          component: './entrust/basic-list/entrustlist',
          authority:['CUS','SS'],
        },


        //contract

        {
          path: '/contract_check',
          component: './contract/contract_detail',
        },
        {
          path: '/contract_edit',
          component: './contract/contract_edit',
        },

        {
          path: '/contract_list',
          component: './contract/contract_list',
          icon: 'pie-chart',
          name: '合同列表',
          authority:['CUS','SS','SM','QM'],
        },

        //testplan

        {
          //name: '测试方案详情',
          //icon: 'pie-chart',
          path: '/plan_check',
          component: './testplan/plan_check',
        },
        {
          name: '测试方案列表',
          icon: 'pie-chart',
          path: '/plan_list',
          component: './testplan/plan_list',
          authority:['CUS','QM','TM','TS'],
        },
        {
          //name: '测试方案编辑',
          //icon: 'pie-chart',
          path: '/plan_edit',
          component: './testplan/plan_edit',
        },

        //test-report
        {
          name: '测试报告列表',
          icon: 'pie-chart',
          path: '/report-list',
          component: './test-report/report-list',
          authority:['CUS','QM','TM','TS'],
        },
        {
          //测试报告详情
          path: '/report-detail',
          component: './test-report/report-detail',
        },
        {
          //测试报告编辑
          path: '/report-edit',
          component: './test-report/report-edit',
          // authority:['CUS','QM','TM','TS'],
        },

        //test-record
        {
          // 测试记录列表
          // name: '测试记录列表',
          // icon: 'pie-chart',
          path: '/record-list',
          component: './test-record/record-list',
        },
        {
          //测试报告详情
          path: '/record-detail',
          component: './test-record/record-detail',
        },
        {
          //测试报告编辑
          path: '/record-edit',
          component: './test-record/record-edit',
        },

        //user-login
        {
          // name: '登陆',
          // icon: 'smile',
          path: '/user-login',
          component: './user-login',
        },

      ],
    },
  ],
  disableRedirectHoist: true,
  /**
   * webpack 相关配置
   */
  define: {APP_TYPE: process.env.APP_TYPE || ''},
  // Theme for antd
  // https://ant.design/docs/react/customize-theme-cn
  theme: {'primary-color': primaryColor},
  externals: {'@antv/data-set': 'DataSet'},
  ignoreMomentLocale: true,
  lessLoaderOptions: {javascriptEnabled: true},
  proxy: {
    '/api': {
      target: 'http://localhost:8080',
      changeOrigin: true,
    },
  },
};
