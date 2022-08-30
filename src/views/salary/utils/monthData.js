import { calcSum } from 'methods-often/import'
export const monthData = (ary) => {
  ary.forEach((item) => {
    // 工资合计
    item.payTotal = calcSum([item.basePay, item.meritPay])
    // 补贴扣款合计
    item.SAndDTotal = calcSum([item.subsidy, -item.deduct])
    // 个人代缴合计
    item.personalTotal = calcSum([item.myPension, item.myUnemployment, item.myMedicalCare, item.myAccumulationFund, item.myIncomeTax])
    // 发放表合计
    item.grantPay = calcSum([item.payTotal, item.SAndDTotal, -item.personalTotal])
  })
  return ary
}
