<template>
  <div class="app-container">
    <div class="filter-container">
      <!-- 签标切换 -->
      <el-tabs v-model="queryList.tabCode" type="border-card" style="width: 100%" @tab-click="tabClick">
        <el-tab-pane label="大乐透" name="lottery">
          <Lottery />
        </el-tab-pane>
        <el-tab-pane label="福建31选7" name="fujian"> </el-tab-pane>
      </el-tabs>
    </div>
  </div>
</template>
<script>
// api
// components
import Lottery from './components/lottery'
// data
// filter
// function
// mixin
import ListMixin from '@/components/Mixins/ListMixin'
// plugins
// settings
export default {
  components: { Lottery },
  mixins: [ListMixin],
  data() {
    return {}
  },
  methods: {
    // 标签切换
    tabClick(tab) {
      this.queryList.tabName = tab.label
      this.queryList.tabCode = tab.name
      this.tabName = tab.label
      this.tabCode = tab.name
      this.refreshStrong()
    }
  }
}
</script>
<style lang="scss" scoped></style>
