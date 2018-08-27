<template>
  <div class="mb">
    <head-nav title="图片详情"></head-nav>
    <div class="photoImgs">
      <img class="preview-img" @click="$preview.open(index, photo)" height="300" :key="index"  v-for="(item,index) in photo"  :src="item.picUrl"  v-lazy="item.picUrl">
    </div>
  </div>
</template>
<script>
  export default {
    data(){
      return{
        photo:[]
      }
    },
    created(){
     // console.log(this.$route.query)
      let title=this.$route.query.title
      let id=this.$route.query.id
      this.$ajax.get(this.dataURL('vue.php',title,id))
        .then((res)=>{
        //设置每张预览图的大小
          res.data.forEach((item,index)=>{
            item.src=item.picUrl
            item.w=500
            item.h=300
          })
          this.photo=res.data
        })
    }
  }
</script>

<style>

</style><style lang="less">
  @rem:750/10rem;
  .mb{
    margin-bottom: 130/@rem;
  }
  .photoImgs{
    padding:40/@rem 40/@rem 0;
    background: white;
    position: relative;
    img{
      display: block;
      width: 670/@rem;
      margin-bottom: 30/@rem;
      object-fit:cover;
    }
  }
</style>

