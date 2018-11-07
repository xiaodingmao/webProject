import Vue from 'vue'
import Router from 'vue-router'
import index from '@/components/index'
import headnav from '../components/common/headNav.vue'
import newslist from '../components/news/newslist.vue'
import photoList from '../components/photo/photos.vue'
import photoDetail from '../components/photo/photo.vue'
import goodsList from '../components/shop/goodsList.vue'
import goodDetail from '../components/shop/goodDetail.vue'
import sheet from '../components/common/sheet.vue'
import map from '../components/common/map.vue'
import weather from '../components/common/weather.vue'
import shopcart from '../components/shop/shopcart.vue'
import classes from '../components/common/classes.vue'
import bannerDetail from '../components/banner/bannerDetail.vue'
import newsDetail from '../components/news/newsDetail.vue'
Vue.use(Router)

//数据请求
import Axios from 'axios'
Axios.defaults.baseURL='http://47.96.29.109/vueProject/'
Vue.prototype.$ajax=Axios
Vue.prototype.dataURL=function (file,title,id) {
   id=(id===undefined)?'':id
   return `${file}?title=${title}${id}`
}

//引入jquery
import jquery from 'jquery'
Vue.prototype.$=jquery

//安装全局组件
Vue.component('headNav',headnav)

export default new Router({
  linkActiveClass:'rlActive',
  routes: [
    {
      path:'/',
      redirect:{name:'index'}
    },
    {
      path: '/index.html',
      name: 'index',
      component: index
    },
    {
      path:'/news/list',
      name:'newsList',
      component:newslist
    },
    {
      path:'/news/list/detail',
      name:'newsDetail',
      component:newsDetail
    },
    {
      path:'/photo/list',
      name:'photoList',
      component:photoList
    },
    {
      path:'/photo/list/detail',
      name:'photoDetail',
      component:photoDetail
    },
    {
      path:'/goods/list',
      name:'goodsList',
      component:goodsList
    },
    {
      path:'/goods/list/detail',
      name:'goodDetail',
      component:goodDetail
    },
    {
      path:'/sheets',
      name:'sheet',
      component:sheet
    },
    {
      path:'/map',
      name:'map',
      component:map
    },
    {
      path:'/weather',
      name:'weather',
      component:weather
    },
    {
      path:'/goods/shopcart',
      name:'shopcart',
      component:shopcart
    },
    {
      path:'/myclasses',
      name:'classes',
      component:classes
    },
    {
      path:'/bannerDetail',
      name:'bannerdetail',
      component:bannerDetail
    }

  ]
})
