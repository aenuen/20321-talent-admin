// 异步加载
import salaryRouter from './modules/salary'
import articleRouter from './modules/article'
import lotteryRouter from './modules/lottery'
import iconsRouter from './modules/icons'
const asyncRoutes = [
  salaryRouter,
  articleRouter,
  lotteryRouter,
  iconsRouter,
  { path: '*', redirect: '/404', hidden: true } // 无页面=404页面
]

export default asyncRoutes
