<template>

    <div class="container">
        <div class="my-4">
            <div class="card">
                <div class="card-header d-flex justify-content-between">
                    <div class="fw-bold">{{ postData.username }}</div>
                    <div>{{ getDate(postData.post_datetime) }}</div>
                </div>
                <div class="card-body bg-light">
                    <p class="card-text">{{ postData.post }}</p>
                </div>
                
                <div class="card-body py-2 border-top bg-light">
                    <button :disabled="isLike"  class="btn p-0 me-1 border-0" @click="likepost()">&#128077;  <span v-if="isLike" class="text-secondary"> You </span> <span v-if="isLike & likeNo>0" class="text-secondary"> and </span> <span  v-if="likeNo>0" class="text-secondary" >{{ likeNo }}</span> <span v-if="isLike & likeNo>0" class="text-secondary"> other </span></button>
                </div>

                <div class="card-footer">
                    <div class="input-group">
                     <input v-model="comment" type="text" class="form-control" placeholder="Write Something" >
                     <button id="button-addon2" class="btn btn-primary btn-outline-secondary text-light" type="button"  @click="postcomment()" >Comment</button>
                    </div>          
                </div>
                <div class="card-body border-top bg-light">
                    <div v-for="com in comments" :key="com.postID" class="border-top border-bottom pt-2 " >
                        <div class="d-flex justify-content-between">
                            <p class="fw-bold">{{ com.action_username }} </p>
                            <span class="fw-normal text-secondary">{{ getDate(com.activity_datetime) }}</span>
                        </div>
                        <p>{{com.comment}}</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    



</template>

<script setup>
import axios from 'axios';
import { onMounted, ref, computed } from 'vue'
import { useRoute } from 'vue-router';

const route = useRoute()
const postactivity = ref([])
const likeNo = ref(null)
const userID = localStorage.getItem('userID')
const username = localStorage.getItem('name')
const isLike = ref(false)


const commentNo = ref(null)
const comments = ref([])
const comment = ref("")

const postData = computed(()=>{
    return JSON.parse(route.query.data)
})


function postcomment(){
    console.log(typeof(userID))
    const commentData = {  
        post_id : postData.value.postID,
        action_user : userID,
        name : username,
        activity : "comment",
        comment : comment.value
    }
    
    axios
    .post('http://localhost:5206/', commentData)
    .then(function (response) {
        comments.value.push(response.data.data)
        comment.value = ''
    })
    .catch(function (error) {
        console.log(error)
    })

}

function getDate(date){
    const dateObj = new Date(date);
    const options = { day: "2-digit", month: "short" };
    const formattedDate = dateObj.toLocaleDateString("en-US", options);
    return  formattedDate ;

}

const getPostData = async () => {
  try {
    const response = await axios.get('http://localhost:5104/post/'+postData.value.postID)

    postactivity.value = response.data.data.postDetails
    likeNo.value = (postactivity.value.filter(item => item.activity == 'like')).length
    isLike.value = (postactivity.value.filter(item => item.action_user == userID)).length > 0
    if (isLike.value){
        likeNo.value -=1
    }

    commentNo.value = (postactivity.value.filter(item => item.activity == 'comment')).length

    comments.value = postactivity.value.filter(item => item.activity == 'comment')

    // handle the response if needed
  } catch (error) {
    // handle the error if needed
  }
}

function likepost(){
    
    axios
    .post('http://localhost:5206/', {
        post_id : postData.value.postID,
        action_user : userID,
        name : username,
        activity : "like",
        comment : null
    })
    .then(function (response) {
        isLike.value = true
      console.log(response)
    })
    .catch(function (error) {
      console.log(error)
    })

}

onMounted(() => {
    getPostData()
})





</script>