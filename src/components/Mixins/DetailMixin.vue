<script>
import AloneMixin from './AloneMixin'
import BatchMixin from './BatchMixin'
import { validateErrMsg } from 'methods-often/import'

export default {
  mixins: [AloneMixin, BatchMixin],
  data() {
    return {
      postForm: {},
      rulesForm: {},
      labelWidth: '120px',
      submitLoading: false,
      updateId: 0
    }
  },
  created() {
    const updateId = +this.$route.params.id
    if (this.isEdit && updateId > 0) {
      this.updateId = updateId
      this.getDetail()
    }
    this.startHandle()
  },
  methods: {
    getDetail() {},
    startHandle() {},
    submitLoadingOpen() {
      this.submitLoading = true
    },
    submitLoadingClose() {
      this.submitLoading = false
    },
    validateErrHandle(fields) {
      const msg = validateErrMsg(fields)
      this.$message.error(msg)
      this.submitLoadingClose()
    }
  }
}
</script>
