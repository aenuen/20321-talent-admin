<template>
  <div class="app-container">
    <div class="filter-container">
      <!-- 类别搜索 -->
      <el-select v-model="queryList.caseName" filterable class="filter-ele" :placeholder="fields.type" @change="handleFilter">
        <el-option v-for="item in caseNameAry" :key="item.value" :label="item.value" :value="item.value" />
      </el-select>
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
    <TypeList :table-data="tableData" :table-loading="tableLoading" />
  </div>
</template>
<script>
// api
import { caseApi } from '@/api/case'
// components
import TypeList from './components/TypeList'
// data
import { fields } from './modules/fields'
import { caseNameAry } from './modules/caseNameAry'
// filter
// function
// mixin
import ListMixin from '@/components/Mixins/ListMixin'
// plugins
import { timeGetYear } from 'methods-often/import'
import { exportData } from '@/libs/export'
// settings
export default {
  name: 'CaseType',
  components: { TypeList },
  mixins: [ListMixin],
  data() {
    return {
      fields,
      caseNameAry,
      exportData,
      exportHeader: ['编号', '创建时间', '发票日期', '入账日期', '承办律师'],
      exportFields: ['id', 'createDate', 'invoiceDate', 'enterDate', 'createRealName']
    }
  },
  computed: {
    exportFilename() {
      return `${this.queryList.caseYear}年案件统计表`
    }
  },
  created() {
    if (!this.queryList.caseName) {
      this.queryList.caseName = caseNameAry[0].value
    }
  },
  methods: {
    // 设置数据
    setData() {
      return {
        caseYear: timeGetYear()
      }
    },
    startHandle() {
      caseApi.typeCase(this.queryList).then(({ code, data }) => {
        if (code === 200) {
          this.tableData = data
          this.tableLoading = false
        }
      })
    }
  }
}
</script>
<style lang="scss" scoped></style>
