<template>
  <el-dialog v-if="batchUpdateControl" title="批量编辑" width="815px" :visible.sync="batchUpdateControl">
    <slot />
  </el-dialog>
</template>
<script>
export default {
  data() {
    return {
      multipleSelection: [],
      batchUpdateShow: false
    }
  },
  methods: {
    // 选中赋值
    selectionChange(val) {
      this.multipleSelection = val
    },
    // 批量编辑确认
    updateBatchConfirm() {
      if (this.multipleSelection.length <= 0) {
        this.$message.info('请选择需要批量编辑的内容')
      } else {
        this.batchUpdateToggle(true)
      }
    },
    // 关闭/打开批量编辑框
    batchUpdateToggle(boolean = false) {
      this.batchUpdateShow = boolean
    },
    // 批量删除确认
    removeBatchConfirm() {
      if (this.multipleSelection.length <= 0) {
        this.$message.info('请选择需要批量删除的内容', '温馨提示', {
          type: 'warning'
        })
      } else {
        this.$confirm('删除后将无法恢复，确定继续批量删除吗？', '温馨提示', {
          type: 'warning'
        })
          .then(() => {
            this.removeBatch()
          })
          .catch(() => {
            this.$message.info('取消批量删除')
          })
      }
    },
    // 开始批量删除
    removeBatch() {}
  }
}
</script>
