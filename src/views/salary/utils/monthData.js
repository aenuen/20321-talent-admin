import { calcSum } from 'methods-often/import'
export const monthData = (ary) => {
  ary.forEach((item) => {
    item.onePay = calcSum([item.basePay, item.meritPay])
    item.shouldPay = (item.totalPay * item.assessment).toFixed(2)
    item.twoPay = calcSum([-item.deduct, item.subsidy])
  })
  return ary
}
