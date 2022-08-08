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
      <el-date-picker
        v-model="queryList.createDate"
        type="daterange"
        class="filter-ele"
        style="width: 370px"
        value-format="yyyy-MM-dd"
        range-separator="至"
        start-placeholder="开始日期"
        end-placeholder="结束日期"
        :picker-options="pickerOptions"
        @change="handleFilter"
      />
      <el-button type="primary" class="filter-btn el-icon-search" @click="handleFilter"> 搜索 </el-button>
      <el-button type="primary" class="filter-btn el-icon-plus" @click="routerGo('create')"> 创建 </el-button>
      <el-dropdown class="avatar-container hover-effect" trigger="click">
        <el-button type="primary" class="filter-btn el-icon-document"> 导出 </el-button>
        <el-dropdown-menu slot="dropdown">
          <el-dropdown-item @click.native="exportData('xlsx')"> 导出EXCEL </el-dropdown-item>
          <el-dropdown-item @click.native="exportData('csv')"> 导出CSV </el-dropdown-item>
        </el-dropdown-menu>
      </el-dropdown>
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
  components: {},
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
