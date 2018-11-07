<template>
  <div class="mb">
      <head-nav title="新闻详情"></head-nav>
      <div class="con">
        <h2 class="title" v-text="details.title"></h2>
        <span class="title" v-text="details.time"></span>
        <span class="source">{{details.source}}</span>
        <img v-lazy="details.picUrl" class="pic" :alt="details.title">
        <div class="content" v-html="details.content"></div>
        <p class="editor">
            <span>{{details.reporter}}</span>
            <span>责任编辑{{details.editor}}</span>
        </p>

      </div>
  </div>
</template>
<script>
  export default {
    data(){
      return{details:{}}

    },
    created(){
      //console.log(this.$route.query)
      let id=this.$route.query.id
      let title=this.$route.query.title
      this.$ajax.get(this.dataURL('vue.php',title,id))
        .then((res)=>{
          this.details=res.data
         //console.log(this.details)
        })
    }
  }
</script>

<style scoped lang="less">
  @rem:750/10rem;
  .mb{
    margin-bottom: 130/@rem;
  }
  .con{
    padding: 0 40/@rem;
    h2{
      text-align: left;
    }
    .title{
      font-size: 40/@rem;
      color: #3f4146;
    }
    .source{
      font-size: 24/@rem;
    }
    .time{
      font-size: 20/@rem;
    }
    .pic{
      display: block;
      margin: auto;
      width: 670/@rem;
    }
    .content{
      font-size: 32/@rem;
      text-align: left;
      text-indent: 2em;
    }
    .editor{
      display: flex;
      justify-content: space-between;
      color: #9d9ea3;
      font-size: 22/@rem;
    }

  }
</style>

