import { export_json_to_excel as exportJson } from '@/libs/export/ExportToExcel'
import { timeFormat } from 'methods-often/import'

const exportFormat = (fields, jsonData) => {
  return jsonData.map((v) =>
    fields.map((j) => {
      return j === 'created' ? timeFormat(v[j]) : v[j]
    })
  )
}

export const exportData = (data, header, fields, filename, bookType = 'xlsx') => {
  if (data.length > 0) {
    const newData = exportFormat(fields, data)
    const opt = { header, data: newData, filename, bookType }
    exportJson(opt)
  }
}
