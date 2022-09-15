<template>
  <div class="uploaderWrap" :style="{ width: width + 'px', height: lastHeight + 'px' }">
    <div class="uploader" :style="{ width: width + 'px', height: height + 'px' }">
      <el-upload :headers="headers" :action="fileAction" :accept="fileAccept" :show-file-list="false" :on-success="onUploadSuccess" :before-upload="onUploadBefore" :on-error="onUploadError">
        <div v-if="fileUrl" class="content" :style="{ width: width + 'px', height: height + 'px' }">
          <el-image v-if="classify === 'pic'" :style="{ width: width + 'px', height: height + 'px' }" :src="fileUrl" fit="fit" />
          <el-image v-else-if="classify === 'doc'" :style="{ width: width + 'px', height: height + 'px' }" :src="doc" fit="fit" />
          <el-image v-else-if="classify === 'xls'" :style="{ width: width + 'px', height: height + 'px' }" :src="xls" fit="fit" />
          <el-image v-else-if="classify === 'pdf'" :style="{ width: width + 'px', height: height + 'px' }" :src="pdf" fit="fit" />
        </div>
        <div v-else class="el-icon-plus uploader-icon" :style="{ width: width + 'px', height: height + 'px' }" />
      </el-upload>
    </div>
    <div v-if="progress" class="progress" :style="{ width: width + 'px', height: height + 'px' }">
      <el-progress type="circle" :percentage="percentage" :width="width" />
    </div>
    <div v-if="desc" class="desc" :style="{ width: width + 'px', height: '40px' }">{{ fileAlt || desc }}</div>
    <div v-if="fileUrl" class="iconWrap" :style="{ width: width + 'px', height: height + 'px' }">
      <div class="iconMask" :style="{ width: width + 'px', height: height + 'px' }" />
      <div class="iconContent" :style="{ width: width + 'px', height: height + 'px' }">
        <div class="iconList" :style="{ width: width - 20 + 'px' }">
          <span v-if="classify === 'pic'" @click="onUploadPreview">
            <i class="el-icon-zoom-in" />
          </span>
          <span v-else @click="onUploadDownload">
            <i class="el-icon-download" />
          </span>
          <span @click="onUploadRemove">
            <i class="el-icon-delete" />
          </span>
        </div>
      </div>
    </div>
    <el-dialog v-if="dialogVisible" :visible.sync="dialogVisible">
      <img width="100%" :src="dialogImageUrl" alt="" />
    </el-dialog>
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
import { fileClassify } from 'methods-often/import'
import { getToken } from '@/libs/utils/token'
// settings
import { apiBaseUrl } from '@/libs/axios/settings'
export default {
  props: {
    width: { type: Number, default: 100 },
    height: { type: Number, default: 100 },
    maxSize: { type: Number, default: 2 },
    desc: { type: String, default: '' },
    accept: { type: String, default: '' },
    action: { type: String, default: '' }
  },
  data() {
    return {
      fileId: 0,
      fileUrl: '',
      fileAlt: '',
      classify: '',
      dialogVisible: '',
      dialogImageUrl: '',
      percentage: 0,
      progress: false,
      doc: 'http://localhost:20320/constant/typeImage/word.png',
      xls: 'http://localhost:20320/constant/typeImage/excel.png',
      pdf: 'http://localhost:20320/constant/typeImage/pdf.png'
    }
  },
  computed: {
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
  watch: {
    fileUrl() {
      this.classify = fileClassify(this.fileUrl)
    }
  },
  methods: {
    // 上传成功
    onUploadSuccess({ code, data }, file) {
      if (code === 200) {
        const { url, name, id } = data
        this.$nextTick(() => {
          this.fileUrl = url
          this.fileAlt = name
          this.fileId = id
        }, 1000)
        this.$emit('onUploadSuccess', url)
      }
      this.percentage = 100
      setTimeout(() => {
        this.progress = false
        this.percentage = 0
      }, 1000)
    },
    // 上传错误
    onUploadError() {
      this.percentage = 0
      this.progress = false
      this.$message.error('上传失败，请稍候再试…')
    },
    // 上传之前
    onUploadBefore(file) {
      this.progress = true
      this.percentage = 30
      const isLt2M = file.size / 1024 / 1024 < this.maxSize
      if (!isLt2M) {
        this.$message.error(`上传失败，文件大小不能超过 ${this.maxSize}MB!`)
        this.percentage = 0
        this.progress = false
      }
      return isLt2M
    },
    // 浏览
    onUploadPreview() {
      this.dialogImageUrl = this.fileUrl
      this.dialogVisible = true
    },
    // 下载
    onUploadDownload() {
      window.open(this.fileUrl)
    },
    // 删除
    onUploadRemove() {
      this.$emit('onUploadRemove', this.fileId, this.fileUrl)
    },
    // 清除
    clearFileUrl() {
      this.fileUrl = ''
      this.fileAlt = ''
      this.fileId = 0
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
  .progress {
    position: absolute;
    left: 0;
    top: 0;
    border: 1px solid #d9d9d9;
    background: #fff;
  }
  .desc {
    padding: 10px 0;
    text-align: center;
    line-height: 20px;
    font-size: 14px;
    color: #666;
    overflow: hidden;
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
      position: absolute;
      left: 0;
      top: 0;
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