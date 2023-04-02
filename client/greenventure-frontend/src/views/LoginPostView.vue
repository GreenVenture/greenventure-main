<template>
  <div class="row justify-content-center align-items-center" style="height: 80vh">
    <div class="col"></div>
    <div class="col"><div class="loader"></div></div>
    <div class="col"></div>
  </div>
</template>

<script>
import { useRoute } from 'vue-router'
import axios from 'axios'

export default {
  data() {
    return {
      code: '',
      name: '',
      aid: '',
      email: ''
    }
  },
  beforeMount() {
    const route = useRoute()
    this.aid = route.query.aId
    this.name = route.query.name
    this.email = route.query.email
    const params = { aId: this.aid, name: this.name, email: this.email }
    axios
      .post('http://127.0.0.1:5208/', params)
      .then((res) => {
        if (res.data[1] == '201') {
          this.loadIntoSession()
        }
      })
      .catch((err) => {
        console.error(err)
        alert('There seems to be some problem! Try logging in again!')
        console.log('Means i got to go debug ')
      })
  },
  methods: {
    loadIntoSession() {
      localStorage.setItem('userID', this.aid)
      localStorage.setItem('name', this.name)
      localStorage.setItem('email', this.email)
      this.$router.replace({ path: '/' })
    }
  }
}
</script>

<style scoped>
.loader {
  border: 16px solid #f3f3f3; /* Light grey */
  border-top: 16px solid #3498db; /* Blue */
  border-radius: 50%;
  width: 120px;
  height: 120px;
  animation: spin 2s linear infinite;
}

@keyframes spin {
  0% {
    transform: rotate(0deg);
  }
  100% {
    transform: rotate(360deg);
  }
}
</style>
