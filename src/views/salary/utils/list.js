export const usedParse = (ary, desc) => {
  const result = []
  ary.forEach(item => {
    if (item.value) {
      result.push({ value: item.value, label: item.value })
    } else {
      result.push({ value: 'empty', label: desc })
    }
  })
  return result
}
