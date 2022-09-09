import printJS from 'print-js'

/**
 * @description 打印表格
 * @param {string} tableId 表格id
 * @param {string} headTitle 头部标题
 * @param {string} [style] 表格样式
 * @param {string} [headerStyle] 头部样式
 */
export const printTable = (tableId, headTitle, style, headerStyle) => {
  style = style || 'table tr td,th{border-collapse:collapse;padding:4px;border:1px #000 solid;text-align:center}'
  headerStyle = headerStyle || 'text-align:center;color:#f00;width:100%;'
  printJS({ printable: tableId, header: headTitle, headerStyle, style, type: 'html', scanStyles: false })
}
