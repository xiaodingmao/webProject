// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'
//引入mintui
import MintUI from 'mint-ui'
import 'mint-ui/lib/style.css'
Vue.use(MintUI)
//全局css及阿里图标
import '../static/css/global.css'
import '../static/fonts/iconfont'
Vue.config.productionTip = false
//引入懒加载插件
import VueLazylod from 'vue-lazyload'
Vue.use(VueLazylod)
//引入预览图片插件
import VuePreview from 'vue2-preview'
Vue.use(VuePreview)
//引入vuex
import Vuex from 'vuex'
Vue.use(Vuex)

//定义vuex
let store=new Vuex.Store({
  state:{num:1},
  mutations:{
    addCartCount(state){
      state.num++
    }
  }
})
/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  store,
  components: { App },
  template: '<App/>'
})
