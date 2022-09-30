<template>
  <div class="app-container">
    <div class="filter-container">
      <el-button @click="addInvoice">增加发票</el-button>
    </div>
    <el-table :key="1" :loading="tableLoading" :data="tableData" border fit highlight-current-row style="width: 100%" :default-sort="tableSort" @sort-change="onSortChange" @selection-change="onSelectorChange">
      <template slot="empty">
        <el-empty :image-size="100" description="未能找到符合条件的数据" />
      </template>
    </el-table>
  </div>
</template>
<script>
// api
import { caseApi } from '@/api/case'
// components
// data
// filter
// function
// mixin
import ListMixin from '@/components/Mixins/ListMixin'
// plugins
// settings
export default {
  components: {},
  mixins: [ListMixin],
  props: {
    id: { type: Number, default: 0 }
  },
  data() {
    return {}
  },
  methods: {
    addInvoice() {
      this.$emit('onAddInvoice')
    },
    startHandle() {
      caseApi.invoiceList({ id: this.id }).then(({ code, data }) => {
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
