import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../views/HomeView.vue'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'home',
      component: HomeView
    },
    {
      path: '/login',
      name: 'login',
      component: () => import('../views/LoginView.vue')
    },
    {
      path: '/login_post',
      name: 'login_post',
      component: () => import('../views/LoginPostView.vue')
    },
    {
      path: '/wallet',
      name: 'wallet',
      component: () => import('../views/WalletView.vue')
    },
    {
      path: '/community',
      name: 'community',
      component: () => import('../views/CommunityView.vue')
    },
    {
      path: '/postactivity',
      name: 'postactivity',
      component: () => import('../views/PostActivityView.vue'),
      props: route => ({ data: route.query.data }),
    }
  ]
})

export default router
