import Vue from 'vue'
import VueRouter from 'vue-router'
// import HomeView from '../views/HomeView.vue'

Vue.use(VueRouter)

const routes = [
  // {
  //   path: '/',
  //   name: 'home',
  //   component: HomeView
  // },
  {
    path: '/about',
    name: 'about',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/AboutView.vue')
  },
  {
    path: '/JavascriptAxios',
    name: 'JavascriptAxios',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/JavascriptAxios.vue')
  },
  {
    path: '/elementuidemo',
    name: 'elementuidemo',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/ElementuiDemo.vue')
  },
  {
    path: '/home',
    name: 'home',
    component: () => import('../views/home/Index.vue')
  },
  {
    path: '/login',
    name: 'login',
    component: () => import('../views/login/Index.vue')
  },
  {
    path: '/banner',
    name: 'banner',
    component: () => import( '../views/banner/Index.vue')
  },
  {
    path: '/user',
    name: 'user',
    component: () => import('../views/user/Index.vue')
  },
  {
    path: '/goods',
    name: 'goods',
    component: () => import('../views/goods/Index.vue')
  },
  {
    path: '/cart',
    name: 'cart',
    component: () => import('../views/cart/Index.vue')
  }
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
