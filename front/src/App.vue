<template>
  <img alt="Vue logo" src="./assets/logo.png">
  <UploadJmx msg="Welcome to Your Vue.js App"/>
</template>

<script>
// import HelloWorld from './components/HelloWorld.vue'
import UploadJmx from './components/UploadJmx.vue'

export default {
  name: 'App',
  components: {
    UploadJmx,
  }
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
