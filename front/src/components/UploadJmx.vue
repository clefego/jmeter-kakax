<template>
  <el-container>
    <el-header>{{ jmx }} {{ msg }}</el-header>
    <el-container>
      <el-aside width="200px">Aside</el-aside>
      <el-container>
        <el-main>
          <el-table :data="tableData" style="width: 100%">
            <el-table-column fixed prop="date" label="Date" width="150" />
            <el-table-column prop="name" label="Name" width="120" />
            <el-table-column prop="state" label="State" width="120" />
            <el-table-column prop="city" label="City" width="120" />
            <el-table-column prop="zip" label="Zip" width="120" />
            <el-table-column fixed="right" label="Operations" width="120">
              <template #default>
                <el-button link type="primary" size="small" @click="handleClick">Detail</el-button>
                <el-button link type="primary" size="small" @click="two">Edit</el-button>
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

export default {
  name: 'UploadJmx',
  data() {

    axios.get('http://127.0.0.1:8000/file_list').then((response) => {
      console.log(response.data)
    })
    return {
      jmx: 'Hi,',
      tableData: [
        {
          date: '2016-05-03',
          name: 'Tom',
          state: 'California',
          city: 'Los Angeles',
          zip: 'CA 90036',
          tag: 'Home',
        }
      ],
    }
  },
  props: {
    msg: String
  },
  methods: {
    async one() {
      const resp = await axios.get('http://127.0.0.1:8000/file_list')
      alert(resp.data)
    },
    async two() {
      const resp = await axios.get('http://127.0.0.1:8000/upload')
      alert(resp.data)
    },
    handleClick() {

      console.log('click')

    }
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
