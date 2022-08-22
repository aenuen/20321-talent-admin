<template>
  <div class="app-container">
    <div class="filter-container">
      <!-- 公司搜索 -->
      <el-select v-model="queryList.company" filterable class="filter-ele" :placeholder="fields.company" @change="handleFilter">
        <el-option v-for="item in companyAry" :key="item.value" :label="item.value" :value="item.value" />
      </el-select>
      <el-date-picker v-model="queryList.yearMonth" :placeholder="fields.yearMonth" class="filter-ele" value-format="yyyy-MM" type="month" :clearable="false" @change="handleFilter" />
    </div>
  </div>
</template>
<script>
// api
import { salaryApi } from '@/api/salary'
// components
// data
import { fields } from './modules/fields'
// filter
// function
import { usedParseOnly } from './utils/usedParse'
// mixin
import ListMixin from '@/components/Mixins/ListMixin'
import AloneMixin from '@/components/Mixins/AloneMixin'
import BatchMixin from '@/components/Mixins/BatchMixin'
// plugins
import { timeGetYearMonth } from 'methods-often/import'
// settings
export default {
  components: {},
  mixins: [ListMixin, AloneMixin, BatchMixin],
  data() {
    return {
      fields,
      companyAry: []
    }
  },
  mounted() {
    this.getUsed()
  },
  methods: {
    // 设置数据
    setData() {
      return {
        company: '尚德',
        yearMonth: timeGetYearMonth()
      }
    },
    // 获取使用过的数据
    getUsed() {
      salaryApi.used({ company: 1 }).then(({ code, data }) => {
        if (code === 200) {
          this.companyAry = [...usedParseOnly(data.company)]
        }
      })
    }
  }
}
</script>
<style lang="scss" scoped></style>
