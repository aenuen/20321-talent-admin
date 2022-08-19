<script>
export default {
  methods: {
    onSortChange(data) {
      this.$emit('onSortChange', data)
    },
    onIsUseChange(event, id) {
      this.$emit('onIsUseChange', event, id)
    },
    onRemoveUser(id) {
      this.$emit('onRemoveUser', id)
    },
    onSelectionChange(val) {
      this.$emit('selectionChange', val)
    }
  }
}
</script>
