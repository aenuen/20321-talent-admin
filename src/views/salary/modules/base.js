// 基本工资
export const basePayAry = [
  { value: '3500' },
  { value: '4000' },
  { value: '4500' },
  { value: '5000' }
]
// 绩效工资
export const meritPayAry = [
  { value: '3000' },
  { value: '3500' },
  { value: '4000' },
  { value: '4500' },
  { value: '5000' }
]

// 养老个人
export const myPensionAry = [
  { value: '0' },
  { value: '280' }
]

// 养老单位
export const unPensionAry = [
  { value: '0' },
  { value: '560' }
]

// 失业个人
export const myUnemploymentAry = [
  { value: '0' },
  { value: '17.5' }
]

// 失业单位
export const unUnemploymentAry = [
  { value: '0' },
  { value: '17.5' }
]

// 工伤单位
export const unInjuryAry = [
  { value: '0' },
  { value: '7' },
  { value: '12.25' },
  { value: '19.25' }
]

// 医疗个人
export const myMedicalCareAry = [
  { value: '0' },
  { value: '69.77' },
  { value: '70' },
  { value: '73.52' },
  { value: '79.84' }
]

// 医疗单位
export const unMedicalCareAry = [
  { value: '0' },
  { value: '279.07' },
  { value: '280' }
]

// 生育单位
export const unBirthAry = [
  { value: '0' },
  { value: '24.42' },
  { value: '24.5' },
  { value: '27.94' }
]

// 公积金
export const accumulationFundAry = [
  { value: '0' },
  { value: '175' }
]

// 员工信息初始值
export const defaultPostForm = {
  department: '研发',
  basePay: '3500',
  meritPay: '0',
  myPension: '0',
  myUnemployment: '0',
  myMedicalCare: '0',
  myAccumulationFund: '0',
  unPension: '0',
  unUnemployment: '0',
  unMedicalCare: '0',
  unAccumulationFund: '0',
  unInjury: '0',
  unBirth: '0',
  assessment: '0',
  subsidy: '0'
}
