<template>
  <div class="app-container">
    <div class="filter-container">
      <el-select v-model="beforeAry" class="filter-ele" style="width: 20%" multiple filterable allow-create default-first-option placeholder="前段">
        <el-option v-for="item in beforeData" :key="item" :label="item" :value="item"> </el-option>
      </el-select>
      <el-select v-model="afterAry" class="filter-ele" multiple filterable allow-create default-first-option placeholder="后段">
        <el-option v-for="item in afterData" :key="item" :label="item" :value="item"> </el-option>
      </el-select>
      <el-input v-model="number" class="filter-ele" />
      <el-button class="filter-btn" @click="randomMake">随便生成</el-button>
    </div>
  </div>
</template>
<script>
// api
// components
// data
// filter
// function
// mixin
import DetailMixin from '@/components/Mixins/DetailMixin'
// plugins
import { aoRandom } from 'methods-often/import'
// settings
export default {
  name: 'LotteryRandom',
  components: {},
  mixins: [DetailMixin],
  data() {
    return {
      beforeAry: this.beforeData,
      afterAry: this.afterData,
      number: 3,
      result: []
    }
  },
  computed: {
    beforeData() {
      const result = []
      for (let index = 1; index < 37; index++) {
        result.push(String(index).padStart(2, '0'))
      }
      return result
    },
    afterData() {
      const result = []
      for (let index = 1; index < 13; index++) {
        result.push(String(index).padStart(2, '0'))
      }
      return result
    }
  },
  methods: {
    randomMake() {
      if (this.beforeAry.length > 5 && this.afterAry.length > 2) {
        const before = aoRandom(this.beforeAry, 5)
        const after = aoRandom(this.afterAry, 2)
        const result = before.join(',') + after.join(',')
        console.log('🚀 ~ file: random.vue ~ line 58 ~ randomMake ~ result', result)
      } else {
        this.$message.warning('前段选择的数据不能少于5，后段选择的数据不能少于2')
      }
    }
  }
}
</script>
<style lang="scss" scoped></style>
