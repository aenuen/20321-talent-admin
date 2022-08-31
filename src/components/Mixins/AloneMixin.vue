<script>
export default {
  components: {},
  data() {
    return {
      removeId: 0,
      updateId: 0
    }
  },
  methods: {
    // 单个编辑
    onAloneUpdate() {
      this.updateId = 0
      this.refreshStrong()
    },
    // 单个删除
    onAloneRemove(id) {
      this.removeId = id
      this.aloneRemoveConfirm()
    },
    // 单个删除确定
    aloneRemoveConfirm() {
      this.$confirm('删除后将无法恢复，确定继续删除吗？', '温馨提示', {
        type: 'warning'
      })
        .then(() => {
          this.aloneRemove()
        })
        .catch(() => {
          this.removeId = 0
          this.$message.info('取消删除')
        })
    },
    // 个人删除处理
    aloneRemove() {}
  }
}
</script>

<style></style>
