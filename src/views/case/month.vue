<!--
 * @Author: abbott
 * @Date: 2022-09-09 15:31:00
 * @LastEditors: abbott
 * @LastEditTime: 2022-11-10 17:17:16
 * @Description:
-->
<template>
  <div class="app-container">
    <div class="filter-container">
      <!-- 年月搜索 -->
      <el-date-picker v-model="queryList.createYearMonth" :placeholder="fields.createYearMonth" class="filter-ele" value-format="yyyy-MM" type="month" @change="handleFilter" />
    </div>
  </div>
</template>
<script>
// api
// components
// data
import { fields } from './modules/fields'
// filter
// function
// mixin
import ListMixin from '@/components/Mixins/ListMixin'
import Output from '@/components/Mixins/Output'
// plugins
// settings
export default {
  components: {},
  mixins: [ListMixin, Output],
  data() {
    return {
      fields
    }
  }
}
</script>
<style lang="scss" scoped></style>
