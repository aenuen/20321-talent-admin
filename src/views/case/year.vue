<template>
  <div class="app-container">
    <div class="filter-container">
      <!-- 年月搜索 -->
      <el-date-picker v-model="queryList.caseYear" :placeholder="fields.caseYear" class="filter-ele" value-format="yyyy" type="year" :clearable="false" @change="handleFilter" />
      <el-dropdown trigger="click">
        <el-button class="filter-btn el-icon-document"> 导出 </el-button>
        <el-dropdown-menu slot="dropdown">
          <el-dropdown-item @click.native="exportData(tableData, exportHeader, exportFields, exportFilename, 'xls')"> 导出EXCEL </el-dropdown-item>
          <el-dropdown-item @click.native="exportData(tableData, exportHeader, exportFields, exportFilename, 'csv')"> 导出CSV </el-dropdown-item>
        </el-dropdown-menu>
      </el-dropdown>
    </div>
    <YearList :table-data="tableData" :table-loading="tableLoading" />
  </div>
</template>
<script>
// api
import { caseApi } from '@/api/case'
// components
import YearList from './components/YearList'
// data
import { fields } from './modules/fields'
// filter
// function
// mixin
import ListMixin from '@/components/Mixins/ListMixin'
// plugins
import { timeGetYear } from 'methods-often/import'
import { exportData } from '@/libs/export'
// settings
export default {
  name: 'CaseYear',
  components: { YearList },
  mixins: [ListMixin],
  data() {
    return {
      fields,
      exportData,
      exportObject: {
        id: '编号',
        createDate: '创建日期',
        case: '案号',
        client: '合同客户',
        createRealName: '承办律师',
        price: '律师代理费',
        inNumber: '发票号码',
        enterPrice: '入账金额',
        enterDate: '入账日期'
      },
      exportHeader: ['编号', '创建日期', '类型', '合同客户', '承办律师', '律师代理费', '发票号码', '入账金额', '入账日期'],
      exportFields: ['id', 'createDate', 'type', 'client', 'createRealName', 'price', 'inNumber', 'enterPrice', 'enterDate']
    }
  },
  computed: {
    exportFilename() {
      return `${this.queryList.caseYear}${this.queryList.caseName}年案件统计表`
    }
  },
  methods: {
    // 设置数据
    setData() {
      return {
        caseYear: timeGetYear()
      }
    },
    // 获取列表
    startHandle() {
      caseApi.year(this.queryList).then(({ code, data }) => {
        if (code === 200) {
          if (data.length > 0) {
            data.forEach((element) => {
              element.createDate = element.createTimestamp
              element.case = `(${element.caseYear})${element.caseName}字${element.caseNumber}号`
            })
            this.tableData = [...data]
          } else {
            this.tableData = [...[]]
          }
          this.tableLoading = false
        }
      })
    }
  }
}
</script>
<style lang="scss" scoped></style>
