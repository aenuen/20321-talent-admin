<template>
  <el-table :key="1" :loading="tableLoading" :data="tableData" border fit highlight-current-row style="width: 100%">
    <el-table-column :label="fields.id" prop="id" align="center" />
    <el-table-column :label="fields.createDate" align="center">
      <template slot-scope="{ row: { createTimestamp } }">
        <span>{{ createTimestamp | dateFilter }}</span>
      </template>
    </el-table-column>
    <el-table-column :label="fields.type" align="center">
      <template slot-scope="{ row: { type } }">
        <span v-html="type" />
      </template>
    </el-table-column>
    <el-table-column :label="fields.caseName" align="center">
      <template slot-scope="{ row: { caseName } }">
        <span v-html="caseName" />
      </template>
    </el-table-column>
    <el-table-column :label="fields.caseNumber" align="center">
      <template slot-scope="{ row: { caseNumber } }">
        <span v-html="caseNumber" />
      </template>
    </el-table-column>
    <el-table-column :label="fields.client" align="center" :width="350">
      <template slot-scope="{ row: { client } }">
        <span v-html="client" />
      </template>
    </el-table-column>
    <el-table-column :label="fields.createRealName" align="center">
      <template slot-scope="{ row: { createRealName } }">
        <span v-html="createRealName" />
      </template>
    </el-table-column>
    <el-table-column :label="fields.price" align="center">
      <template slot-scope="{ row: { price } }">
        <span>{{ price }}</span>
      </template>
    </el-table-column>
    <el-table-column :label="fields.invoiceDate" align="center">
      <template slot-scope="{ row: { invoiceDate, price } }">
        <span v-if="+price === 0">--</span>
        <span v-else>{{ invoiceDate || '--' }}</span>
      </template>
    </el-table-column>
    <el-table-column :label="fields.enterDate" align="center">
      <template slot-scope="{ row: { enterDate } }">
        <span>{{ enterDate || '--' }}</span>
      </template>
    </el-table-column>
    <el-table-column :label="fields.enterPrice" align="center">
      <template slot-scope="{ row: { enterPrice } }">
        <span>{{ enterPrice }}</span>
      </template>
    </el-table-column>
  </el-table>
</template>

<script>
// api
// components
// data
import { fields } from '../modules/fields'
import noneImage from '@/assets/image/noneImage.png'
// filter
import { dateFilter } from '@/libs/filter'
// function
// mixin
import TableMixin from '@/components/Mixins/TableMixin'
// plugins
// settings
export default {
  name: 'ListTable',
  filters: {
    dateFilter
  },
  mixins: [TableMixin],
  props: {
    tableLoading: Boolean,
    tableData: { type: Array, default: () => [] }
  },
  data() {
    return {
      fields,
      noneImage
    }
  },
  methods: {
    // 确定原件已收到
    onSureDelivery(id) {
      this.$confirm('请确认原件已收到了吗？', '温馨提示', {
        confirmButtonText: '确认',
        cancelButtonText: '取消',
        type: 'warning'
      })
        .then(() => {
          this.$emit('onSureDelivery', id)
        })
        .catch(() => {
          this.$message.info('取消确认原件已收到')
        })
    },
    onManager(id, caseName, caseNumber) {
      this.$emit('onManager', id, caseName, caseNumber)
    }
  }
}
</script>
