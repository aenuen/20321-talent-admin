import request from '@/libs/axios/request'
import qs from 'qs'
export const caseApi = {
  // get
  base: () => request({ url: '/case/base', method: 'get' }), // 获取基础数据
  list: params => request({ url: '/case/list?' + qs.stringify(params), method: 'get' }), // 列表
  managerList: params => request({ url: '/case/managerList?' + qs.stringify(params), method: 'get' }), // 入账管理列表
  // post
  create: (data) => request({ url: '/case/create', method: 'post', data }), // 删除合同
  isUse: data => request({ url: '/case/isUse', method: 'post', data }), // 案件作废/取消作废
  contractRemove: (data) => request({ url: '/case/contractRemove', method: 'post', data }), // 删除合同
  letterRemove: (data) => request({ url: '/case/letterRemove', method: 'post', data }), // 删除合同
  delivery: (data) => request({ url: '/case/delivery', method: 'post', data }) // 确定原件已经收到
}
