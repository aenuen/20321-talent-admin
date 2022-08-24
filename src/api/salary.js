import request from '@/libs/axios/request'
import qs from 'qs'

export const salaryApi = {
  // get
  used: (params) => request({ url: `/salary/used?${qs.stringify(params)}`, method: 'get' }), // 使用过的数据
  details: (params) => request({ url: `/salary/details?${qs.stringify(params)}`, method: 'get' }), // 医社保明细
  list: (params) => request({ url: `/salary/list?${qs.stringify(params)}`, method: 'get' }), // 员工列表
  month: (params) => request({ url: `/salary/month?${qs.stringify(params)}`, method: 'get' }), // 月表列表
  monthDetail: (params) => request({ url: `/salary/monthDetail?${qs.stringify(params)}`, method: 'get' }), // 月表员工详情
  detail: (params) => request({ url: `/salary/detail?${qs.stringify(params)}`, method: 'get' }), // 员工详情
  comPersonnel: (params) => request({ url: `/salary/comPersonnel?${qs.stringify(params)}`, method: 'get' }), // 公司员工
  // post
  create: (data) => request({ url: '/salary/create', method: 'post', data }), // 新增员工
  remove: (data) => request({ url: '/salary/remove', method: 'post', data }), // 删除员工
  removeBatch: (data) => request({ url: '/salary/removeBatch', method: 'post', data }), // 批量删除员工
  update: (data) => request({ url: '/salary/update', method: 'post', data }), // 编辑员工
  batchUpdate: (data) => request({ url: '/salary/batchUpdate', method: 'post', data }), // 批量编辑员工
  isUse: data => request({ url: '/salary/isUse', method: 'post', data }), // 启用&&禁用员工
  addPersonnel: data => request({ url: '/salary/addPersonnel', method: 'post', data }), // 添加月表员工
  monthUpdate: data => request({ url: '/salary/monthUpdate', method: 'post', data }) // 编辑月表员工
}
