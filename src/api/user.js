import request from '@/libs/axios/request'
import qs from 'qs'

export const userApi = {
  // get
  info: () => request({ url: '/user/info', method: 'get' }), // 用户信息
  detail: params => request({ url: '/user/detail?' + qs.stringify(params), method: 'get' }), // 详情
  list: params => request({ url: '/user/list?' + qs.stringify(params), method: 'get' }), // 列表
  avatarList: params => request({ url: '/user/avatarList?' + qs.stringify(params), method: 'get' }), // 头像列表
  // post
  login: data => request({ url: '/user/login', method: 'post', data }), // 登录
  logout: () => request({ url: '/user/logout', method: 'post' }), // 登出
  baseData: data => request({ url: '/user/baseData', method: 'post', data }), // 基本资料
  email: data => request({ url: '/user/email', method: 'post', data }), // 修改电子邮件
  mobile: data => request({ url: '/user/mobile', method: 'post', data }), // 修改手机号码
  password: data => request({ url: '/user/password', method: 'post', data }), // 修改密码
  create: data => request({ url: '/user/create', method: 'post', data }), // 创建
  remove: data => request({ url: '/user/remove', method: 'post', data }), // 创建
  update: data => request({ url: '/user/update', method: 'post', data }), // 更新
  isUse: data => request({ url: '/user/isUse', method: 'post', data }), // 启用&&禁用用户
  isAdmin: data => request({ url: '/user/isAdmin', method: 'post', data }), // 是&&否后台用户
  avatar: data => request({ url: '/user/avatar', method: 'post', data }), // 更换头像
  avatarUpload: data => request({ url: '/user/avatarUpload', method: 'post', data }), // 上传头像
  avatarRemove: data => request({ url: '/user/avatarRemove', method: 'post', data }), // 删除头像
  avatarUse: data => request({ url: '/user/avatarUse', method: 'post', data }) // 使用头像
}
