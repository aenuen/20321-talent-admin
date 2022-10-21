<template>
  <div class="app-container">
    <el-form ref="postForm" :model="postForm" :rules="rulesForm">
      <el-row>
        <el-col>
          <el-form-item prop="caseName" :label="fields.caseName" :label-width="labelWidth">
            <el-input v-model="caseName" :placeholder="fields.caseName" :disabled="true" clearable />
          </el-form-item>
        </el-col>
      </el-row>
      <el-row>
        <el-col>
          <el-form-item prop="caseNumber" :label="fields.caseNumber" :label-width="labelWidth">
            <el-input v-model="caseNumber" :placeholder="fields.caseNumber" :disabled="true" clearable />
          </el-form-item>
        </el-col>
      </el-row>
      <el-row>
        <el-col :span="20">
          <el-form-item prop="enterPrice" :label="fields.enterPrice" :label-width="labelWidth">
            <el-input v-model="postForm.enterPrice" :placeholder="fields.enterPrice" clearable />
          </el-form-item>
        </el-col>
      </el-row>
      <el-row>
        <el-col :span="20">
          <el-form-item prop="enterDate" :label="fields.enterDate" :label-width="labelWidth">
            <el-date-picker v-model="postForm.enterDate" type="date" :placeholder="fields.enterDate" value-format="yyyy-MM-dd" :clearable="false" style="width: 100%" />
          </el-form-item>
        </el-col>
      </el-row>
      <el-row>
        <el-col>
          <el-form-item :label-width="labelWidth">
            <el-button v-loading="submitLoading" type="primary" :disabled="submitLoading" @click="enter">发票入账</el-button>
          </el-form-item>
        </el-col>
      </el-row>
    </el-form>
  </div>
</template>
<script>
// api
import { caseApi } from '@/api/case'
// components
// data
import { fields } from '../modules/fields'
import { rulesForm } from '../modules/rulesEnter'
// filter
// function
// mixin
import DetailMixin from '@/components/Mixins/DetailMixin'
// plugins
import { controlInputPrice } from 'methods-often/import'
// settings
export default {
  components: {},
  mixins: [DetailMixin],
  props: {
    invoiceId: { type: Number, default: 0 },
    caseName: { type: String, default: '' },
    caseNumber: { type: String, default: '' }
  },
  data() {
    return {
      fields,
      rulesForm
    }
  },
  watch: {
    'postForm.enterPrice': function (val) {
      this.postForm.enterPrice = controlInputPrice(val)
    }
  },
  methods: {
    enter() {
      if (!this.submitLoading) {
        this.submitLoadingOpen()
        this.$refs.postForm.validate((valid, fields) => {
          if (valid) {
            caseApi
              .invoiceEnter({
                ...this.postForm,
                ...{ id: this.invoiceId }
              })
              .then(({ code, msg }) => {
                if (code === 200) {
                  this.$message.success(msg)
                  this.$emit('enterSuccess')
                  this.submitLoadingClose()
                }
              })
              .catch(() => {
                this.submitLoadingClose()
              })
          } else {
            this.validateErrHandle(fields)
          }
        })
      }
    }
  }
}
</script>
<style lang="scss" scoped></style>
