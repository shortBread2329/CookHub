import Vue from 'vue'
import App from '../page/post_recipes/new.vue'

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue(App)
  app.$mount('#vue')
})
