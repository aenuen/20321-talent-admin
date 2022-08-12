import request from '@/libs/axios/request'
import qs from 'qs'

export const salaryApi = {
  // get
  name: () => request({ url: '/salary/name', method: 'get' }), // 所有员工姓名
  company: () => request({ url: '/salary/company', method: 'get' }), // 所有公司名称
  details: (params) => request({ url: `/salary/details?${qs.stringify(params)}`, method: 'get' }), // 医社保明细
  // post
  create: (data) => request({ url: '/salary/create', method: 'post', data }) // 新增员工
}
