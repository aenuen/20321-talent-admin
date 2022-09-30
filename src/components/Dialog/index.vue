<template>
  <el-dialog v-if="selectVal" :title="title" :width="width + 'px'" :visible.sync="selectVal" :fullscreen="fullscreen">
    <slot />
  </el-dialog>
</template>

<script>
export default {
  props: {
    title: { type: String, default: '批量编辑' },
    control: { type: Boolean, default: false },
    width: { type: Number, default: 1200 },
    fullscreen: Boolean
  },
  computed: {
    selectVal: {
      get() {
        return this.control
      },
      set() {
        this.$emit('controlChange')
      }
    }
  }
}
</script>
