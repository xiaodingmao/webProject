<template>
  <div id="app">
    <vhead :seller="datas.seller"></vhead>
    <div class="tab">
      <div class="tab-item">
        <router-link to="/goods">商品</router-link>
      </div>
      <div class="tab-item">
        <router-link to="/ratings">评论</router-link>
      </div>
      <div class="tab-item">
        <router-link to="/seller">商家</router-link>
      </div>
    </div>
    <!-- 把加载过的组件缓存起来 -->
    <keep-alive>
      <router-view :seller="datas.seller" ref="tmvue"></router-view>
    </keep-alive>
  </div>
</template>
<script>
import vhead from './components/mods/header.vue'
import axios from 'axios'
export default {
  name: 'App',
  data () {
    return {
      datas: {
        // 商户信息
        seller: {},
        // 商品信息
        goods: [],
        // 评论信息
        ratings: []
      },
      show: true
    }
  },
  // 获取后台数据
  mounted () {
    axios.get('/static/data.json').then(res => {
      this.datas.seller = res.data.seller
      // this.datas.goods = res.data.goods
      // this.datas.ratings = res.data.ratings
      /* this.$nextTick(() => {
        this.$refs.tmvue.scroll()
      }) */
    })
  },
  components: {
    vhead
  }
}
</script>
<style>
  .tab .tab-item .router-link-active{
    color:red;
  }
</style>
