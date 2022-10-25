<template>
  <div class="app-container">
    <div class="filter-container">
      <el-select v-model="queryList.isUse" class="filter-ele" :placeholder="fields.isUse" clearable @clear="handleFilter" @change="handleFilter">
        <el-option v-for="(item, key) in defineIsUseAry" :key="key" :value="String(item.value)" :label="item.label" />
      </el-select>
      <el-select v-model="queryList.isAdmin" class="filter-ele" :placeholder="fields.isAdmin" clearable @clear="handleFilter" @change="handleFilter">
        <el-option v-for="(item, key) in defineBooleanAry" :key="key" :value="String(item.value)" :label="item.label" />
      </el-select>
      <el-input v-model="queryList.username" :placeholder="fields.username" class="filter-ele" clearable @keyup.enter.native="handleFilter" @clear="handleFilter" @select="handleFilter" />
      <el-input v-model="queryList.petName" :placeholder="fields.petName" class="filter-ele" clearable @keyup.enter.native="handleFilter" @clear="handleFilter" @select="handleFilter" />
      <el-input v-model="queryList.realName" :placeholder="fields.realName" class="filter-ele" clearable @keyup.enter.native="handleFilter" @clear="handleFilter" @select="handleFilter" />
      <el-input v-model="queryList.email" :placeholder="fields.email" class="filter-ele" clearable @keyup.enter.native="handleFilter" @clear="handleFilter" @select="handleFilter" />
      <el-input v-model="queryList.mobile" :placeholder="fields.mobile" class="filter-ele" clearable @keyup.enter.native="handleFilter" @clear="handleFilter" @select="handleFilter" />
      <el-select v-model="queryList.roles" :placeholder="fields.roles" class="filter-ele" clearable @clear="handleFilter" @change="handleFilter">
        <el-option v-for="(item, index) in rolesAry" :key="index" :value="item['value']" :label="item['label']" />
      </el-select>
      <el-date-picker v-model="queryList.aheadDate" :placeholder="fields.aheadDate" class="filter-ele" value-format="yyyy-MM-dd" type="date" @change="handleFilter" />
      <el-date-picker v-model="queryList.afterDate" :placeholder="fields.afterDate" class="filter-ele" value-format="yyyy-MM-dd" type="date" @change="handleFilter" />
      <el-button class="filter-btn el-icon-search" @click="handleFilter"> 搜索 </el-button>
      <el-button type="success" class="filter-btn el-icon-plus" @click="$router.push('create')"> 新增 </el-button>
      <el-dropdown class="avatar-container hover-effect" trigger="click">
        <el-button class="filter-btn el-icon-document"> 导出 </el-button>
        <el-dropdown-menu slot="dropdown">
          <el-dropdown-item @click.native="exportData(tableData, eHeader, eFields, '用户')"> 导出EXCEL </el-dropdown-item>
          <el-dropdown-item @click.native="exportData(tableData, eHeader, eFields, '用户', 'csv')"> 导出CSV </el-dropdown-item>
        </el-dropdown-menu>
      </el-dropdown>
      <el-button class="filter-btn el-icon-printer" @click="printTable('userListTable', '用户列表')"> 打印 </el-button>
      <el-button type="danger" class="filter-btn el-icon-delete" style="width: auto" @click="removeBatchConfirm"> 批量删除 </el-button>
    </div>
    <!-- 列表 -->
    <div id="userListTable">
      <ListTable :table-data="tableData" :table-loading="tableLoading" :table-sort="tableSort" :is-use="tableIsUse" :is-admin="tableIsAdmin" @onSelectorChange="onSelectorChange" @onSortChange="onSortChange" @onIsUseChange="onIsUseChange" @onIsAdminChange="onIsAdminChange" @onRemoveAlone="onRemoveAlone" />
    </div>
    <!-- 分页 -->
    <div style="text-align: center">
      <Pagination :hidden="tableDataLength <= 0" :total="tableDataLength" :page.sync="queryList.page" :limit.sync="queryList.pageSize" @pagination="refresh" />
    </div>
    <!-- 批量编辑 -->
    <Dialog :control="updateBatchShow" title="批量编辑" @controlChange="updateBatchToggle"> 1 </Dialog>
  </div>
