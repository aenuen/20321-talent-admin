<template>
  <div class="wrap">
    <div>{{ tabName }}</div>
    <div class="btn">
      <el-button class="el-icon-printer" @click="printTable(tabCode, tabName, style)">打印{{ tabName }}</el-button>
    </div>
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
import { printTable } from '@/libs/print'
// settings
export default {
  components: {},
  props: {
    tabName: { type: String, default: '' },
    tabCode: { type: String, default: '' }
  },
  data() {
    return {
      printTable,
      style: '.tableHeader {width:100%;padding: 20px 0;ine-height: 20px;font-size: 14px;color: #aaa;display: flex;}.tableHeader div {flex: 1;text-align: center;}table tr td,th{border-collapse:collapse;padding:4px;border:1px #000 solid;text-align:center}'
    }
  }
}
</script>
<style lang="scss" scoped>
.wrap {
  padding: 40px 0 20px;
  line-height: 20px;
  text-align: center;
  font-weight: bold;
  font-size: 18px;
  position: relative;
  .btn {
    position: absolute;
    top: 32px;
    right: 0;
  }
}
</style>
