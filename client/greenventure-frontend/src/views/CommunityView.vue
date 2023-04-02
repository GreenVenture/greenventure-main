<template>
  <div class="container community mt-2">
    <h2>News Feed</h2>
    <div class="input-group my-3">
      <button
        data-bs-toggle="modal"
        :data-bs-target="'#addpost'"
        class="btn btn-light text-secondary border form-control text-start"
      >
        What's on your mind?
      </button>
      <div
        :id="'addpost'"
        class="modal fade"
        tabindex="-1"
        role="dialog"
        aria-labelledby="exampleModalLabel"
        aria-hidden="true"
      >
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-body text-dark d-flex justify-content-between">
              <button class="btn fw-bold border-0" data-bs-dismiss="modal">&#x2715;</button>
              <p class="fw-bold m-2">Create Post</p>
              <button
                class="btn text-primary fw-bold border-0"
                data-bs-dismiss="modal"
                :disabled="postText == '' ? true : false"
                :class="postText == '' ? 'text-secondary' : 'text-primary'"
                @click="addpost()"
              >
                Post
              </button>
            </div>
            <div class="modal-body border-top">
              <div class="row">
                <textarea
                  v-model="postText"
                  type="text"
                  class="border-0"
                  placeholder="What's on your mind?"
                ></textarea>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div v-for="post in allPost" :key="post.postID" class="my-4">
      <div class="card">
        <div class="card-header d-flex justify-content-between">
          <div>{{ post.username }} {{ post.postID }}</div>
          <div>{{ getDate(post.post_datetime) }}</div>
        </div>
        <div class="card-body">
          <!-- <h5 class="card-title">Special title treatment</h5> -->
          <p class="card-text">{{ post.post }}</p>
          <button @click="seePost(post)" class="btn btn-primary">See post</button>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import axios from 'axios'
import { onMounted, ref } from 'vue'
import { useRouter } from 'vue-router'

const allPost = ref([])
const postText = ref('')
const userID = localStorage.getItem('userID')
const username = localStorage.getItem('name')
const router = useRouter()

function seePost(postData) {
  // console.log(postData)
  router.push({ name: 'postactivity', query: { data: JSON.stringify(postData) } })
}

function addpost() {
  axios
    .post('http://localhost:5104/' + userID, {
      post: postText.value,
      name: username
    })
    .then(function (response) {
      allPost.value.push(response.data.data)
      postText.value = ''
      console.log(response)
    })
    .catch(function (error) {
      console.log(error)
    })
}

function getDate(date) {
  const dateObj = new Date(date)
  const options = { day: '2-digit', month: 'short' }
  const formattedDate = dateObj.toLocaleDateString('en-US', options)
  return formattedDate
}
const getPostData = async () => {
  try {
    const response = await axios.get('http://localhost:5104/all')

    allPost.value = response.data.data.posts
    // handle the response if needed
  } catch (error) {
    // handle the error if needed
  }
}

onMounted(() => {
  getPostData()
})
</script>
