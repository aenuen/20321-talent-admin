import { caseApi } from '@/api/case'

export const caseCalc = (yearMonth, lawyer) => new Promise((resolve) => {
  caseApi.monthList({ yearMonth, lawyer }).then(({ code, data }) => {
    const list = code === 200 ? [...data.list] : []
    let total = 0
    let enter = 0
    list.forEach((item) => {
      total += +item.price
      enter += +item.enterPrice
    })
    resolve({ list, total: +total.toFixed(2), enter: +enter.toFixed(2) })
  })
})
