<script>
export default {
  data() {
    return {
      queryList: {},
      tableData: [],
      tableDataLength: 0,
      tableSort: {},
      defaultTableSort: '+id',
      tableEnable: [],
      tableLoading: true,
      // 单选
      removeId: 0, // 单个删除的ID
      updateId: 0, // 单个编辑的ID
      updateShow: false, // 单个编辑显示
      // 多选
      selectorAry: [], // 多选数组值
      selectorShow: false, // 多选显示
      batchUpdateShow: false // 批量编辑显示
    }
  },
  mounted() {
    this.startHandle()
  },
  beforeRouteUpdate(to, from, next) {
    if (to.path === from.path) {
      const oldQuery = Object.assign({}, from.query)
      const newQuery = Object.assign({}, to.query)
      JSON.stringify(oldQuery) !== JSON.stringify(newQuery) && this.startHandle()
    }
    next()
  },
  created() {
    this.parseQuery()
  },
  methods: {
    // 解析参数
    parseQuery() {
      const query = Object.assign({}, this.$route.query)
      const sort = query && query.sort ? query.sort : this.defaultTableSort
      const pageSet = {
        page: query && query.page ? ~~query.page : 1,
        pageSize: query && query.pageSize ? ~~query.pageSize : 20
      }
      const queryList = { page: 1, pageSize: 10, sort }
      this.queryList = { ...queryList, ...this.setData(), ...query, ...pageSet }
      this.tableSort = { order: sort[0] === '+' ? 'ascending' : 'descending', prop: sort.slice(1, sort.length) }
    },
    // 设置初始值
    setData() {
      return {}
    },
    // 开始处理
    startHandle() {},
    // 处理过滤
    handleFilter() {
      this.queryList.page = 1
      this.refresh()
    },
    // 刷新
    refresh() {
      this.$router.push({ path: this.$route.path, query: this.queryList })
    },
    // 强制刷新
    refreshStrong() {
      this.queryList.timestamp = Math.random() * 1000
      this.refresh()
    },
    // 排序变化
    onSortChange({ prop, order }) {
      this.queryList.sort = (order === 'descending' ? `-` : `+`) + `${prop}`
      this.handleFilter()
    },
    // 单个编辑成功
    aloneUpdateSuccess() {
      this.updateId = 0
      this.updateShow = false
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
    aloneRemove() {},
    // 选中赋值
    selectionChange(val) {
      this.selectorAry = val
    },
    // 批量编辑确认
    batchUpdateConfirm() {
      if (this.selectorAry.length <= 0) {
        this.$message.info('请选择需要批量编辑的内容')
      } else {
        this.batchUpdateToggle(true)
      }
    },
    // 关闭/打开批量编辑框
    batchUpdateToggle(boolean = false) {
      this.batchUpdateShow = boolean
    },
    // 批量编辑成功
    batchUpdateSuccess() {
      this.selectorAry = []
      this.batchUpdateShow = false
      this.refreshStrong()
    },
    // 批量删除确认
    batchRemoveConfirm() {
      if (this.selectorAry.length <= 0) {
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
    // 开始批量删除
    batchRemove() {}
  }
}
</script>
