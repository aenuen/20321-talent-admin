<script>
export default {
  data() {
    return {
      multipleSelection: [],
      batchUpdateControl: false
    }
  },
  methods: {
    selectionChange(val) {
      this.multipleSelection = val
    },
    batchUpdate() {
      if (this.multipleSelection.length > 0) {
        this.$message.info('请选择需要批量编辑的内容')
      } else {
        this.batchUpdateControl = true
      }
    },
    batchRemoveConfirm() {
      if (this.multipleSelection === []) {
        this.$message.info('请选择需要批量删除的内容', '温馨提示', {
          type: 'warning'
        })
      } else {
        this.$confirm('删除后将无法恢复，确定继续批量删除吗？', '温馨提示', {
          type: 'warning'
        })
          .then(() => {
            this.batchRemove()
          })
          .catch(() => {
            this.$message.info('取消批量删除')
          })
      }
    },
    batchRemove() {}
  }
}
</script>
