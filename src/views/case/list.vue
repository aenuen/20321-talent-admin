<template>
  <div class="wrap">
    <div class="mask" />
    <div class="content">
      <div class="icon">
        <span>
          <i class="el-icon-zoom-in" />
        </span>
        <span>
          <i class="el-icon-download" />
        </span>
        <span>
          <i class="el-icon-delete" />
        </span>
      </div>
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
// plugins
// settings
export default {
  components: {},
  data() {
    return {}
  }
}
</script>
<style lang="scss" scoped>
.wrap {
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  display: flex;
  justify-content: center;
  align-items: center;
  width: 100px;
  height: 100px;
}
.mask {
  position: absolute;
  width: 100%;
  height: 100%;
  background: rgba(0, 0, 0, 0.4);
}

.content {
  width: 100%;
  position: relative;
  border-radius: 0.1rem;
  text-align: center;
  line-height: 0.5rem;

  .icon {
    width: 100%;
    padding: 0 15px;
    display: flex;
    span {
      display: inline-block;
      flex: 1;
    }
  }
}
</style>
