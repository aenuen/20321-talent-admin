<template>
  <div class="app-container">
    <div style="width: 1000px; margin: auto">
      <el-form ref="postForm" :model="postForm" :rules="rulesForm">
        <el-row>
          <!-- 公司 -->
          <el-col :span="6">
            <el-form-item prop="company" :label="fields.company" :label-width="labelWidth">
              <el-autocomplete v-model="postForm.company" :fetch-suggestions="(q, c) => autoQuery(q, c, companyAry)" :placeholder="fields.company" clearable class="el-input" />
            </el-form-item>
          </el-col>
          <!-- 姓名 -->
          <el-col :span="6">
            <el-form-item prop="name" :label="fields.name" :label-width="labelWidth">
              <el-input v-model="postForm.name" :placeholder="fields.name" maxlength="4" clearable />
            </el-form-item>
          </el-col>
          <!-- 部门 -->
          <el-col :span="6">
            <el-form-item prop="department" :label="fields.department" :label-width="labelWidth">
              <el-autocomplete v-model="postForm.department" :fetch-suggestions="(q, c) => autoQuery(q, c, departmentAry)" :placeholder="fields.department" clearable class="el-input" />
            </el-form-item>
          </el-col>
          <!--项目组-->
          <el-col :span="6">
            <el-form-item prop="team" :label="fields.team" :label-width="labelWidth">
              <el-autocomplete v-model="postForm.team" :fetch-suggestions="(q, c) => autoQuery(q, c, teamAry)" :placeholder="fields.team" clearable class="el-input" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <!--基本工资-->
          <el-col :span="6">
            <el-form-item prop="basePay" :label="fields.basePay" :label-width="labelWidth">
              <el-autocomplete v-model="postForm.basePay" :fetch-suggestions="(q, c) => autoQuery(q, c, basePayAry)" :placeholder="fields.basePay" clearable class="el-input" />
            </el-form-item>
          </el-col>
          <!--绩效工资-->
          <el-col :span="6">
            <el-form-item prop="meritPay" :label="fields.meritPay" :label-width="labelWidth">
              <el-autocomplete v-model="postForm.meritPay" :fetch-suggestions="(q, c) => autoQuery(q, c, meritPayAry)" :placeholder="fields.meritPay" clearable class="el-input" />
            </el-form-item>
          </el-col>
          <!--合计工资-->
          <el-col :span="6">
            <el-form-item prop="totalPay" :label="fields.totalPay" :label-width="labelWidth">
              <el-input v-model="totalPay" :placeholder="fields.totalPay" disabled />
            </el-form-item>
          </el-col>
          <!--工伤保险单位-->
          <el-col :span="6">
            <el-form-item prop="unInjury" :label="`${fields.unInjury}${fields.unit}`" :label-width="labelWidth">
              <el-autocomplete v-model="postForm.unInjury" :fetch-suggestions="(q, c) => autoQuery(q, c, accumulationFundAry)" :placeholder="`${fields.unInjury}${fields.unit}`" clearable class="el-input" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <!-- 养老保险个人 -->
          <el-col :span="6">
            <el-form-item prop="myPension" :label="`${fields.myPension}${fields.personal}`" :label-width="labelWidth">
              <el-autocomplete v-model="postForm.myPension" :fetch-suggestions="(q, c) => autoQuery(q, c, accumulationFundAry)" :placeholder="`${fields.myPension}${fields.personal}`" clearable class="el-input" />
            </el-form-item>
          </el-col>
          <!-- 养老保险单位 -->
          <el-col :span="6">
            <el-form-item prop="unPension" :label="`${fields.unPension}${fields.unit}`" :label-width="labelWidth">
              <el-autocomplete v-model="postForm.unPension" :fetch-suggestions="(q, c) => autoQuery(q, c, accumulationFundAry)" :placeholder="`${fields.unPension}${fields.unit}`" clearable class="el-input" />
            </el-form-item>
          </el-col>
          <!-- 失业保险个人 -->
          <el-col :span="6">
            <el-form-item prop="myUnemployment" :label="`${fields.myUnemployment}${fields.personal}`" :label-width="labelWidth">
              <el-autocomplete v-model="postForm.myUnemployment" :fetch-suggestions="(q, c) => autoQuery(q, c, accumulationFundAry)" :placeholder="`${fields.myUnemployment}${fields.personal}`" clearable class="el-input" />
            </el-form-item>
          </el-col>
          <!-- 失业保险单位 -->
          <el-col :span="6">
            <el-form-item prop="unUnemployment" :label="`${fields.unUnemployment}${fields.unit}`" :label-width="labelWidth">
              <el-autocomplete v-model="postForm.unUnemployment" :fetch-suggestions="(q, c) => autoQuery(q, c, accumulationFundAry)" :placeholder="`${fields.unUnemployment}${fields.unit}`" clearable class="el-input" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <!--医疗保险个人-->
          <el-col :span="6">
            <el-form-item prop="myMedicalCare" :label="`${fields.myMedicalCare}${fields.personal}`" :label-width="labelWidth">
              <el-autocomplete v-model="postForm.myMedicalCare" :fetch-suggestions="(q, c) => autoQuery(q, c, accumulationFundAry)" :placeholder="`${fields.myMedicalCare}${fields.personal}`" clearable class="el-input" />
            </el-form-item>
          </el-col>
          <!--医疗保险单位-->
          <el-col :span="6">
            <el-form-item prop="unMedicalCare" :label="`${fields.unMedicalCare}${fields.unit}`" :label-width="labelWidth">
              <el-autocomplete v-model="postForm.unMedicalCare" :fetch-suggestions="(q, c) => autoQuery(q, c, accumulationFundAry)" :placeholder="`${fields.unMedicalCare}${fields.unit}`" clearable class="el-input" />
            </el-form-item>
          </el-col>
          <!--生育保险单位-->
          <el-col :span="6">
            <el-form-item prop="unBirth" :label="`${fields.unBirth}${fields.unit}`" :label-width="labelWidth">
              <el-autocomplete v-model="postForm.unBirth" :fetch-suggestions="(q, c) => autoQuery(q, c, accumulationFundAry)" :placeholder="`${fields.unBirth}${fields.unit}`" clearable class="el-input" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <!-- 公积金个人 -->
          <el-col :span="6">
            <el-form-item>
              <el-form-item prop="myAccumulationFund" :label="`${fields.myAccumulationFund}${fields.personal}`" :label-width="labelWidth">
                <el-autocomplete v-model="postForm.myAccumulationFund" :fetch-suggestions="(q, c) => autoQuery(q, c, accumulationFundAry)" :placeholder="`${fields.myAccumulationFund}${fields.personal}`" clearable class="el-input" />
              </el-form-item>
            </el-form-item>
          </el-col>
          <!-- 公积金单位 -->
          <el-col :span="6">
            <el-form-item>
              <el-form-item prop="unAccumulationFund" :label="`${fields.unAccumulationFund}${fields.unit}`" :label-width="labelWidth">
                <el-autocomplete v-model="postForm.unAccumulationFund" :fetch-suggestions="(q, c) => autoQuery(q, c, accumulationFundAry)" :placeholder="`${fields.unAccumulationFund}${fields.unit}`" clearable class="el-input" />
              </el-form-item>
            </el-form-item>
          </el-col>
          <!--天数-->
          <el-col :span="6">
            <el-form-item prop="assessment" :label="fields.assessment" :label-width="labelWidth">
              <el-input v-model="postForm.assessment" :placeholder="fields.assessment" class="el-input" />
            </el-form-item>
          </el-col>
          <!--扣款-->
          <el-col :span="6">
            <el-form-item prop="subsidy" :label="fields.subsidy" :label-width="labelWidth">
              <el-input v-model="postForm.subsidy" :placeholder="fields.subsidy" class="el-input" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col>
            <el-form-item :label-width="labelWidth">
              <el-button v-loading="submitLoading" type="primary" :disabled="submitLoading" @click="submitFrom">
                {{ submitText }}
              </el-button>
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
    </div>
  </div>
