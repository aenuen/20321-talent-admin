import request from '@/libs/axios/request'
export const caseApi = {
  // get
  base: () => request({ url: '/case/base', method: 'get' }), // 获取基础数据
  // post
  contractRemove: (data) => request({ url: '/case/contractRemove', method: 'post', data }), // 删除合同
  letterRemove: (data) => request({ url: '/case/letterRemove', method: 'post', data }) // 删除合同
}
