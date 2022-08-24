<template>
  <el-table :key="1" :data="tableData" border fit highlight-current-row style="width: 100%" @selection-change="onSelectionChange" @row-dblclick="onUpdateRow">
    <template slot="empty">
      <el-empty :image-size="100" :description="emptyText" />
    </template>
    <el-table-column v-if="selectionShow" type="selection" width="65" align="center" />
    <el-table-column v-if="!removeShow" type="index" :label="fields.index" width="65" align="center" />
    <el-table-column v-if="removeShow" :label="fields.work" align="center" width="65" fixed="left">
      <template slot-scope="{ row: { id } }">
        <el-button type="danger" icon="el-icon-delete" size="mini" @click="onAloneRemove(id)" />
      </template>
    </el-table-column>
    <el-table-column prop="name" :label="fields.name" align="center" />
    <el-table-column prop="department" :label="fields.department" align="center" />
    <el-table-column prop="team" :label="fields.team" align="center" />
    <el-table-column label="工资统计" align="center">
      <el-table-column prop="basePay" label="基本" align="center" />
      <el-table-column prop="meritPay" label="绩效" align="center" />
      <el-table-column prop="onePay" :label="fields.subtotal" align="center" />
    </el-table-column>
    <el-table-column label="扣款、补贴" align="center">
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
      <el-table-column :label="fields.myMedicalCare" align="center">
        <el-table-column prop="myMedicalCare" :label="fields.personal" align="center" />
      </el-table-column>
      <el-table-column :label="fields.myAccumulationFund" align="center">
        <el-table-column prop="myAccumulationFund" :label="fields.personal" align="center" />
      </el-table-column>
      <el-table-column :label="fields.myIncomeTax" align="center">
        <el-table-column prop="myIncomeTax" :label="fields.personal" align="center" />
      </el-table-column>
      <el-table-column prop="therePay" :label="fields.subtotal" align="center" />
    </el-table-column>
    <el-table-column prop="fourPay" label="实发工资" align="center" />
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
    selectionShow: Boolean,
    removeShow: Boolean
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