</template>
<script>
// api
// components
// data
import { fields } from '../modules/fields'
import { basePayAry, meritPayAry, accumulationFundAry, defaultPostForm } from '../modules/base'
import { detailRulesForm } from '../modules/rules'
// filter
// function
import { usedParseOnly } from '../utils/usedParse'
// mixin
import DetailMixin from '@/components/Mixins/DetailMixin'
import MethodsMixin from '@/components/Mixins/MethodsMixin'
// plugins
import { autoQuery } from 'methods-often/import'
import { salaryApi } from '../../../api/salary'
// settings
export default {
  components: {},
  mixins: [DetailMixin, MethodsMixin],
  props: {
    isUpdate: { type: Boolean, default: () => false },
    monthId: { type: Number, default: 0 }
  },
  data() {
    return {
      fields,
      companyAry: [],
      departmentAry: [],
      teamAry: [],
      basePayAry,
      meritPayAry,
      accumulationFundAry,
      defaultPostForm,
      autoQuery,
      rulesForm: detailRulesForm
    }
  },
  computed: {
    submitText() {
      return this.isUpdate ? '修改员工信息' : this.monthId === 0 ? '新增员工信息' : '修改员工月表信息'
    },
    totalPay() {
      return +this.postForm.basePay + +this.postForm.meritPay
    }
  },
  mounted() {
    this.getUsed()
  },
  created() {
    if (this.isUpdate === false) {
      this.postForm = { ...defaultPostForm }
    }
  },
  methods: {
    getUsed() {
      salaryApi.used({ name: 1, company: 1, department: 1, team: 1 }).then(({ code, data }) => {
        if (code === 200) {
          this.companyAry = [...data.company]
          const department = usedParseOnly(data.department)
          this.departmentAry = [...department]
          const team = usedParseOnly(data.team)
          this.teamAry = [...team]
        }
      })
    },
    getDetail() {
      if (this.monthId === 0 && this.isUpdate) {
        console.log('🚀 ~ file: detail.vue ~ line 186 ~ getDetail ~ isUpdate', 'isUpdate')
      }
    },
    startHandle() {
      if (this.monthId > 0 && this.isUpdate === false) {
        console.log('🚀 ~ file: detail.vue ~ line 191 ~ startHandle ~ monthId', 'monthId')
      }
    },
    // 创建、更新的统一处理
    submitHandle(msg) {
      this.$message.success(msg)
      this.submitLoadingClose()
      this.$refs.postForm.resetFields()
    },
    submitFrom() {
      if (!this.submitLoading) {
        this.submitLoadingOpen()
        this.$refs.postForm.validate((valid, fields) => {
          if (valid) {
            if (this.isUpdate) {
              salaryApi
                .update(this.postForm)
                .then(({ code, msg }) => {
                  if (code === 200) {
                    this.submitHandle(msg)
                    this.backClose()
                  } else {
                    this.$message.error(msg)
                    this.submitLoadingClose()
                  }
                })
                .catch(() => {
                  this.submitLoadingClose()
                })
            } else {
              salaryApi
                .create(this.postForm)
                .then(({ code, msg }) => {
                  if (code === 200) {
                    this.submitHandle(msg)
                    this.routerClose('/salary/list')
                  } else {
                    this.$message.error(msg)
                    this.submitLoadingClose()
                  }
                })
                .catch(() => {
                  this.submitLoadingClose()
                })
            }
          } else {
            this.validateErrHandle(fields)
          }
        })
      }
    }
  }
}
</script>
<style lang="scss" scoped>
.itemTitle {
  font-weight: bold;
  line-height: 30px;
  border-bottom: 1px solid #ddd;
  margin-bottom: 20px;
}
</style>
