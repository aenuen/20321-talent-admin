<template>
  <el-table :key="1" :loading="tableLoading" :data="tableData" border fit highlight-current-row style="width: 100%" @selection-change="onSelectionChange">
    <template slot="empty">
      <el-empty :image-size="100" :description="emptyText" />
    </template>
    <el-table-column type="selection" width="50" align="center" />
    <el-table-column type="index" :label="fields.index" width="50" align="center" />
    <el-table-column prop="name" :label="fields.name" align="center" />
    <el-table-column prop="department" :label="fields.department" align="center" />
    <el-table-column prop="team" :label="fields.team" align="center" />
    <el-table-column label="工资统计" align="center">
      <el-table-column prop="basePay" :label="fields.basePay" align="center" />
      <el-table-column prop="meritPay" :label="fields.meritPay" align="center" />
      <el-table-column prop="onePay" :label="fields.subtotal" align="center" />
      <el-table-column prop="assessment" :label="fields.assessment" align="center" />
      <el-table-column prop="shouldPay" :label="fields.shouldPay" align="center" />
    </el-table-column>
    <el-table-column label="应扣、补贴" align="center">
      <el-table-column label="缺勤扣款" align="center">
        <el-table-column :label="fields.days" align="center">
          <template slot-scope="{ row: { days } }">
            <span>{{ days || 0 }}</span>
          </template>
        </el-table-column>
        <el-table-column :label="fields.deduct" align="center">
          <template slot-scope="{ row: { deduct } }">
            <span>{{ deduct || 0 }}</span>
          </template>
        </el-table-column>
      </el-table-column>
      <el-table-column prop="subsidy" :label="fields.subsidy" align="center" />
      <el-table-column prop="twoPay" :label="fields.subtotal" align="center" />
    </el-table-column>
    <el-table-column label="代扣代缴" align="center">
      <el-table-column :label="fields.myPension" align="center">
        <el-table-column prop="myPension" :label="fields.personal" align="center" />
      </el-table-column>
      <el-table-column :label="fields.myUnemployment" align="center">
        <el-table-column prop="myUnemployment" :label="fields.personal" align="center" />
      </el-table-column>
      <el-table-column :label="fields.myUnemployment" align="center">
        <el-table-column prop="myMedicalCare" :label="fields.personal" align="center" />
      </el-table-column>
      <el-table-column :label="fields.myAccumulationFund" align="center">
        <el-table-column prop="myAccumulationFund" :label="fields.personal" align="center" />
      </el-table-column>
      <el-table-column :label="fields.myIncomeTax" align="center">
        <el-table-column prop="myIncomeTax" :label="fields.personal" align="center" />
      </el-table-column>
      <el-table-column prop="twoPay" :label="fields.subtotal" align="center" />
    </el-table-column>
  </el-table>
</template>
<script>
// api
// components
// data
import { fields } from '../modules/fields'
// filter
// function
// mixin
import TableMixin from '@/components/Mixins/TableMixin'
// plugins
// settings
export default {
  name: 'SalaryComponentsMonthTable',
  components: {},
  mixins: [TableMixin],
  props: {
    tableData: { type: Array, default: () => [] },
    tableLoading: { type: Boolean, default: () => true }
  },
  data() {
    return {
      fields
    }
  },
  computed: {
    emptyText() {
      return '未能找到符合条件的数据'
    }
  }
}
</script>
<style lang="scss" scoped></style>
