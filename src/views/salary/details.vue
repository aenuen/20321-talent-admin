<template>
  <div class="app-container">
    <div class="filter-container">
      <el-select v-model="queryList.name" filterable class="filter-ele" :placeholder="fields.name" @change="handleFilter">
        <el-option v-for="item in nameAry" :key="item.value" :label="item.value" :value="item.value" />
      </el-select>
      <el-select v-model="queryList.company" filterable class="filter-ele" :placeholder="fields.name" clearable @change="handleFilter">
        <el-option v-for="item in companyAry" :key="item.value" :label="item.value" :value="item.value" />
      </el-select>
      <el-date-picker v-model="queryList.aheadYearMonth" :placeholder="fields.aheadYearMonth" class="filter-ele" value-format="yyyy-MM" type="month" @change="handleFilter" />
      <el-date-picker v-model="queryList.afterYearMonth" :placeholder="fields.afterYearMonth" class="filter-ele" value-format="yyyy-MM" type="month" @change="handleFilter" />
      <el-button type="primary" class="filter-btn el-icon-search" @click="handleFilter"> 搜索 </el-button>
      <el-dropdown class="avatar-container hover-effect" trigger="click">
        <el-button type="default" class="filter-btn el-icon-document"> 导出 </el-button>
        <el-dropdown-menu slot="dropdown">
          <el-dropdown-item @click.native="exportData(tableData, eHeader, eFields, eFilename)"> 导出EXCEL </el-dropdown-item>
          <el-dropdown-item @click.native="exportData(tableData, eHeader, eFields, eFilename, 'csv')"> 导出CSV </el-dropdown-item>
        </el-dropdown-menu>
      </el-dropdown>
      <el-button type="default" class="filter-btn el-icon-printer" @click="printTable('TableList', eFilename)"> 打印 </el-button>
    </div>
    <TableList id="TableList" :name="queryList.name" :table-data="tableData" :table-loading="tableLoading" />
    <div style="height: 50px" />
  </div>
</template>
<script>
// api
import { salaryApi } from '@/api/salary'
// components
import TableList from './components/tableList'
// data
import { fields } from './modules/fields'
import { eHeader, eFields } from './modules/eList'
// filter
// function
import { subtotal } from './utils/stat_subtotal'
// mixin
import ListMixin from '@/components/Mixins/ListMixin'
import MethodsMixin from '@/components/Mixins/MethodsMixin'
// plugins
import { autoQuery, arrayOrderByField } from 'methods-often/import'
import { printTable } from '@/libs/print'
import { exportData } from '@/libs/export'
// settings
export default {
  name: 'SalaryStat',
  components: { TableList },
  mixins: [ListMixin, MethodsMixin],
  data() {
    return {
      fields,
      autoQuery,
      printTable,
      exportData,
      eHeader,
      eFields,
      nameAry: [],
      companyAry: []
    }
  },
  computed: {
    eFilename() {
      return `${this.queryList.name}医社保明细`
    }
  },
  mounted() {
    this.getAllName()
  },
  methods: {
    getAllName() {
      salaryApi.name().then(({ code, data }) => {
        if (code === 200) {
          const { nameAry, companyAry } = data
          this.nameAry = [...nameAry]
          this.companyAry = [...companyAry]
        }
      })
    },
    startAction() {
      salaryApi.details(this.queryList).then(({ code, data }) => {
        if (code === 200) {
          const { list, count } = data
          const tableData = subtotal(arrayOrderByField(list, 'yearMonth', true))
          this.tableData = tableData
          this.tableDataLength = count
          this.tableLoading = false
        }
      })
    }
  }
}
</script>
<style lang="scss" scoped></style>
