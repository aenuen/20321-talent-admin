import Layout from '@/components/Layout'
const caseRouter = {
  path: '/case', name: 'case', component: Layout, redirect: '/case/list',
  meta: {
    title: '案件管理',
    icon: 'peoples',
    roles: ['admin']
  },
  children: [
    {
      path: 'list', name: 'caseList', component: () => import('@/views/case/list'),
      meta: {
        title: '案件列表',
        roles: ['admin']
      }
    },
    {
      path: 'create', name: 'caseCreate', component: () => import('@/views/case/create'),
      meta: {
        title: '新增案件',
        roles: ['admin']
      }
    },
    {
      path: 'update/:id', name: 'caseUpdate', component: () => import('@/views/case/update'),
      meta: {
        title: '案件编辑',
        roles: ['admin'],
        activeMenu: '/case/list'
      },
      hidden: true
    },
    {
      path: 'view/:id', name: 'caseView', component: () => import('@/views/case/view'),
      meta: {
        title: '案件编辑',
        roles: ['admin'],
        activeMenu: '/case/list'
      },
      hidden: true
    },
    {
      path: 'month', name: 'caseMonth', component: () => import('@/views/case/month'),
      meta: {
        title: '律师月表',
        roles: ['admin']
      }
    }
  ]
}

export default caseRouter
