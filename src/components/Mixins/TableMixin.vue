<script>
export default {
  methods: {
    // 排序变化
    onSortChange(data) {
      this.$emit('onSortChange', data)
    },
    // 状态变化
    onIsUseChange(event, id) {
      this.$emit('onIsUseChange', event, id)
    },
    // 单个删除
    onAloneRemove(id) {
      this.$emit('onAloneRemove', id)
    },
    // 单个编辑
    onAloneUpdate(id) {
      this.$emit('onAloneUpdate', id)
    },
    // 多选变化
    onSelectionChange(val) {
      this.$emit('selectionChange', val)
    },
    // 双击事件
    onAloneDblclick(row) {
      this.$emit('onAloneDblclick', row.id)
    },
    // 双击编辑
    onUpdateRow(row) {
      this.$emit('onUpdateRow', row.id)
    }
  }
}
</script>
