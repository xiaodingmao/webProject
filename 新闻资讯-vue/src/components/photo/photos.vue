<template>
  <div class="mb">
    <head-nav title="图文分享"></head-nav>
    <div class="tabItem">
      <a href="javascript:;" v-for="(item,index) in photoTag" :key="index" :class="item.id==1?'active':''" @click="getList(item.tip),tabActive(item.id)">{{item.title}}</a>
    </div>
    <div class="tabCon">
      <div class="conList">
        <ul>
          <li v-for="item in photoList" :key="item.id">
             <router-link :to="{name:'photoDetail',query:{id:item.id,title:item.tip}}">
              <div class="pic">
                <img :src="item.picUrl" v-lazy="item.picUrl" :alt="item.title" width="100%" height="100%">
              </div>
              <div class="con">
                <h2 v-text="item.title"></h2>
              </div>
             </router-link>
          </li>
        </ul>
      </div>
    </div>
  </div>
</template>
<script>
  export default {
    data(){
      return{
        photoTag:[],
        photoList:[]
      }
    },
    created(){
      this.$ajax.get(this.dataURL('vue.php','shareNav'))
        .then((res)=>{
         this.photoTag=res.data
      })
      this.getList('womanStar')
    },
    methods:{
      getList(title){
         this.$ajax.get(this.dataURL('vue.php',title))
           .then((res)=>{
              this.photoList=res.data
           //  console.log(this.photoList)
           })
      },
      tabActive(id){
        let tab=document.getElementsByClassName('tabItem')[0].getElementsByTagName('a')
        for(let i=0;i<this.photoTag.length;i++){
          tab[i].classList.remove('active')
        }
          tab[id-1].classList.add('active')
      }
    }
  }
</script>

<style scoped lang="less">
  @rem:750/10rem;
  .mb{
    margin-bottom: 130/@rem;
  }
  .tabItem{
    font-size: 30/@rem;
    display: flex;
    a{
      flex: 1;
      color: #26a2ff;
      padding: 30/@rem 0;
    }
    a.active{
      border-bottom: 3px solid #26a2ff;
      color: #000;
    }
  }
  .tabCon{
    .conList{
      ul li{
        padding: 25/@rem 0;
        border-bottom: 1px solid #ddd;
      }
      a{
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
        align-items: center;
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
    }
  }
</style>
