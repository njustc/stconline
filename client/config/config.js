// ref: https://umijs.org/config/
import {primaryColor} from '../src/defaultSettings';

export default {
  base: '/',
<<<<<<< HEAD
  publicPath: 'http://114.212.133.244:8080',
=======
  publicPath: 'http://localhost:8080/',
>>>>>>> 38dbc7c8d652537eeab90274e84693a57291c37d
  treeShaking: true,
  exportStatic: {htmlSuffix: true},
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
          // default zh-CN
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
      routes: [
        {
          path: '/',
          redirect: '/user-login',
        },
        // dashboard
        {
          path: '/welcome',
          name: 'welcome',
          icon: 'smile',
          component: './Welcome',
        },

        {
          name: '委托列表',
          icon: 'pie-chart',
          path: '/basic-list',
          component: './entrust/basic-list/entrustlist',
          routes: [
            {
              path: 'basic-form',
              component: './entrust/basic-form',
            },
            {
              path: 'basic-check',
              component: './entrust/basic-check',
            }
          ]
        },


        //contract
        // {
        //   name: '合同',
        //   icon: 'pie-chart',
        //   path: '/contract',
        //   routes:[
        //     {
        //       path:'/contract_detail',
        //       name:'合同详情',
        //     },
        //     {
        //       path:'/contract_edit',
        //       name:'合同编辑',
        //     },
        //     {
        //       path:'/contract_list',
        //       name:'合同列表',
        //     }
        //   ]
        // },


        {
          path: '/contract_detail',
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
          // routes :[
          //   {
          //     path:'/contract_detail',
          //     component:'./contract/contract_detail',
          //   },
          //   {
          //     path:'/contract_edit',
          //     component: './contract/contract_edit',
          //   },
          // ]
        },

        //testplan
        // {
        //   name: '测试方案',
        //   icon: 'pie-chart',
        //   path: '/testplan',
        //   routes:[
        //     {
        //       path:'/plan_check',
        //       name:'测试方案详情',
        //     },
        //     {
        //       path:'/plan_edit',
        //       name:'测试方案编辑',
        //     },
        //     {
        //       path:'/plan_list',
        //       name:'测试方案列表',
        //     }
        //   ]
        // },
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
        },

        //user-login
        {
          name: '登陆',
          icon: 'smile',
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
      target: 'http://114.212.133.244:8080',
      changeOrigin: true,
    },
  },
};
