<template>
  <div class="uploaderWrap" :style="{ width: width + 'px', height: lastHeight + 'px' }">
    <div class="uploader" :style="{ width: width + 'px', height: height + 'px' }">
      <el-upload :headers="headers" :action="fileAction" :accept="fileAccept" :show-file-list="false" :on-success="onUploadSuccess" :before-upload="onUploadBefore">
        <div v-if="fileUrl" class="content">
          <img :src="fileUrl" />
        </div>
        <div v-else class="el-icon-plus uploader-icon" :style="{ width: width + 'px', height: lastHeight + 'px' }" />
      </el-upload>
    </div>
    <div v-if="desc" class="desc" :style="{ width: width + 'px', height: '40px' }">{{ desc }}</div>
    <div v-if="fileUrl" class="iconWrap" :style="{ width: width + 'px', height: height + 'px' }">
      <div class="iconMask" :style="{ width: width + 'px', height: height + 'px' }" />
      <div class="iconContent" :style="{ width: width + 'px', height: height + 'px' }">
        <div class="iconList" :style="{ width: width - 20 + 'px' }">
          <span @click="onUploadPreview">
            <i class="el-icon-zoom-in" />
          </span>
          <span @click="onUploadDownload">
            <i class="el-icon-download" />
          </span>
          <span @click="onUploadRemove">
            <i class="el-icon-delete" />
          </span>
        </div>
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
import { getToken } from '@/libs/utils/token'
// settings
import { apiBaseUrl } from '@/libs/axios/settings'
export default {
  props: {
    width: { type: Number, default: 100 },
    height: { type: Number, default: 100 },
    desc: { type: String, default: '' },
    url: { type: String, default: '' },
    accept: { type: String, default: '' },
    action: { type: String, default: '' }
  },
  data() {
    return {
      fileAlt: ''
    }
  },
  computed: {
    fileUrl: {
      get() {
        return this.url
      }
    },
    headers() {
      return {
        Authorization: `Bearer ${getToken()}`
      }
    },
    fileAction() {
      return `${apiBaseUrl}${this.action}`
    },
    fileAccept() {
      return this.accept
    },
    lastHeight() {
      return this.desc ? this.height + 40 : this.height
    }
  },
  methods: {
    // 上传成功
    onUploadSuccess({ code, data }, file) {
      if (code === 200) {
        const { url } = data
        this.$emit('onUploadSuccess', url)
      }
    },
    // 上传之前
    onUploadBefore(file) {
      this.$emit('onUploadBefore', file)
    },
    // 浏览
    onUploadPreview() {
      this.$message.success('1')
    },
    // 下载
    onUploadDownload() {},
    // 删除
    onUploadRemove() {
      this.$emit('onUploadRemove')
    }
  }
}
</script>
<style lang="scss" scoped>
.uploaderWrap {
  display: inline-block;
  position: relative;
  &:hover {
    .iconWrap {
      display: block;
    }
  }
  .desc {
    padding: 10px 0;
    text-align: center;
    line-height: 20px;
    font-size: 14px;
    color: #666;
  }
  .uploader {
    border: 1px solid #d9d9d9;
    border-radius: 6px;
    position: relative;
    overflow: hidden;
    &:hover {
      border-color: #409eff;
      .avatar-uploader-icon {
        color: #409eff;
      }
    }
    .uploader-icon {
      font-size: 28px;
      color: #8c939d;
      line-height: 100px;
      text-align: center;
    }
    .content {
      width: 100px;
      height: 100px;
      position: absolute;
      left: 0;
      top: 0;
      img {
        width: 100px;
        height: 100px;
      }
    }
  }
  .iconWrap {
    position: absolute;
    display: none;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
  }
  .iconMask {
    position: absolute;
    background: rgba(0, 0, 0, 0.4);
  }

  .iconContent {
    position: relative;
    border-radius: 0.1rem;
    text-align: center;
    line-height: 0.5rem;
    display: flex;
    justify-content: center;
    align-items: center;

    .iconList {
      display: flex;
      height: 14px;
      span {
        display: inline-block;
        cursor: pointer;
        width: 14px;
        height: 14px;
        padding: 0 5px;
        flex: 1;
        color: #fff;
      }
    }
  }
}
</style>
