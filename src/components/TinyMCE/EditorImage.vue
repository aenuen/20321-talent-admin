<template>
  <div class="upload-container">
    <el-button :style="{ background: color, borderColor: color }" icon="el-icon-upload" size="mini" type="primary" @click="dialogVisible = true"> 上传图片 </el-button>
    <el-dialog :visible.sync="dialogVisible">
      <el-upload :multiple="true" :file-list="fileList" :show-file-list="true" :accept="fileAccept" :on-remove="handleRemove" :on-success="handleSuccess" :before-upload="beforeUpload" class="editor-slide-upload" action="https://httpbin.org/post" list-type="picture-card">
        <el-button size="small" type="primary"> 点击上传 </el-button>
      </el-upload>
      <el-button @click="dialogVisible = false"> 取消 </el-button>
      <el-button type="primary" @click="handleSubmit"> 确认 </el-button>
    </el-dialog>
  </div>
</template>

<script>
import { defineAcceptAry } from 'abbott-methods/import'
export default {
  name: 'EditorSlideUpload',
  props: {
    color: { type: String, default: '#1890ff' }
  },
  data() {
    return {
      dialogVisible: false,
      listObj: {},
      fileList: [],
      fileAccept: defineAcceptAry.image
    }
  },
  methods: {
    checkAllSuccess() {
      return Object.keys(this.listObj).every((item) => this.listObj[item].hasSuccess)
    },
    handleSubmit() {
      const arr = Object.keys(this.listObj).map((v) => this.listObj[v])
      if (!this.checkAllSuccess()) {
        this.$message('请等待所有图片上传成功。如果有网络问题，请刷新页面后重新上传!')
        return
      }
      this.$emit('successCBK', arr)
      this.listObj = {}
      this.fileList = []
      this.dialogVisible = false
    },
    handleSuccess(response, file) {
      const uid = file.uid
      const objKeyArr = Object.keys(this.listObj)
      for (let i = 0, len = objKeyArr.length; i < len; i++) {
        if (this.listObj[objKeyArr[i]].uid === uid) {
          this.listObj[objKeyArr[i]].url = response.files.file
          this.listObj[objKeyArr[i]].hasSuccess = true
          return
        }
      }
    },
    handleRemove(file) {
      const uid = file.uid
      const objKeyArr = Object.keys(this.listObj)
      for (let i = 0, len = objKeyArr.length; i < len; i++) {
        if (this.listObj[objKeyArr[i]].uid === uid) {
          delete this.listObj[objKeyArr[i]]
          return
        }
      }
    },
    beforeUpload(file) {
      const _self = this
      const _URL = window.URL || window.webkitURL
      const fileName = file.uid
      this.listObj[fileName] = {}
      return new Promise((resolve, reject) => {
        const img = new Image()
        img.src = _URL.createObjectURL(file)
        img.onload = () => {
          _self.listObj[fileName] = { hasSuccess: false, uid: file.uid, width: this.width, height: this.height }
        }
        resolve(true)
      })
    }
  }
}
</script>

<style lang="scss" scoped>
.editor-slide-upload {
  margin-bottom: 20px;
  ::v-deep .el-upload--picture-card {
    width: 100%;
  }
}
</style>
