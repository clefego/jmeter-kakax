<template>
  <el-container>
    <el-header>{{ jmx }} {{ msg }}</el-header>
    <el-container>
      <el-aside width="200px">Aside</el-aside>
      <el-container>
        <el-main>
          <el-upload class="upload-demo" name="fp" action="http://127.0.0.1:8000/upload/" :on-preview="handlePreview"
            :on-remove="handleRemove" :before-remove="beforeRemove" multiple :limit="3" :on-exceed="handleExceed"
            :file-list="fileList">
            <el-button type="primary">Click to upload</el-button>
            <template #tip>
              <div class="el-upload__tip">
                jpg/png files with a size less than 500KB.
              </div>
            </template>
          </el-upload>
          <el-table :data="tableData" style="width: 100%">
            <el-table-column fixed prop="date" label="Date" width="150" />
            <el-table-column prop="name" label="Name" width="120" />
            <el-table-column prop="state" label="State" width="120" />
            <el-table-column prop="city" label="City" width="120" />
            <el-table-column prop="address" label="Address" width="600" />
            <el-table-column prop="zip" label="Zip" width="120" />
            <el-table-column fixed="right" label="Operations" width="120">
              <template #default>
                <el-button link type="primary" size="small" @click="one">run</el-button>
                <el-button link type="primary" size="small" @click="two">delete</el-button>
              </template>
            </el-table-column>
          </el-table>
        </el-main>
        <el-footer>Footer</el-footer>
      </el-container>
    </el-container>
  </el-container>
</template>
<script>
import axios from 'axios';
import { ref, onMounted } from 'vue';

export default {
  name: 'UploadJmx',
  data() {
    return {
      jmx: 'Hi,'
    }
  },
  props: {
    msg: String,
  },
  setup() {
    const tableData = ref([])
    onMounted(() => {
      getList()

    })
    const getList = async () => {
      const resp = await axios.get('http://127.0.0.1:8000/file_list')
      tableData.value = [{
        date: '2016-05-03',
        name: resp.data[0],
        state: 'Completed',
        city: 'Los Angeles',
        address: 'No. 189, Grove St, Los Angeles',
        zip: 'CA 90036',
        tag: 'Home',
      },
      {
        date: '2016-05-03',
        name: resp.data[1],
        state: 'Running',
        city: 'Los Angeles',
        address: 'No. 189, Grove St, Los Angeles',
        zip: 'CA 90036',
        tag: 'Home',
      }]
    }

    return {
      tableData
    }
  },

  methods: {
    async one() {
      await axios.post('http://127.0.0.1:8001/jobs/jmx')
      alert('创建成功')

    },
    async two() {
      await axios.delete('http://127.0.0.1:8001/jobs/jmx')
      alert('删除成功')

    },
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h3 {
  margin: 40px 0 0;
}

ul {
  list-style-type: none;
  padding: 0;
}

li {
  display: inline-block;
  margin: 0 10px;
}

a {
  color: #42b983;
}
</style>
