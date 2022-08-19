<template>
  <el-dialog v-if="selectVal" :title="title" :width="width" :visible.sync="selectVal">
    <slot />
  </el-dialog>
</template>

<script>
export default {
  props: {
    title: { type: String, default: '批量编辑' },
    control: { type: Boolean, default: false },
    width: { type: Number, default: 1200 }
  },
  computed: {
    selectVal: {
      get() {
        return this.control
      },
      set(val) {
        this.$emit('controlChange', val)
      }
    }
  }
}
</script>
