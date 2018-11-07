<template>
  <div id="app">
    <header></header>
    <header class="hd fixed">即时新闻资讯</header>
    <router-view/>
    <footer class="ft">
      <router-link :to="{name:'index'}" class="link">
        <div class="svg iconfont icon-shouye"></div>
        <p>首页</p>
      </router-link>
      <router-link :to="{name:'map'}" class="link">
        <div class="svg iconfont icon-ditu"></div>
        <p>地图</p>
      </router-link>
     <router-link :to="{name:'weather'}" class="link">
        <div class="svg iconfont icon-tianqichaxun"></div>
        <p>天气</p>
     </router-link>
      <router-link :to="{name:'shopcart',query:{title:'likeYou'}}" class="link">
        <div class="svg iconfont icon-gouwuche count">
          <i class="showNum" v-if="pickNum">{{pickNum}}</i>
        </div>
        <p>购物</p>
      </router-link>
     <router-link :to="{name:'classes'}" class="link">
        <div class="svg iconfont icon-weibiaoti2fuzhi12"></div>
        <p>我的课程</p>
     </router-link>
    </footer>
  </div>
</template>

<script>
  import connect from './components/common/connect'
  import shopTool from './components/common/shopTool'
export default {
  name: 'App',
  data(){
    return{
      pickNum:shopTool.getGoodsCount() //初始化时的存储的历史的购物车数量
    }
  },
  computed:{
    /*num(){
      return this.$store.state.num
    }*/
  },
  created(){
    this.remChange();
    window.addEventListener('resize',this.remChange);
    connect.$on('addcart',(num)=>{
      this.pickNum+=num
    })
  },
  methods:{
    remChange(){
        var html = document.getElementsByTagName('html')[0];
        var witdh = html.getBoundingClientRect().width;
        if( witdh >= 750 ){
          witdh = 750;
        }
        html.style.fontSize = witdh / 10 +'px';
    }
  }
}
</script>

<style scoped lang="less">
  @rem :750/10rem;
  #app {
    font-family: 'Avenir', Helvetica, Arial, sans-serif;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
    text-align: center;
    color: #2c3e50;
    max-width: 750px;
    height: 100%;
    margin: auto;
    position: relative;
    header{
      height: 80/@rem;
      line-height: 80/@rem;
      font-size: 30/@rem;
      color: white;
      background: #26a2ff;
    }
    header.fixed{
      position: fixed;
      top: 0;
      left: 0;
      right: 0;
      margin: auto;
      width: 100%;
      z-index: 999;
    }
  }


  .ft{
    position: fixed;
    right: 0;
    bottom: 0;
    left: 0;
    z-index: 9;
    height: 130/@rem;
    background-image: -webkit-gradient(linear, left top, left bottom, from(#d9d9d9), color-stop(50%, #d9d9d9), color-stop(50%, transparent));
    background-image: linear-gradient(180deg, #d9d9d9, #d9d9d9 50%, transparent 50%);
    background-size: 100% 1px;
    background-repeat: no-repeat;
    background-position: top left;
    background-color: #fafafa;
    display: flex;
    text-align: center;
    a{
      color: #18b4ed;
      text-decoration: none;
      -webkit-tap-highlight-color: rgba(0,0,0,0);
    }
    .link{
      display: block;
      /*padding: 7px 0;*/
      flex: 1;
      text-decoration: none;

    }
    .link .svg{
      margin: 15/@rem auto 5px;
      font-size: 44/@rem;
    }

    .link p{
      color: inherit;
      font-size: 24/@rem;
      line-height: 1;
    }
    .icon {
      width: 1em;
      height: 1em;
      vertical-align: -0.15em;
      fill: currentColor;
      overflow: hidden;
    }
    .count{
      position: relative;
    }
    .count .showNum{
      position: absolute;
      margin: auto;
      width: 40/@rem;
      height: 40/@rem;
      line-height: 40/@rem;
      background: red;
      color: #fff;
      font-size: 12/@rem;
      border-radius: 50%;
      font-style: normal;
    }

    .fade-enter-active, .fade-leave-active {
      transition: opacity 0.2s;
    }
    .fade-enter, .fade-leave-to , .fade-leave-active below version  {
      opacity: 0;
    }
  }
</style>
