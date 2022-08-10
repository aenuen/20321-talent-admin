import { fields } from './fields'

export const eHeader = [
  fields.name,
  fields.yearMonth,
  fields.company,
  fields.myPension + fields.personal,
  fields.myUnemployment + fields.personal,
  fields.myMedicalCare + fields.personal,
  fields.myAccumulationFund,
  fields.unPension + fields.unit,
  fields.unUnemployment + fields.unit,
  fields.unMedicalCare + fields.unit,
  fields.unInjury + fields.unit,
  fields.unBirth + fields.unit,
  fields.subtotal
]

export const eFields = [
  'name',
  'yearMonth',
  'company',
  'myPension',
  'myUnemployment',
  'myMedicalCare',
  'myAccumulationFund',
  'unPension',
  'unUnemployment',
  'unMedicalCare',
  'unInjury',
  'unBirth',
  'subtotal'
]
