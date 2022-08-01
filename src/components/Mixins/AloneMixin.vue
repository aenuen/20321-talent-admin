<script>
export default {
  components: {},
  data() {
    return {
      removeId: 0
    }
  },
  methods: {
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
    aloneRemove() {}
  }
}
</script>

<style></style>
