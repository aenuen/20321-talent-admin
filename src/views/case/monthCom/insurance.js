import { caseApi } from '@/api/case'
export const insurance = (yearMonth, lawyer) => new Promise((resolve) => {
  caseApi.insurance({ yearMonth, lawyer }).then(({ code, data }) => {
    const list = code === 200 ? data.list : []
    const isThat = ['梁泓燕', '许永云'].includes(lawyer)
    let myPension = 0
    let myUnemployment = 0
    let myMedicalCare = 0
    let unPension = 0
    let unUnemployment = 0
    let unMedicalCare = 0
    let unBirth = 0
    let unInjury = 0
    list.forEach((res) => {
      myPension += +res.myPension
      myUnemployment += +res.myUnemployment
      myMedicalCare += +res.myMedicalCare
      unPension += isThat ? 0 : +res.unPension
      unUnemployment += isThat ? 0 : +res.unUnemployment
      unMedicalCare += isThat ? 0 : +res.unMedicalCare
      unBirth += isThat ? 0 : +res.unBirth
      unInjury += isThat ? 0 : +res.unInjury
    })
    const insuranceTotal = myPension + myUnemployment + myMedicalCare + unPension + unUnemployment + unMedicalCare + unBirth + unInjury
    resolve({ list, total: +insuranceTotal.toFixed(2) })
  })
})
