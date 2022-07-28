<template>
  <div class="app-container">
    <el-form ref="postForm" :model="postForm" :rules="rulesForm">
      <el-form-item :label-width="labelWidth">
        <el-button :type="cutterControl ? 'primary' : 'default'" class="el-icon-upload" @click="cutterToggle"> 上传头像 </el-button>
      </el-form-item>
      <el-row>
        <el-col>
          <el-form-item prop="avatar" :label="`系统${fields.avatar}`" :label-width="labelWidth">
            <div class="avatar_wrap">
              <div v-for="(avatar, index) in avatarList" :key="index" class="avatar-item">
                <div class="avatar-main">
                  <el-avatar shape="circle" fit="cover" :src="avatar" :size="80" />
                </div>
              </div>
            </div>
          </el-form-item>
        </el-col>
      </el-row>
      <el-form-item :label-width="labelWidth">
        <el-button :loading="submitLoading" :disabled="submitLoading" type="primary" @click="submitAction"> 使用选中的系统头像 </el-button>
      </el-form-item>
    </el-form>
    <el-dialog v-if="cutterControl" title="上传头像" width="815px" :visible.sync="cutterControl">
      <ImgCutter @onCutSuccess="onCutSuccess" />
    </el-dialog>
  </div>
</template>

<script>
import { fields } from '../modules/fields'
import DetailMixin from '@/components/Mixins/DetailMixin'
import ImgCutter from '@/components/imgCutter'
import { mapGetters } from 'vuex'
import { userApi } from '@/api/user'
export default {
  name: 'PersonalAvatar',
  components: { ImgCutter },
  mixins: [DetailMixin],
  data() {
    return {
      fields,
      avatarList: [],
      cutterControl: false
    }
  },
  computed: {
    ...mapGetters(['aid', 'avatar'])
  },
  mounted() {
    this.getAvatarList()
  },
  methods: {
    // 剪切框打开关闭切换
    cutterToggle() {
      this.cutterControl = !this.cutterControl
    },
    // 剪切成功
    onCutSuccess(res) {
      userApi.avatarUpload({ id: this.aid, avatar: res.dataURL }).then(({ code, data, msg }) => {
        if (code === 200) {
          this.historyList.push(data)
          this.$store.commit('user/SET_AVATAR', data)
          this.$message.success(msg)
        } else {
          this.$message.error(msg)
        }
      })
      this.cutterToggle()
    },
    // 获取头像列表
    getAvatarList() {
      userApi.avatarList({ id: this.aid }).then(({ code, data }) => {
        if (code === 200) {
          this.avatarList = data
        }
      })
    },
    // 使用头像
    onUseAvatar(avatar) {
      this.postForm.avatar = avatar
      this.submitAction()
    },
    // 提交
    submitAction() {
      if (!this.submitLoading) {
        this.submitLoading = true
        this.$refs.postForm.validate((valid, fields) => {
          if (valid) {
            if (!this.postForm.avatar) {
              this.$message.error('请选择一个头像')
              this.submitLoading = false
            } else if (this.postForm.avatar === this.avatar) {
              this.$message.error('已经在使用此头像了，无须更换')
              this.submitLoading = false
            } else {
              this.postForm.id = this.aid
              userApi.avatar(this.postForm).then(({ code, msg }) => {
                if (code === 200) {
                  this.$message.success(msg)
                  this.$store.commit('user/SET_AVATAR', this.postForm.avatar)
                } else {
                  this.$message.error(msg)
                }
                this.submitLoading = false
              })
            }
          } else {
            this.validateErrHandle(fields)
          }
        })
      }
    }
  }
}
</script>

<style lang="scss" scoped>
.avatar_wrap {
  width: 100%;
  overflow: hidden;
  .avatar-item {
    float: left;
    .avatar-main {
      width: 100px;
      height: 140px;
      cursor: pointer;
      margin-right: 10px;
      margin-bottom: 10px;
      padding: 9px 9px 49px 9px;
      border: 1px solid #eee;
      border-radius: 5px;
      &:hover {
        padding: 9px 9px 49px 9px;
        border: 1px solid #ccc;
      }
    }
  }
}
</style>
