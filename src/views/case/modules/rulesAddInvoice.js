import { validateRequire, validateDate } from 'methods-often/import'
import { fields } from './fields'
export const rulesForm = {
  inNumber: [{ validator: (rule, value, callback) => validateRequire(rule, value, callback, fields.inNumber) }],
  inHave: [{ validator: (rule, value, callback) => validateRequire(rule, value, callback, fields.inHave) }],
  inRate: [{ validator: (rule, value, callback) => validateRequire(rule, value, callback, fields.inRate) }],
  inNot: [{ validator: (rule, value, callback) => validateRequire(rule, value, callback, fields.inNot) }],
  invoiceDate: [{ validator: (rule, value, callback) => validateDate(rule, value, callback, fields.invoiceDate) }]
}
