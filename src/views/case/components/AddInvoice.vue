<template>
  <div class="app-container">
    <el-form ref="postForm" :model="postForm" :rules="rulesForm">
      <el-row>
        <el-col>
          <el-form-item prop="caseName" :label="fields.caseName" :label-width="labelWidth">
            <el-input v-model="postForm.caseName" :placeholder="fields.caseName" :disabled="true" clearable />
          </el-form-item>
        </el-col>
      </el-row>
      <el-row>
        <el-col>
          <el-form-item prop="caseNumber" :label="fields.caseNumber" :label-width="labelWidth">
            <el-input v-model="postForm.caseNumber" :placeholder="fields.caseNumber" :disabled="true" clearable />
          </el-form-item>
        </el-col>
      </el-row>
      <el-row>
        <el-col>
          <el-form-item prop="inType" :label="fields.inType" :label-width="labelWidth">
            <el-radio-group v-model="postForm.inType">
              <el-radio label="普通发票" border>普通发票</el-radio>
              <el-radio label="专用发票" border>专用发票</el-radio>
            </el-radio-group>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row>
        <el-col>
          <el-form-item prop="inNumber" :label="fields.inNumber" :label-width="labelWidth">
            <el-input v-model="postForm.inNumber" :placeholder="fields.inNumber" clearable />
          </el-form-item>
        </el-col>
      </el-row>
      <el-row>
        <el-col>
          <el-form-item prop="inNot" :label="fields.inNot" :label-width="labelWidth">
            <el-input v-model="postForm.inNot" :placeholder="fields.inNot" clearable />
          </el-form-item>
        </el-col>
      </el-row>
      <el-row>
        <el-col>
          <el-form-item prop="inRate" :label="fields.inRate" :label-width="labelWidth">
            <el-input v-model="postForm.inRate" :placeholder="fields.inRate" clearable />
          </el-form-item>
        </el-col>
      </el-row>
      <el-row>
        <el-col>
          <el-form-item prop="inHave" :label="fields.inHave" :label-width="labelWidth">
            <el-input v-model="postForm.inHave" :placeholder="fields.inHave" :disabled="true" clearable />
          </el-form-item>
        </el-col>
      </el-row>
      <el-row>
        <el-col>
          <el-form-item prop="invoiceDate" :label="invoiceDate" :label-width="labelWidth">
            <el-date-picker v-model="postForm.invoiceDate" type="date" :placeholder="fields.invoiceDate" value-format="yyyy-MM-dd" :clearable="false" />
          </el-form-item>
        </el-col>
      </el-row>
      <el-row>
        <el-col>
          <el-form-item :label-width="labelWidth">
            <el-button v-loading="submitLoading" type="primary" :disabled="submitLoading" @click="submitInsert">填写发票</el-button>
          </el-form-item>
        </el-col>
      </el-row>
    </el-form>
  </div>
</template>
<script>
// api
// components
// data
import { fields } from '../modules/fields'
import { rulesForm } from '../modules/rulesAddInvoice'
// filter
// function
// mixin
import DetailMixin from '@/components/Mixins/DetailMixin'
// plugins
// settings
export default {
  components: {},
  mixins: [DetailMixin],
  props: {
    caseId: { type: Number, default: 0 },
    caseName: { type: String, default: '' },
    caseNumber: { type: Number, default: 0 }
  },
  data() {
    return {
      fields,
      postForm: { inType: '普通发票' },
      rulesForm
    }
  },
  watch: {
    caseId: {
      handler(value) {
        this.postForm.id = value
      },
      immediate: true
    },
    caseName: {
      handler(value) {
        this.postForm.caseName = value
      },
      immediate: true
    },
    caseNumber: {
      handler(value) {
        this.postForm.caseNumber = value
      },
      immediate: true
    }
  }
}
</script>
<style lang="scss" scoped></style>
