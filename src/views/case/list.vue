<template>
  <div class="app-container">
    <div class="filter-container">
      <!-- 年份搜索 -->
      <el-date-picker v-model="queryList.caseYear" :placeholder="fields.caseYear" class="filter-ele" value-format="yyyy" type="year" @change="handleFilter" />
      <!-- 年月搜索 -->
      <el-date-picker v-model="queryList.createYearMonth" :placeholder="fields.createYearMonth" class="filter-ele" value-format="yyyy-MM" type="month" @change="handleFilter" />
      <!-- 律师搜索 -->
      <el-select v-if="isAdmin" v-model="queryList.createRealName" filterable class="filter-ele" :placeholder="fields.createRealName" clearable @change="handleFilter">
        <el-option v-for="item in lawyerAry" :key="item.value" :label="item.value" :value="item.value" />
      </el-select>
      <!-- 案号搜索 -->
      <el-select v-model="queryList.caseName" filterable class="filter-ele" :placeholder="fields.caseName" clearable @change="handleFilter">
        <el-option v-for="item in caseNameAry" :key="item.value" :label="item.value" :value="item.value" />
      </el-select>
      <!-- 类别搜索 -->
      <el-select v-model="queryList.type" filterable class="filter-ele" :placeholder="fields.type" clearable @change="handleFilter">
        <el-option v-for="item in typeAry" :key="item.value" :label="item.value" :value="item.value" />
      </el-select>
      <!-- 委托人搜索 -->
      <el-input v-model="queryList.client" :placeholder="fields.client" class="filter-ele" clearable @keyup.enter.native="handleFilter" @clear="handleFilter" @blur="handleFilter" />
      <el-button class="filter-btn el-icon-search" @click="handleFilter"> 搜索 </el-button>
      <el-button type="success" class="filter-btn el-icon-plus" @click="$router.push('create')"> 新增 </el-button>
    </div>
    <!-- 列表 -->
    <div id="caseListTable">
      <ListTable :table-data="tableData" :table-loading="tableLoading" :table-sort="tableSort" :is-use="tableIsUse" @onSortChange="onSortChange" @onSureDelivery="onSureDelivery" @onIsUseChange="onIsUseChange" @onManager="managerOpen" />
    </div>
    <!-- 分页 -->
    <div style="text-align: center">
      <Pagination :hidden="tableDataLength <= 0" :total="tableDataLength" :page.sync="queryList.page" :limit.sync="queryList.pageSize" @pagination="refresh" />
    </div>
    <!-- 入账管理 -->
    <Dialog :control="managerShow" title="入账管理" @controlChange="managerClose">
      <Manager :id="managerId" @onAddInvoice="addInvoice = true" />
    </Dialog>
    <!-- 增加发票 -->
    <Dialog :control="addInvoice" title="增加发票" :width="600" @controlChange="addInvoice = false">
      <AddInvoice :case-id="managerId" :case-name="managerName" :case-number="managerNumber" />
    </Dialog>
  </div>
</template>
<script>
// api
import { caseApi } from '@/api/case'
// components
import ListTable from './components/ListTable'
import Dialog from '@/components/Dialog'
import Pagination from '@/components/Pagination'
import Manager from './components/Manager'
import AddInvoice from './components/AddInvoice'
// data
import { fields } from './modules/fields'
import { typeAry } from './modules/typeAry'
import { lawyerAry } from './modules/lawyerAry'
import { caseNameAry } from './modules/caseNameAry'
// filter
// function
// mixin
import ListMixin from '@/components/Mixins/ListMixin'
// plugins
import { keyLight } from 'methods-often/import'
import { mapGetters } from 'vuex'
// settings
export default {
  components: { Dialog, ListTable, Pagination, Manager, AddInvoice },
  mixins: [ListMixin],
  data() {
    return {
      fields,
      typeAry,
      lawyerAry,
      caseNameAry,
      tableIsUse: [],
      managerShow: false,
      managerId: 0,
      managerName: '',
      managerNumber: 0,
      addInvoice: false
    }
  },
  computed: {
    ...mapGetters(['roles', 'realName']),
    isAdmin() {
      return this.roles.includes('admin')
    }
  },
  methods: {
    // 设置数据
    setData() {
      return {
        sort: '-id'
      }
    },
    // 获取列表数据
    startHandle() {
      caseApi.list(this.queryList).then(({ code, data }) => {
        const { list, count } = data
        if (code === 200) {
          this.tableData = list
          this.tableDataLength = count
          this.tableData.forEach((item) => {
            this.tableIsUse[item.id] = +item.isUse === 1
            item.createRealName_key = keyLight(this.queryList, 'createRealName', item.createRealName)
            item.caseName_key = keyLight(this.queryList, 'caseName', item.caseName)
            item.type_key = keyLight(this.queryList, 'type', item.type)
            item.client_key = keyLight(this.queryList, 'client', item.client)
          })
        }
      })
    },
    // 确认原件已收到
    onSureDelivery(id) {
      caseApi
        .delivery({ id })
        .then(({ code, msg }) => {
          if (code === 200) {
            this.$message.success(msg)
            this.refreshStrong()
          } else {
            this.$message.error(msg)
          }
        })
        .catch(() => {
          this.$message.error(`确认失败…`)
        })
    },
    // 状态改变
    onIsUseChange(event, id) {
      event = event ? '1' : '0'
      caseApi.isUse({ id, event }).then((res) => {
        const { data, msg } = res
        if (+data === 1) {
          this.$message.success(msg)
        } else {
          this.$message.info(msg)
        }
      })
    },
    // 打开入账管理
    managerOpen(id, caseName, caseNumber) {
      this.managerId = id
      this.managerName = caseName
      this.managerNumber = caseNumber
      this.managerShow = true
    },
    // 关闭入账管理
    managerClose() {
      this.managerId = 0
      this.managerName = ''
      this.managerNumber = 0
      this.managerShow = false
    }
  }
}
</script>
<style lang="scss" scoped></style>
