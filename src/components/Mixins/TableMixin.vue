<script>
export default {
  methods: {
    onSortChange(data) {
      this.$emit('onSortChange', data)
    },
    onIsUseChange(event, id) {
      this.$emit('onIsUseChange', event, id)
    },
    onAloneRemove(id) {
      this.$emit('onAloneRemove', id)
    },
    onSelectionChange(val) {
      this.$emit('selectionChange', val)
    },
    onUpdateRow(row) {
      this.$emit('onUpdateRow', row.id)
    }
  }
}
</script>
