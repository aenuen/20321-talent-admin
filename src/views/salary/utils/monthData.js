import { calcSum } from 'methods-often/import'
export const monthData = (ary) => {
  ary.forEach((item) => {
    item.onePay = calcSum([item.basePay, item.meritPay])
    item.shouldPay = +(item.onePay * item.assessment).toFixed(2)
    item.twoPay = calcSum([-item.deduct, item.subsidy])
    item.therePay = calcSum([item.myPension, item.myUnemployment, item.myMedicalCare, item.myAccumulationFund, item.myIncomeTax])
    item.fourPay = calcSum([item.shouldPay, item.twoPay, -item.therePay])
  })
  return ary
}
