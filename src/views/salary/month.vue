<template>
  <div class="app-container">
    <div class="filter-container">
      <!-- 公司搜索 -->
      <el-select v-model="queryList.company" filterable class="filter-ele" :placeholder="fields.company" @change="handleFilter">
        <el-option v-for="item in companyAry" :key="item.value" :label="item.value" :value="item.value" />
      </el-select>
      <!-- 年月搜索 -->
      <el-date-picker v-model="queryList.yearMonth" :placeholder="fields.yearMonth" class="filter-ele" value-format="yyyy-MM" type="month" :clearable="false" @change="handleFilter" />
      <el-button class="filter-btn el-icon-plus" style="width: auto" @click="personnelShow = true"> 增加月表人数 </el-button>
      <el-checkbox v-model="selectionShow" style="margin-left: 10px">显示批量编辑</el-checkbox>
      <el-checkbox v-model="removeShow" style="margin-left: 10px">显示删除</el-checkbox>
    </div>
    <!-- 增加月表人员 -->
    <Dialog v-if="personnelShow" :control="personnelShow" title="增加月表人员" :width="630" @controlChange="personnelShow = false">
      <MonthPersonal :month-data="tableData" :company="queryList.company" :year-month="queryList.yearMonth" />
    </Dialog>
    <!-- 编辑月表人员 -->
    <Dialog v-if="updateShow" :control="updateShow" title="编辑月表人员" :width="990" @controlChange="updateShow = false">
      <Detail :month-id="monthId" @onUpdateSuccess="updateShow = false" />
    </Dialog>
    <!-- 签标 -->
    <el-tabs v-model="queryList.tabPosition" type="border-card" @tab-click="tabsClick">
      <el-tab-pane label="工资发放表" name="grant">
        <MonthTable :table-data="tableData" :selection-show="selectionShow" :remove-show="removeShow" @onUpdateRow="onUpdateRow" />
      </el-tab-pane>
      <el-tab-pane label="社保医保单位分配表" name="social"> </el-tab-pane>
      <el-tab-pane label="个人所得税申报表" name="income"> </el-tab-pane>
      <el-tab-pane label="工资计提表" name="wages"></el-tab-pane>
    </el-tabs>
  </div>
</template>
<script>
// api
import { salaryApi } from '@/api/salary'
// components
import Dialog from '@/components/Dialog'
import MonthPersonal from './components/monthPersonal'
import MonthTable from './components/monthTable.vue'
import Detail from './components/detail.vue'
// data
import { fields } from './modules/fields'
// filter
// function
import { usedParseOnly } from './utils/usedParse'
import { monthData } from './utils/monthData'
// mixin
import ListMixin from '@/components/Mixins/ListMixin'
import AloneMixin from '@/components/Mixins/AloneMixin'
import BatchMixin from '@/components/Mixins/BatchMixin'
// plugins
import { timeGetYearMonth } from 'methods-often/import'
// settings
export default {
  components: { Dialog, MonthPersonal, MonthTable, Detail },
  mixins: [ListMixin, AloneMixin, BatchMixin],
  data() {
    return {
      fields,
      companyAry: [],
      personnelShow: false,
      updateShow: false,
      monthId: 0,
      selectionShow: false,
      removeShow: false
    }
  },
  mounted() {
    this.getUsed()
  },
  methods: {
    // 设置数据
    setData() {
      return {
        company: '尚德',
        yearMonth: timeGetYearMonth(),
        tabPosition: 'grant'
      }
    },
    // 获取使用过的数据
    getUsed() {
      salaryApi.used({ company: 1 }).then(({ code, data }) => {
        if (code === 200) {
          this.companyAry = [...usedParseOnly(data.company)]
        }
      })
    },
    // 标签切换
    tabsClick(tab) {
      this.queryList.tabPosition = tab.name
      this.refresh()
    },
    // 获取月表数据
    startHandle() {
      salaryApi.month(this.queryList).then(({ code, data, msg }) => {
        if (code === 200) {
          this.tableData = [...monthData(data)]
        } else {
          this.$message.warning(msg)
        }
      })
    },
    // 双击行编辑
    onUpdateRow(id) {
      this.updateShow = true
      this.monthId = id
    }
  }
}
</script>
<style lang="scss" scoped></style>
