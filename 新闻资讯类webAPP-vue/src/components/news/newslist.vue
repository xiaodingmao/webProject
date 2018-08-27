<template>
  <div class="newsList mb">
    <head-nav title="新闻列表"></head-nav>
    <ul>
      <li v-for="item in newslist" :key="item.id">
        <router-link :to="{name:'newsDetail',query:{id:item.id,title:'newsList'}}">
          <div class="pic">
            <img :src="item.picUrl" v-lazy="item.picUrl" :alt="item.title" width="100%" height="100%">
          </div>
          <div class="con">
            <h2 v-text="item.title"></h2>
            <p>
              <span class="fl" v-text="item.time"></span>
              <span class="fr">来源:{{item.source}}</span>
            </p>
          </div>
        </router-link>
      </li>
    </ul>
  </div>
</template>
<script>
  export default {
    data(){
      return{newslist:[]}
    },
    created(){
      //console.log(this.$route.query)
      let title=this.$route.query.news
      this.$ajax.get(this.dataURL('vue.php',title))
        .then((res)=>{
          // console.log(res.data)
          this.newslist=res.data
        })
    }

  }
</script>

<style scoped lang="less">
  @rem:750/10rem;
  .mb{
    margin-bottom: 130/@rem;
  }
  .newsList{
    text-align: left;
    ul li{
      padding: 25/@rem 0;
      border-bottom: 1px solid #ddd;
    }
    a{
      /*display: block !important;*/
      display: flex;
      justify-content: center;
    }
    .pic{
      width: 110/@rem;
      height: 110/@rem;
      margin-right: 25/@rem;
    }
    .con{
      width: 550/@rem;
      height: 110/@rem;

      display: flex;
      flex-flow: wrap;
      align-content:space-between;
    }
    h2{
      width: 100%;
      overflow: hidden;
      white-space: nowrap;
      text-overflow: ellipsis;
      color: #555;
      font-weight: normal;
      font-size: 25/@rem;
    }
    p{
      width: 100%;
      color: #999;
      font-size: 22/@rem;
    }
    p span{
      /*-padding: 0 25/@rem;*/
    }
  }
</style>
