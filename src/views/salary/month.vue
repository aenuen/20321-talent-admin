<template>
  <div class="app-container">
    <div class="filter-container">
      <div class="filter-work">
        <div class="left">
          <!-- 公司搜索 -->
          <el-select v-model="queryList.company" filterable class="filter-ele" :placeholder="fields.company" @change="handleFilter">
            <el-option v-for="item in companyAry" :key="item.value" :label="item.value" :value="item.value" />
          </el-select>
          <!-- 年月搜索 -->
          <el-date-picker v-model="queryList.yearMonth" :placeholder="fields.yearMonth" class="filter-ele" value-format="yyyy-MM" type="month" @change="handleFilter" />
          <!-- 增加月表员工 -->
          <el-button class="filter-btn el-icon-plus" style="width: auto" @click="personnelShow = true"> 增加月表员工 </el-button>
          <!-- 显示多显 -->
          <el-checkbox v-model="selectorShow" style="margin-left: 10px">显示多显</el-checkbox>
          <!-- 批量编辑 -->
          <el-button v-if="selectorShow" type="success" class="filter-btn el-icon-edit" style="width: auto" @click="batchUpdateConfirm"> 批量编辑 </el-button>
          <!-- 批量删除 -->
          <el-button v-if="selectorShow" type="danger" class="filter-btn el-icon-delete" style="width: auto" @click="batchRemoveConfirm"> 批量删除 </el-button>
          <el-checkbox v-model="removeShow" style="margin-left: 10px">显示删除</el-checkbox>
        </div>
        <div class="right">
          <!-- 个税及打印 -->
          <HeaderButtons :tab-name="tabName" :tab-id="tabId" @onEditTax="taxShow = true" />
        </div>
      </div>
      <!-- 增加月表员工 -->
      <Dialog :control="personnelShow" title="增加月表人员" :width="630" @controlChange="personnelShow = false">
        <MonthAddPer :month-data="tableData" :company="queryList.company" :year-month="queryList.yearMonth" @onMonthAddPer="onMonthAddPer" />
      </Dialog>
      <!-- 编辑月表员工 -->
      <Dialog :control="updateShow" title="编辑月表人员" :width="990" @controlChange="updateShow = false">
        <Detail :month-id="monthId" @aloneUpdateSuccess="aloneUpdateSuccess" />
      </Dialog>
      <!-- 批量编辑月表员工 -->
      <Dialog :control="batchUpdateShow" title="批量编辑月表人员" :width="990" @controlChange="batchUpdateShow = false">
        <Detail is-batch :m-select-ary="selectorAry" @batchUpdateSuccess="batchUpdateSuccess" />
      </Dialog>
      <!-- 编辑个人所得税 -->
      <Dialog :control="taxShow" title="编辑个人所得税" :width="990" :fullscreen="true" @controlChange="taxShow = false">
        <IncomeTax :table-data="tableData" @incomeTaxSuccess="incomeTaxSuccess" />
      </Dialog>
    </div>
    <!-- 签标切换 -->
    <el-tabs v-model="queryList.tabPosition" type="border-card" @tab-click="tabsClick">
      <el-tab-pane label="工资发放表" name="grant">
        <!-- 工资发放表 -->
        <div id="grant">
          <HeaderTitle :company="queryList.company" :year-month="queryList.yearMonth" />
          <monthGrant :table-data="tableData" :year-month="queryList.yearMonth" :selector-show="selectorShow" :remove-show="removeShow" @onAloneRemove="onAloneRemove" @onAloneDblclick="onAloneDblclick" @selectionChange="selectionChange" />
        </div>
      </el-tab-pane>
      <el-tab-pane label="社保医保单位分配表" name="social"> </el-tab-pane>
      <el-tab-pane label="社保医保统计表" name="socialTeam" :disabled="queryList.company === '居乐'"> </el-tab-pane>
      <el-tab-pane label="个人所得税申报表" name="income"> </el-tab-pane>
      <el-tab-pane label="工资计提表" name="wages"></el-tab-pane>
      <el-tab-pane label="工资计提统计表" name="wagesTeam" :disabled="queryList.company === '居乐'"></el-tab-pane>
    </el-tabs>
  </div>
</template>
<script>
// api
import { salaryApi } from '@/api/salary'
// components
import Dialog from '@/components/Dialog'
import MonthAddPer from './components/monthAddPer'
import monthGrant from './components/monthGrant.vue'
import Detail from './components/detail.vue'
import HeaderButtons from './components/headerButtons.vue'
import HeaderTitle from './components/headerTitle.vue'
import IncomeTax from './components/incomeTax.vue'
// data
import { fields } from './modules/fields'
// filter
// function
import { usedParseOnly } from './utils/usedParse'
import { monthData } from './utils/monthData'
// mixin
import ListMixin from '@/components/Mixins/ListMixin'
// plugins
import { timeGetYearMonth } from 'methods-often/import'
// settings
export default {
  components: { Dialog, MonthAddPer, monthGrant, Detail, HeaderButtons, HeaderTitle, IncomeTax },
  mixins: [ListMixin],
  data() {
    return {
      fields,
      companyAry: [],
      monthId: 0,
      personnelShow: false,
      selectorShow: false,
      removeShow: false,
      taxShow: false,
      tabName: '工资放发表',
      tabId: 'grant'
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
      this.tabName = tab.label
      this.tableId = tab.name
      this.refreshStrong()
    },
    // 获取月表数据
    startHandle() {
      salaryApi.monthList(this.queryList).then(({ code, data, msg }) => {
        if (code === 200) {
          this.tableData = [...monthData(data)]
        } else {
          this.$message.warning(msg)
        }
      })
    },
    // 增加公司员工成功
    onMonthAddPer() {
      this.personnelShow = false
      this.refreshStrong()
    },
    incomeTaxSuccess() {
      this.taxShow = false
      this.refreshStrong()
    },
    // 单个删除
    aloneRemove() {
      salaryApi.monthRemove({ id: this.removeId }).then(({ code, msg }) => {
        if (code === 200) {
          this.$message.success(msg)
          this.refreshStrong()
        } else {
          this.$message.error(msg)
        }
      })
    },
    // 批量删除
    batchRemove() {
      salaryApi.monthBatchRemove({ ids: this.selectorAry }).then(({ code, msg }) => {
        if (code === 200) {
          this.$message.success(msg)
          this.refreshStrong()
        } else {
          this.$message.error(msg)
        }
      })
    },
    // 双击行编辑
    onAloneDblclick(id) {
      this.updateShow = true
      this.monthId = id
    }
  }
}
</script>
<style lang="scss" scoped>
.filter-work {
  display: flex;
  justify-content: space-between; /* 横向中间自动空间 */
}
</style>
