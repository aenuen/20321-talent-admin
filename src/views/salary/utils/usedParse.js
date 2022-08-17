import { arrayOrderByField } from 'methods-often/import'

export const usedParseEmpty = (ary, desc) => {
  const result = []
  ary.forEach(item => {
    if (item.value) {
      result.push({ value: item.value, label: item.value })
    } else {
      result.push({ value: 'empty', label: desc })
    }
  })
  return arrayOrderByField(result, 'value', true)
}

export const usedParseOnly = (ary) => {
  const result = []
  ary.forEach(item => {
    if (item.value) {
      result.push(item)
    }
  })
  return arrayOrderByField(result, 'value', true)
}
