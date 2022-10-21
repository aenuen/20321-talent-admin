<template>
  <div class="app-container">
    <div class="filter-container">
      <el-button type="success" @click="addInvoice">增加发票</el-button>
    </div>
    <el-table :key="1" :loading="tableLoading" :data="tableData" border fit highlight-current-row show-summary :summary-method="(p) => summaryMethod(p, ['inHave', 'inRate', 'inNot', 'enterPrice'])" style="width: 100%">
      <template slot="empty">
        <el-empty :image-size="100" description="未能找到符合条件的数据" />
      </template>
      <el-table-column :label="fields.invoiceDate" prop="invoiceDate" align="center" />
      <el-table-column :label="fields.inType" prop="inType" align="center" />
      <el-table-column :label="fields.inNumber" prop="inNumber" align="center" />
      <el-table-column :label="fields.inHave" prop="inHave" align="center" />
      <el-table-column :label="fields.inTax" align="center">
        <template slot-scope="{ row: { inTax } }">{{ inTax }}%</template>
      </el-table-column>
      <el-table-column :label="fields.inRate" prop="inRate" align="center" />
      <el-table-column :label="fields.inNot" prop="inNot" align="center" />
      <el-table-column :label="fields.enterDate" prop="enterDate" align="center">
        <template slot-scope="{ row: { enterDate } }">{{ enterDate || '--' }}</template>
      </el-table-column>
      <el-table-column :label="fields.enterPrice" prop="enterPrice" align="center">
        <template slot-scope="{ row: { enterPrice } }">{{ enterPrice || '--' }}</template>
      </el-table-column>
      <el-table-column :label="fields.work" align="center" width="180">
        <template slot-scope="{ row: { id } }">
          <el-button type="primary" icon="el-icon-d-arrow-right" size="mini" @click="invoiceEnter(id)" />
          <el-button type="danger" icon="el-icon-delete" size="mini" @click="invoiceRemove(id)" />
        </template>
      </el-table-column>
    </el-table>
  </div>
</template>
<script>
// api
import { caseApi } from '@/api/case'
// components
// data
import { fields } from '../modules/fields'
// filter
// function
// mixin
import ListMixin from '@/components/Mixins/ListMixin'
// plugins
import { summaryMethod } from 'methods-often/import'
// settings
export default {
  components: {},
  mixins: [ListMixin],
  props: {
    caseId: { type: Number, default: 0 }
  },
  data() {
    return {
      fields,
      summaryMethod
    }
  },
  methods: {
    addInvoice() {
      this.$emit('onAddInvoice')
    },
    startHandle() {
      caseApi.invoiceList({ id: this.caseId }).then(({ code, data }) => {
        if (code === 200) {
          this.tableData = data
          this.tableLoading = false
        }
      })
    },
    invoiceSuccess(invoice) {
      this.tableData.unshift(invoice)
    },
    invoiceEnter(id, cid) {
      this.$emit('onInvoiceEnter', id, cid)
    },
    invoiceRemove(id) {
      this.$confirm('删除后将无法恢复，确定继续删除吗？', '温馨提示', {
        type: 'warning'
      })
        .then(() => {
          caseApi.invoiceRemove({ id }).then(({ code, msg }) => {
            if (code === 200) {
              this.$message.success(msg)
              this.tableLoading = true
              this.startHandle()
            }
          })
        })
        .catch(() => {
          this.removeId = 0
          this.$message.info('取消删除')
        })
    }
  }
}
</script>
<style lang="scss" scoped></style>
