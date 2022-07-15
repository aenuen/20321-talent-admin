import request from '@/libs/axios/request'
import qs from 'qs'

export const userApi = {
  // get
  info: () => request({ url: '/user/info', method: 'get' }), // 用户信息
  detail: params => request({ url: '/user/detail?' + qs.stringify(params), method: 'get' }), // 详情
  list: params => request({ url: '/user/list?' + qs.stringify(params), method: 'get' }), // 列表
  avatarList: params => request({ url: '/user/avatarList', method: 'get', params }), // 头像列表
  avatarHistory: params => request({ url: '/user/avatarHistory', method: 'get', params }), // 头像历史记录
  // post
  login: data => request({ url: '/user/login', method: 'post', data }), // 登录
  logout: () => request({ url: '/user/logout', method: 'post' }), // 登出
  base: data => request({ url: '/user/base', method: 'post', data }), // 基本资料
  email: data => request({ url: '/user/email', method: 'post', data }), // 修改电子邮件
  mobile: data => request({ url: '/user/mobile', method: 'post', data }), // 修改手机号码
  password: data => request({ url: '/user/password', method: 'post', data }), // 修改密码
  create: data => request({ url: '/user/create', method: 'post', data }), // 创建
  isUse: data => request({ url: '/user/isUse', method: 'post', data }), // 启用&&禁用用户
  isAdmin: data => request({ url: '/user/isAdmin', method: 'post', data }), // 是&&否后台用户
  avatar: data => request({ url: '/user/avatar', method: 'post', data }), // 更换头像
  avatarUpload: data => request({ url: '/user/avatarUpload', method: 'post', data }), // 上传头像
  avatarDelete: data => request({ url: '/user/avatarDelete', method: 'post', data }) // 删除头像
}
