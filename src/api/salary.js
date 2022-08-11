import request from '@/libs/axios/request'
import qs from 'qs'

export const salaryApi = {
  // get
  name: () => request({ url: '/user/name', method: 'get' }), // 员工姓名
  details: (params) => request({ url: `/user/details?${qs.stringify(params)}`, method: 'get' }), // 员工统计
  // post
  create: (data) => request({ url: '/user/create', method: 'get', data }) // 新增
}
