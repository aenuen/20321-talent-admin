import Layout from '@/components/Layout'
const lotteryRouter = {
  path: '/lottery', name: 'lottery', component: Layout, redirect: '/lottery/random',
  meta: {
    title: '乐透管理',
    icon: 'peoples',
    roles: ['admin']
  },
  children: [
    {
      path: 'list', name: 'lotteryList', component: () => import('@/views/lottery/random'),
      meta: {
        title: '彩票选取',
        roles: ['admin']
      }
    }
  ]
}

export default lotteryRouter
