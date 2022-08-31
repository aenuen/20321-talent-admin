<template>
  <div style="text-align: right">
    <el-button class="el-icon-edit" @click="onEditTax">编辑个人所得税</el-button>
    <el-button class="el-icon-printer">打印{{ tableName }}</el-button>
  </div>
</template>
<script>
// api
// components
// data
// filter
// function
// mixin
// plugins
// settings
export default {
  components: {},
  props: {
    tableName: { type: String, default: '' }
  },
  data() {
    return {}
  },
  methods: {
    onEditTax() {
      this.$emit('onEditTax')
    }
  }
}
</script>
<style lang="scss" scoped></style>
