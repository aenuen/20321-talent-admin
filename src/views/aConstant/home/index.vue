<template>
  <div class="app-container">
    <panel-group />
    <el-row id="demo1" :gutter="8">
      <el-col :xs="{ span: 24 }" :sm="{ span: 24 }" :md="{ span: 24 }" :lg="{ span: 12 }" :xl="{ span: 6 }">
        <box-card />
      </el-col>
      <el-col :xs="{ span: 24 }" :sm="{ span: 24 }" :md="{ span: 24 }" :lg="{ span: 12 }" :xl="{ span: 18 }">
        <step style="margin: 30px" />
      </el-col>
    </el-row>
  </div>
</template>
<script>
import PanelGroup from './components/PanelGroup'
import BoxCard from './components/BoxCard'
import Step from './components/WorkStep'
import guide from './utils/guide'

export default {
  name: 'ViewsHomeIndex',
  components: {
    PanelGroup,
    BoxCard,
    Step
  },
  mounted() {
    this.$driver.defineSteps(guide)
    this.$driver.start()
  }
}
</script>
