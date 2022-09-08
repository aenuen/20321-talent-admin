<template>
  <div class="app-container">
    <div style="width: 100%; margin: auto">
      <el-form ref="postForm" :model="postForm" :rules="rulesForm">
        <el-row v-if="!isBatch">
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
          <!--基本工资-->
          <el-col :span="6">
            <el-form-item prop="basePay" :label="fields.basePay" :label-width="labelWidth">
              <el-autocomplete v-model="postForm.basePay" :fetch-suggestions="(q, c) => autoQuery(q, c, basePayAry)" :placeholder="fields.basePay" clearable class="el-input" @select="postForm.basePay = +postForm.basePay" @change="postForm.basePay = +postForm.basePay" />
            </el-form-item>
          </el-col>
          <!--绩效工资-->
          <el-col :span="6">
            <el-form-item prop="meritPay" :label="fields.meritPay" :label-width="labelWidth">
              <el-autocomplete v-model="postForm.meritPay" :fetch-suggestions="(q, c) => autoQuery(q, c, meritPayAry)" :placeholder="fields.meritPay" clearable class="el-input" @select="postForm.meritPay = +postForm.meritPay" @change="postForm.meritPay = +postForm.meritPay" />
            </el-form-item>
          </el-col>
          <!-- 小计 -->
          <el-col :span="12">
            <el-form-item label="小计" :label-width="labelWidth">
              <el-input v-model="totalPay" disabled class="el-input" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row v-if="monthId > 0 || isBatch">
          <!-- 养老保险个人 -->
          <el-col :span="12">
            <el-form-item prop="myPension" :label="`${fields.myPension}${fields.personal}`" :label-width="labelWidth">
              <el-autocomplete v-model="postForm.myPension" :fetch-suggestions="(q, c) => autoQuery(q, c, myPensionAry)" :placeholder="`${fields.myPension}${fields.personal}`" clearable class="el-input" @select="postForm.myPension = +postForm.myPension" @change="postForm.myPension = +postForm.myPension">
                <template slot="append">
                  <el-button icon="el-icon-right" @click="pensionChange" />
                </template>
              </el-autocomplete>
            </el-form-item>
          </el-col>
          <!-- 养老保险单位 -->
          <el-col :span="12">
            <el-form-item prop="unPension" :label="`${fields.unPension}${fields.unit}`" :label-width="labelWidth">
              <el-autocomplete v-model="postForm.unPension" :fetch-suggestions="(q, c) => autoQuery(q, c, unPensionAry)" :placeholder="`${fields.unPension}${fields.unit}`" clearable class="el-input" @select="postForm.unPension = +postForm.unPension" @change="postForm.unPension = +postForm.unPension" />
            </el-form-item>
          </el-col>
          <!-- 失业保险个人 -->
          <el-col :span="12">
            <el-form-item prop="myUnemployment" :label="`${fields.myUnemployment}${fields.personal}`" :label-width="labelWidth">
              <el-autocomplete v-model="postForm.myUnemployment" :fetch-suggestions="(q, c) => autoQuery(q, c, myUnemploymentAry)" :placeholder="`${fields.myUnemployment}${fields.personal}`" clearable class="el-input" @select="postForm.myUnemployment = +postForm.myUnemployment" @change="postForm.myUnemployment = +postForm.myUnemployment">
                <template slot="append">
                  <el-button icon="el-icon-right" @click="employmentChange" />
                </template>
              </el-autocomplete>
            </el-form-item>
          </el-col>
          <!-- 失业保险单位 -->
          <el-col :span="12">
            <el-form-item prop="unUnemployment" :label="`${fields.unUnemployment}${fields.unit}`" :label-width="labelWidth">
              <el-autocomplete v-model="postForm.unUnemployment" :fetch-suggestions="(q, c) => autoQuery(q, c, unUnemploymentAry)" :placeholder="`${fields.unUnemployment}${fields.unit}`" clearable class="el-input" @select="postForm.unUnemployment = +postForm.unUnemployment" @change="postForm.unUnemployment = +postForm.unUnemployment" />
            </el-form-item>
          </el-col>
          <!--工伤保险单位-->
          <el-col :span="12">
            <el-form-item prop="unInjury" :label="`${fields.unInjury}${fields.unit}`" :label-width="labelWidth">
              <el-autocomplete v-model="postForm.unInjury" :fetch-suggestions="(q, c) => autoQuery(q, c, unInjuryAry)" :placeholder="`${fields.unInjury}${fields.unit}`" clearable class="el-input" @select="postForm.unInjury = +postForm.unInjury" @change="postForm.unInjury = +postForm.unInjury" />
            </el-form-item>
          </el-col>
          <!--生育保险单位-->
          <el-col :span="12">
            <el-form-item prop="unBirth" :label="`${fields.unBirth}${fields.unit}`" :label-width="labelWidth">
              <el-autocomplete v-model="postForm.unBirth" :fetch-suggestions="(q, c) => autoQuery(q, c, unBirthAry)" :placeholder="`${fields.unBirth}${fields.unit}`" clearable class="el-input" @select="postForm.unBirth = +postForm.unBirth" @change="postForm.unBirth = +postForm.unBirth" />
            </el-form-item>
          </el-col>
          <!--医疗保险个人-->
          <el-col :span="12">
            <el-form-item prop="myMedicalCare" :label="`${fields.myMedicalCare}${fields.personal}`" :label-width="labelWidth">
              <el-autocomplete v-model="postForm.myMedicalCare" :fetch-suggestions="(q, c) => autoQuery(q, c, myMedicalCareAry)" :placeholder="`${fields.myMedicalCare}${fields.personal}`" clearable class="el-input" @select="postForm.myMedicalCare = +postForm.myMedicalCare" @change="postForm.myMedicalCare = +postForm.myMedicalCare">
                <template slot="append">
                  <el-button icon="el-icon-right" @click="medicalCareChange" />
                </template>
              </el-autocomplete>
            </el-form-item>
          </el-col>
          <!--医疗保险单位-->
          <el-col :span="12">
            <el-form-item prop="unMedicalCare" :label="`${fields.unMedicalCare}${fields.unit}`" :label-width="labelWidth">
              <el-autocomplete v-model="postForm.unMedicalCare" :fetch-suggestions="(q, c) => autoQuery(q, c, unMedicalCareAry)" :placeholder="`${fields.unMedicalCare}${fields.unit}`" clearable class="el-input" @select="postForm.unMedicalCare = +postForm.unMedicalCare" @change="postForm.unMedicalCare = +postForm.unMedicalCare" />
            </el-form-item>
          </el-col>
          <!-- 公积金个人 -->
          <el-col :span="12">
            <el-form-item>
              <el-form-item prop="myAccumulationFund" :label="`${fields.myAccumulationFund}${fields.personal}`" :label-width="labelWidth">
                <el-autocomplete
                  v-model="postForm.myAccumulationFund"
                  :fetch-suggestions="(q, c) => autoQuery(q, c, myAccumulationFundAry)"
                  :placeholder="`${fields.myAccumulationFund}${fields.personal}`"
                  clearable
                  class="el-input"
                  @select="postForm.myAccumulationFund = +postForm.myAccumulationFund"
                  @change="postForm.myAccumulationFund = +postForm.myAccumulationFund"
                >
                  <template slot="append">
                    <el-button icon="el-icon-right" @click="accumulationFundChange" />
                  </template>
                </el-autocomplete>
              </el-form-item>
            </el-form-item>
          </el-col>
          <!-- 公积金单位 -->
          <el-col :span="12">
            <el-form-item>
              <el-form-item prop="unAccumulationFund" :label="`${fields.unAccumulationFund}${fields.unit}`" :label-width="labelWidth">
                <el-autocomplete
                  v-model="postForm.unAccumulationFund"
                  :fetch-suggestions="(q, c) => autoQuery(q, c, myAccumulationFundAry)"
                  :placeholder="`${fields.unAccumulationFund}${fields.unit}`"
                  clearable
                  class="el-input"
                  @select="postForm.unAccumulationFund = +postForm.unAccumulationFund"
                  @change="postForm.unAccumulationFund = +postForm.unAccumulationFund"
                />
              </el-form-item>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row v-if="monthId > 0 || isBatch">
          <!--补贴-->
          <el-col :span="6">
            <el-form-item prop="subsidy" :label="fields.subsidy" :label-width="labelWidth">
              <el-input v-model="postForm.subsidy" :placeholder="fields.subsidy" clearable class="el-input" @change="postForm.subsidy = +postForm.subsidy" />
            </el-form-item>
          </el-col>
          <!--扣款-->
          <el-col :span="6">
            <el-form-item prop="deduct" :label="fields.deduct" :label-width="labelWidth">
              <el-input v-model="postForm.deduct" :placeholder="fields.deduct" clearable class="el-input" @change="postForm.deduct = +postForm.deduct" />
            </el-form-item>
          </el-col>
          <!--小计-->
          <el-col :span="12">
            <el-form-item label="小计" :label-width="labelWidth">
              <el-input v-model="subTotal" disabled class="el-input" />
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
import { defaultData } from '../modules/defaultData'
import { detailRulesForm } from '../modules/rules'
// filter
// function
import { usedParseOnly } from '../utils/usedParse'
import { medicalCareChange } from '../utils/medicalCareChange'
// mixin
import DetailMixin from '@/components/Mixins/DetailMixin'
import MethodsMixin from '@/components/Mixins/MethodsMixin'
// plugins
import { autoQuery, controlInputPrice, calcSum } from 'methods-often/import'
import { salaryApi } from '../../../api/salary'
// settings
export default {
  name: 'SalaryComponentsDetail',
  components: {},
  mixins: [DetailMixin, MethodsMixin],
  props: {
    isUpdate: { type: Boolean, default: () => false }, // 单独编辑
    monthId: { type: Number, default: 0 }, // 月表单独编辑
    isBatch: { type: Boolean, default: () => false }, // 月表批量编辑
    selectorAry: { type: Array, default: () => [] } // 月表批量编辑时的数据
  },
  data() {
    return {
      labelWidth: '90px',
      fields,
      companyAry: [],
      departmentAry: [],
      teamAry: [],
      basePayAry: [],
      meritPayAry: [],
      myPensionAry: [],
      unPensionAry: [],
      myUnemploymentAry: [],
      unUnemploymentAry: [],
      myMedicalCareAry: [],
      unMedicalCareAry: [],
      unInjuryAry: [],
      unBirthAry: [],
      myAccumulationFundAry: [],
      unAccumulationFundAry: [],
      defaultData,
      autoQuery,
      rulesForm: detailRulesForm
    }
  },
  computed: {
    submitText() {
      return this.isBatch ? '批量编辑员工信息' : this.isUpdate ? '编辑员工信息' : this.monthId === 0 ? '新增员工信息' : '编辑员工月表信息'
    },
    totalPay() {
      return calcSum([+this.postForm.basePay || 0, +this.postForm.meritPay || 0])
    },
    subTotal() {
      return calcSum([+this.postForm.subsidy || 0, -+this.postForm.deduct || 0])
    }
  },
  watch: {
    // 基本工资
    'postForm.basePay': function (value) {
      this.postForm.basePay = controlInputPrice(value)
    },
    // 绩效工资
    'postForm.meritPay': function (value) {
      this.postForm.meritPay = controlInputPrice(value)
    },
    // 养老个人
    'postForm.myPension': function (value) {
      this.postForm.myPension = controlInputPrice(value)
    },
    // 养老单位
    'postForm.unPension': function (value) {
      this.postForm.unPension = controlInputPrice(value)
    },
    // 失业个人
    'postForm.myUnemployment': function (value) {
      this.postForm.myUnemployment = controlInputPrice(value)
    },
    // 失业单位
    'postForm.unUnemployment': function (value) {
      this.postForm.unUnemployment = controlInputPrice(value)
    },
    // 医疗保险个人
    'postForm.myMedicalCare': function (value) {
      this.postForm.myMedicalCare = controlInputPrice(value)
    },
    // 医疗单位
    'postForm.unMedicalCare': function (value) {
      this.postForm.unMedicalCare = controlInputPrice(value)
    },
    // 工伤单位
    'postForm.unInjury': function (value) {
      this.postForm.unInjury = controlInputPrice(value)
    },
    // 生育单位
    'postForm.unBirth': function (value) {
      this.postForm.unBirth = controlInputPrice(value)
    },
    // 公积金个人
    'postForm.myAccumulationFund': function (value) {
      this.postForm.myAccumulationFund = controlInputPrice(value)
    },
    // 公积金单位
    'postForm.unAccumulationFund': function (value) {
      this.postForm.unAccumulationFund = controlInputPrice(value)
    },
    // 考核
    'postForm.assessment': function (value) {
      this.postForm.assessment = controlInputPrice(value)
    },
    // 天数
    'postForm.days': function (value) {
      this.postForm.days = controlInputPrice(value)
    },
    // 扣款
    'postForm.deduct': function (value) {
      this.postForm.deduct = controlInputPrice(value)
    },
    // 补贴
    'postForm.subsidy': function (value) {
      this.postForm.subsidy = controlInputPrice(value)
    }
  },
  mounted() {
    this.getUsed()
  },
  created() {
    if (this.isUpdate === false) {
      this.postForm = { ...defaultData }
    }
  },
  methods: {
    // 获取使用过的数据
    getUsed() {
      salaryApi
        .used({
          name: 1,
          company: 1,
          department: 1,
          team: 1,
          basePay: 0,
          meritPay: 0,
          myPension: 1,
          unPension: 1,
          myUnemployment: 1,
          unUnemployment: 1,
          myMedicalCare: 1,
          unMedicalCare: 1,
          unInjury: 1,
          unBirth: 1,
          myAccumulationFund: 1,
          unAccumulationFund: 1
        })
        .then(({ code, data }) => {
          if (code === 200) {
            this.companyAry = [...usedParseOnly(data.company)]
            this.departmentAry = [...usedParseOnly(data.department)]
            this.teamAry = [...usedParseOnly(data.team)]
            this.teamAry = [...usedParseOnly(data.team)]
            this.basePayAry = [...usedParseOnly(data.basePay)]
            this.meritPayAry = [...usedParseOnly(data.meritPay)]
            this.myPensionAry = [...usedParseOnly(data.myPension)]
            this.unPensionAry = [...usedParseOnly(data.unPension)]
            this.myUnemploymentAry = [...usedParseOnly(data.myUnemployment)]
            this.unUnemploymentAry = [...usedParseOnly(data.unUnemployment)]
            this.myMedicalCareAry = [...usedParseOnly(data.myMedicalCare)]
            this.unInjuryAry = [...usedParseOnly(data.unInjury)]
            this.unBirthAry = [...usedParseOnly(data.unBirth)]
            this.myAccumulationFundAry = [...usedParseOnly(data.myAccumulationFund)]
            this.unAccumulationFundAry = [...usedParseOnly(data.unAccumulationFund)]
          }
        })
    },
    // 获取详情
    getDetail() {
      if (this.monthId === 0 && this.isUpdate) {
        salaryApi.detail({ id: this.updateId }).then(({ code, data }) => {
          if (code === 200) {
            this.postForm = { ...data }
          }
        })
      }
    },
    // 开始处理
    startHandle() {
      if (this.monthId > 0 && this.isUpdate === false) {
        salaryApi.monthDetail({ id: this.monthId }).then(({ code, data }) => {
          if (code === 200) {
            this.postForm = { ...data }
          }
        })
      }
    },
    // 养老
    pensionChange() {
      this.postForm.unPension = this.postForm.myPension * 2
    },
    // 失业
    employmentChange() {
      this.postForm.unUnemployment = this.postForm.myUnemployment
    },
    // 医疗
    medicalCareChange() {
      const ary = medicalCareChange(this.postForm.myMedicalCare)
      this.postForm.unMedicalCare = ary[0]
      this.postForm.unBirth = ary[1]
    },
    // 公积金
    accumulationFundChange() {
      this.postForm.unAccumulationFund = this.postForm.myAccumulationFund
    },
    // 创建、更新的统一处理
    submitHandle(msg) {
      this.$message.success(msg)
      this.submitLoadingClose()
      this.$refs.postForm.resetFields()
    },
    // 提交表格
    submitFrom() {
      if (!this.submitLoading) {
        this.submitLoadingOpen()
        this.$refs.postForm.validate((valid, fields) => {
          if (valid) {
            // 编辑月表员工
            if (this.monthId > 0) {
              salaryApi
                .monthUpdate(this.postForm)
                .then(({ code, msg }) => {
                  if (code === 200) {
                    this.$message.success(msg)
                    this.$emit('updateAloneSuccess')
                  } else {
                    this.$message.error(msg)
                  }
                })
                .catch(() => {
                  this.submitLoadingClose()
                })
              // 批量编辑月表员工
            } else if (this.isBatch) {
              const data = {
                ...this.postForm,
                ...{ ids: this.selectorAry }
              }
              console.log('🚀 ~ file: Detail.vue ~ line 427 ~ this.$refs.postForm.validate ~ this.isBatch', data)
              salaryApi
                .monthUpdateBatch(data)
                .then(({ code, msg }) => {
                  if (code === 200) {
                    this.submitHandle(msg)
                    this.$emit('updateBatchSuccess')
                  } else {
                    this.$message.error(msg)
                    this.submitLoadingClose()
                  }
                })
                .catch(() => {
                  this.submitLoadingClose()
                })
              // 编辑员工
            } else if (this.isUpdate) {
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
              // 创建
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
.el-divider--horizontal {
  margin-bottom: 20px 0;
}
</style>
