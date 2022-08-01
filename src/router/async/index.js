// 异步加载
import iconsRouter from './modules/icons'
import articleRouter from './modules/article'
const asyncRoutes = [
  articleRouter,
  iconsRouter,
  { path: '*', redirect: '/404', hidden: true } // 无页面=404页面
]

export default asyncRoutes
