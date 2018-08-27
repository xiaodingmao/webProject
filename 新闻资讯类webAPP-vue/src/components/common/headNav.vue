<template>
  <div>
    <header>
      <a href="javascript:;" class="iconfont icon-fanhui2" @click="goBack">返回</a>
      <span>{{title}}</span>
      <a href="javascript:;"class="iconfont icon-diandian"></a>
    </header>
  </div>
</template>
<script>
  export default {
    props:['title'],
    methods:{
      goBack(){
        window.history.length > 1
          ? this.$router.go(-1)
          : this.$router.push('/')
      }
    }
  }
</script>

<style scoped lang="less">
  @rem:750/10rem;
  header{
    height: 80/@rem;
    background: #3c3f41;
    color: white !important;
    font-size: 35/@rem;
    display: flex;
    justify-content: space-between;
    align-items: center;
    letter-spacing: 2px;
    text-align: center;
    a{
      width: 2rem;
      color: white !important;

    }
  }
</style>
