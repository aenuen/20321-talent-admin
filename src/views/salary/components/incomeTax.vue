<template>
  <div class="app-container">
    <div style="width: 100%; margin: auto">
      <el-form v-model="postForm">
        <el-row>
          <el-col v-for="item in dataAry" :key="item.id" :span="6">
            <el-form-item :label="item.name" :label-width="labelWidth">
              <el-input v-model="item.myIncomeTax" placeholder="请输入个人所得税" :min="0" style="width: 200px" clearable />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col>
            <el-form-item :label-width="labelWidth">
              <el-button v-loading="submitLoading" type="primary" :disabled="submitLoading" @click="updateIncomeTax">编辑个人所得税</el-button> <span>共计：{{ total }}</span>
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
    </div>
  </div>
</template>
<script>
// api
import { salaryApi } from '@/api/salary'
// components
// data
// filter
// function
// mixin
import DetailMixin from '@/components/Mixins/DetailMixin'
// plugins
// settings
export default {
  mixins: [DetailMixin],
  props: {
    tableData: { type: Array, default: () => [] }
  },
  data() {
    return {}
  },
  computed: {
    dataAry: {
      get() {
        return this.tableData
      }
    },
    total: function () {
      let total = 0
      this.dataAry.forEach((item) => {
        total = +total + +item.myIncomeTax
      })
      return total
    }
  },
  methods: {
    updateIncomeTax() {
      this.submitLoadingOpen()
      salaryApi
        .incomeTax({ data: this.dataAry })
        .then(({ code, msg }) => {
          if (code === 200) {
            this.$message.success(msg)
            this.submitLoadingClose()
            this.$emit('incomeTaxSuccess')
          } else {
            this.$message.error(msg)
            this.submitLoadingClose()
          }
        })
        .catch(() => {
          this.submitLoadingClose()
        })
    }
  }
}
</script>
<style lang="scss" scoped></style>
