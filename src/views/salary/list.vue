<template>
  <div class="app-container">
    <div class="filter-container">
      <!-- 姓名搜索 -->
      <el-select v-model="queryList.name" filterable class="filter-ele" :placeholder="fields.name" clearable @change="handleFilter">
        <el-option v-for="item in nameAry" :key="item.value" :label="item.value" :value="item.value" />
      </el-select>
      <!-- 公司搜索 -->
      <el-select v-model="queryList.company" filterable class="filter-ele" :placeholder="fields.company" clearable @change="handleFilter">
        <el-option v-for="item in companyAry" :key="item.value" :label="item.value" :value="item.value" />
      </el-select>
      <!-- 部门搜索 -->
      <el-select v-model="queryList.department" filterable class="filter-ele" :placeholder="fields.department" clearable @change="handleFilter">
        <el-option v-for="item in departmentAry" :key="item.value" :label="item.label" :value="item.value" />
      </el-select>
      <!-- 项目组搜索 -->
      <el-select v-model="queryList.team" filterable class="filter-ele" :placeholder="fields.team" clearable @change="handleFilter">
        <el-option v-for="item in teamAry" :key="item.value" :label="item.label" :value="item.value" />
      </el-select>
      <!-- 状态搜索 -->
      <el-select v-model="queryList.isUse" class="filter-ele" :placeholder="`${fields['isUse']}`" clearable @clear="handleFilter" @change="handleFilter">
        <el-option v-for="(item, key) in defineIsUseAry" :key="key" :value="item.value" :label="item.label" />
      </el-select>
      <el-button class="filter-btn el-icon-search" type="primary" style="width: auto" @click="handleFilter"> 查询 </el-button>
      <el-button class="filter-btn el-icon-plus" type="primary" style="width: auto" @click="$router.push('create')"> 新增 </el-button>
      <el-button class="filter-btn el-icon-brush" type="primary" style="width: auto" @click="$router.push('month')"> 月表 </el-button>
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
import { usedParseEmpty, usedParseOnly } from './utils/usedParse'
// mixin
import ListMixin from '@/components/Mixins/ListMixin'
import MethodsMixin from '@/components/Mixins/MethodsMixin'
// plugins
import { defineIsUseAry } from 'methods-often/import'
// settings
export default {
  name: 'SalaryList',
  components: {},
  mixins: [ListMixin, MethodsMixin],
  data() {
    return {
      fields,
      nameAry: [],
      companyAry: [],
      departmentAry: [],
      teamAry: [],
      defineIsUseAry
    }
  },
  mounted() {
    this.getUsed()
  },
  methods: {
    getUsed() {
      salaryApi.used({ name: 1, company: 1, department: 1, team: 1 }).then(({ code, data }) => {
        if (code === 200) {
          this.nameAry = [...usedParseOnly(data.name)]
          this.companyAry = [...usedParseOnly(data.company)]
          this.departmentAry = [...usedParseEmpty(data.department, '未分部门')]
          this.teamAry = [...usedParseEmpty(data.team, '未分项目组')]
        }
      })
    }
  }
}
</script>
<style lang="scss" scoped></style>
