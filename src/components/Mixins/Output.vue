<script>
// api
// components
// data
// filter
// function
// mixin
// plugins
// settings
import { exportData } from '@/libs/export'
import { printTable } from '@/libs/print'
import { objectGetKeyAndValue } from 'methods-often/import'
export default {
  components: {},
  data() {
    return {
      printTable,
      exportData,
      exportFields: [],
      exportHeader: [],
      exportObject: {}
    }
  },
  created() {
    const { key, value } = objectGetKeyAndValue(this.exportObject)
    this.exportFields = key
    this.exportHeader = value
  }
}
</script>
<style lang="scss" scoped></style>