</template>

<script>
// api
import { userApi } from '@/api/user'
// components
import Dialog from '@/components/Dialog'
import ListTable from './components/ListTable'
import Pagination from '@/components/Pagination'
// data
import { fields } from './modules/fields'
import { rolesAry, rolesObject, rolesParse } from './modules/roles'
import { eHeader, eFields } from './modules/eList'
// filter
// function
// mixin
import ListMixin from '@/components/Mixins/ListMixin'
// plugins
import { defineIsUseAry, defineBooleanAry, keyLight } from 'methods-often/import'
import { printTable } from '@/libs/print'
import { exportData } from '@/libs/export'
// settings
export default {
  name: 'ManagerList',
  components: { Dialog, ListTable, Pagination },
  mixins: [ListMixin],
  data() {
    return {
      fields,
      rolesObject,
      defineIsUseAry,
      defineBooleanAry,
      printTable,
      exportData,
      eHeader: eHeader(),
      eFields,
      tableIsAdmin: [],
      tableIsUse: []
    }
  },
  computed: {
    rolesAry() {
      const newAry = []
      for (let index = 0; index < rolesAry.length; index++) {
        if (index !== 0 && index !== 1) {
          newAry.push(rolesAry[index])
        }
      }
      return newAry
    }
  },
  methods: {
    // 初始设置
    setData() {
      return {
        sort: '-id'
      }
    },
    // 获取列表
    startHandle() {
      userApi.list(this.queryList).then((res) => {
        const { code, data } = res
        const { list, count } = data
        if (code === 200) {
          this.tableData = list
          this.tableDataLength = count
          this.tableData.forEach((item) => {
            this.tableIsUse[item.id] = +item.isUse === 1
            this.tableIsAdmin[item.id] = +item.isAdmin === 1
            item.usernameKeyword = keyLight(this.queryList, 'username', item.username)
            item.petNameKeyword = keyLight(this.queryList, 'petName', item.petName)
            item.realNameKeyword = keyLight(this.queryList, 'realName', item.realName)
            item.emailKeyword = keyLight(this.queryList, 'email', item.email)
            item.mobileKeyword = keyLight(this.queryList, 'mobile', item.mobile)
            const object = { roles: rolesObject[this.queryList.roles] || '' }
            const roles = rolesParse(item.roles)
            item.rolesKeyword = keyLight(object, 'roles', roles)
          })
        }
      })
    },
    // 单个删除
    removeAlone() {
      userApi.remove({ id: this.removeId }).then(({ code, msg }) => {
        if (code === 200) {
          this.$message.success(msg)
          this.removeId = 0
          this.refreshStrong()
        } else {
          this.$message.error(msg)
        }
      })
    },
    // 批量删除
    removeBatch() {
      userApi.removeBatch({ ids: this.selectorAry }).then(({ msg, code }) => {
        if (code === 200) {
          this.$message.success(msg)
          this.selectorAry = []
          this.refreshStrong()
        } else {
          this.$message.error(msg)
        }
      })
    },
    // 状态改变
    onIsUseChange(event, id) {
      event = event ? '1' : '0'
      userApi.isUse({ id, event }).then((res) => {
        const { data, msg } = res
        if (+data === 1) {
          this.$message.success(msg)
        } else {
          this.$message.info(msg)
        }
      })
    },
    // 管理员切换
    onIsAdminChange(event, id) {
      event = event ? '1' : '0'
      userApi.isAdmin({ id, event }).then((res) => {
        const { data, msg } = res
        if (data === '1') {
          this.$message.success(msg)
        } else {
          this.$message.info(msg)
        }
      })
    }
  }
}
</script>
