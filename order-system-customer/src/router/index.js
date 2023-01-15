import Vue from "vue";
import VueRouter from "vue-router";
// import HomeView from "../views/HomeView.vue";

Vue.use(VueRouter);

const routes = [
  // {
  //   path: "/",
  //   name: "home",
  //   component: HomeView,
  // },
  {
    path: "/about",
    name: "about",
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () =>
      import(/* webpackChunkName: "about" */ "../views/AboutView.vue"),
  },
  {
    path: "/JavascriptAxios",
    name: "JavascriptAxios",
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () =>
      import(/* webpackChunkName: "about" */ "../views/JavascriptAxios.vue"),
  },
  {
    path: "/home",
    name: "home",
    component: () =>
      import(/* webpackChunkName: "about" */ "../views/home/Index.vue"),
  },
  {
    path: "/order",
    name: "order",
    component: () =>
      import(/* webpackChunkName: "about" */ "../views/order/Index.vue"),
  },
  {
    path: "/mine",
    name: "mine",
    component: () =>
      import(/* webpackChunkName: "about" */ "../views/mine/Index.vue"),
  },
  {
    path: "/home/ForHere",
    name: "home-ForHere",
    component: () =>
      import(/* webpackChunkName: "about" */ "../views/home/ForHere/Index.vue"),
  },
  {
    path: "/home/TakeAway",
    name: "home-TakeAway",
    component: () =>
      import(/* webpackChunkName: "about" */ "../views/home/TakeAway/Index.vue"),
  },
];

const router = new VueRouter({
  mode: "history",
  base: process.env.BASE_URL,
  routes,
});

export default router;
