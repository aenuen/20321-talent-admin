import request from '@/libs/axios/request'
import qs from 'qs'

export const salaryApi = {
  // get
  used: (params) => request({ url: `/salary/used?${qs.stringify(params)}`, method: 'get' }), // 使用过的数据
  details: (params) => request({ url: `/salary/details?${qs.stringify(params)}`, method: 'get' }), // 医社保明细
  // post
  create: (data) => request({ url: '/salary/create', method: 'post', data }) // 新增员工
}
