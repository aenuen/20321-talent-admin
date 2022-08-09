<template>
  <div class="app-container">
    <div class="filter-container">
      <el-autocomplete
        v-model="queryList.name"
        :fetch-suggestions="(q, c) => autoQuery(q, c, nameAry)"
        :placeholder="fields.name"
        clearable
        class="filter-ele"
        @clear="handleFilter"
        @select="handleFilter"
      />
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
// mixin
import ListMixin from '@/components/Mixins/ListMixin'
import MethodsMixin from '@/components/Mixins/MethodsMixin'
// plugins
import { autoQuery } from 'methods-often/import'
// settings
export default {
  name: 'SalaryStat',
  mixins: [ListMixin, MethodsMixin],
  data() {
    return {
      fields,
      autoQuery,
      nameAry: []
    }
  },
  mounted() {
    this.getAllName()
  },
  methods: {
    getAllName() {
      salaryApi.name().then(({ code, data }) => {
        if (code === 200) {
          this.nameAry = [...data]
        }
      })
    }
  }
}
</script>
<style lang="scss" scoped></style>
