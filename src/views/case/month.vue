<!--
 * @Author: abbott
 * @Date: 2022-09-09 15:31:00
 * @LastEditors: abbott
 * @LastEditTime: 2022-11-10 17:17:16
 * @Description:
-->
<template>
  <div class="app-container">
    <div class="filter-container">
      <!-- 年月搜索 -->
      <el-date-picker v-model="queryList.yearMonth" placeholder="请输入" class="filter-ele" value-format="yyyy-MM" type="month" :clearable="false" @change="handleFilter" />
      <el-button class="filter-btn el-icon-printer" style="width: auto" @click="printTable('monthContent', exportFilename)">打印{{ exportFilename }}</el-button>
    </div>
    <div id="monthContent">
      <div class="lawyer">
        <el-tabs v-model="queryList.tabsCurrent" tab-position="left" @tab-click="tabsClick">
          <el-tab-pane v-for="(item, index) in lawyers" :key="index" :label="item" :name="String(index + 1)" />
        </el-tabs>
      </div>
      <div class="content">
        <Header :name="queryList.tabsName" :year-month="queryList.yearMonth" :year="+nowYear" :month-number="monthNumber" />
        <MonthList :table-data="tableData" :table-loading="tableLoading" />
      </div>
    </div>
  </div>
</template>
<script>
// api
// components
import Header from './monthCom/header'
import MonthList from './monthCom/monthList'
// data
import { fields } from './modules/fields'
import { lawyers } from './modules/lawyers'
// filter
// function
import { caseCalc } from './monthCom/caseCalc'
import { insurance } from './monthCom/insurance'
// mixin
import ListMixin from '@/components/Mixins/ListMixin'
import Output from '@/components/Mixins/Output'
// plugins
import { timeGetYearMonth, timeFormat } from 'methods-often/import'
// settings
export default {
  name: 'CaseMonth',
  components: { Header, MonthList },
  mixins: [ListMixin, Output],
  data() {
    return {
      fields,
      lawyers,
      monthData: {}
    }
  },
  computed: {
    exportFilename() {
      return `${this.queryList.yearMonth}${this.queryList.tabsName}律师统计表`
    },
    nowYear() {
      return ~~timeFormat(`${this.queryList.yearMonth}-01`, '{y}')
    },
    monthNumber() {
      const month = ~~timeFormat(`${this.queryList.yearMonth}-01`, '{m}')
      return this.nowYear === 2021 ? month - 5 : month
    }
  },
  created() {
    if (!this.queryList.tabsName) {
      this.queryList.tabsCurrent = String(1)
      this.queryList.tabsName = this.lawyers[0]
    }
  },
  methods: {
    // 设置数据
    setData() {
      return {
        yearMonth: timeGetYearMonth()
      }
    },
    // tabs点击事件
    tabsClick(tabs) {
      this.queryList.tabsCurrent = tabs.name
      this.queryList.tabsName = tabs.label
      this.refresh()
    },
    // 获取案件列表
    async startHandle() {
      const result = await caseCalc(this.queryList.yearMonth, this.queryList.tabsName)
      this.tableData = result.list
      this.tableLoading = false
      this.monthData = {
        ...this.monthData,
        ...{
          totalPrice: result.price,
          enterPrice: result.enter
        }
      }
      this.insurance()
    },
    // 获取保险列表
    async insurance() {
      const result = await insurance(this.queryList.yearMonth, this.queryList.tabsName)
      console.log('🚀 ~ file: month.vue ~ line 105 ~ insurance ~ result', result)
    }
  }
}
</script>
<style lang="scss" scoped>
#monthContent {
  width: 100%;
  display: flex;
  .lawyer {
    width: 110px;
  }
  .content {
    flex: 1;
  }
}
</style>
