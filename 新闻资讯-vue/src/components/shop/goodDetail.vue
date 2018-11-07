<template>
  <div class="mb">
    <head-nav title="商品详情"></head-nav>
    <div class="shopdedatils">
      <img :src="good.imgUrl" width="100%" height="100%">
      <h3>{{good.des}}</h3>
      <p class="money">
        <span class="symbol">{{good.symbol}}</span><span class="price">{{good.price}}</span>
      </p>
      <p class="courier clearFix">
        <span class="fl">快递：包邮</span><span class="fr">{{good.alreadyPaid}}</span>
      </p>
      <div class="buyNum clearFix">
        <p class="fl buyfont">购买数量</p>
        <p class="addNum fr">
          <a href="javascript:;" class="reduce" @click="shopReduce">-</a>
          <a href="javascript:;" class="num">{{num}}</a>
          <a href="javascript:;" class="add" @click="shopAdd">+</a>
        </p>
      </div>
      <div class="buy">
        <a href="javascript:;" class="addCart" @click="addcart">加入购物车</a>
        <router-link :to="{name:'shopcart',query:{title:'likeYou'}}"  class="nowBuy">立刻购买</router-link>
      </div>
    </div>

  </div>
</template>
<script>
  import connect from '../common/connect'
  import shopTool from '../common/shopTool'
  export default {
    data(){
      return{
        good:{},
        num:0
      }
    },
    methods:{
      shopReduce(){
        if(this.num<=0) return
        this.num--
      },
      shopAdd(){
        this.num++
        //触发vuex中的数据改变
        //this.$store.commit('addCartCount')
      },
      addcart(){
        connect.$emit('addcart',this.num)
        shopTool.addUpdate({
          id:this.good.id,
          num:this.num
        })
      }
    },
    created(){
      //console.log(this.$route.query)
      let id=this.$route.query.id
      let title=this.$route.query.title
      this.$ajax.get(this.dataURL('vue.php',title,id))
        .then((res)=>{
          // console.log(res.data)
          this.good=res.data
        })
    }
  }
</script>

<style scoped lang="less">
  @rem:750/10rem;
  .mb{
    margin-bottom: 130/@rem;
  }
  .shopdedatils{
    padding: 22/@rem;
    position: relative;
    text-align: left;
    background: white;
    img{
      display: block;
      margin: auto;
    }
    h3{
      font-size: 33/@rem;
    }
    .money{
      color: red;
      .symbol{
        font-size: 22/@rem;
      }
      .price{
        font-size: 32/@rem;
      }
    }
    .courier{
      font-size: 25/@rem;
      color: #999;
    }
    .buyNum{
      border: 1px solid #e7e7e7;
      border-left: none;
      border-right: none;
      padding: 20/@rem 0;
      .buyfont{
        font-size: 40/@rem;
      }
      .addNum{
        font-size: 40/@rem;
        a{
          width: 50/@rem;
          height: 50/@rem;
          padding:5/@rem;
          background: #f1f1f1;
          display: inline-block;
          color: #878787;
          text-align: center;
          vertical-align: middle;
        }
        a:active{
          background: #ddd;
        }
      }
    }
    .buy{
      display: flex;
      height: 96/@rem;
      text-align: center;
      line-height: 96/@rem;
      a{
        flex: 1;
        color: white;
        font-size: 31/@rem;
        opacity: 0.7;
      }
      .addCart{
        background: #ff9402;
      }
      .nowBuy{
        background: #ff5000;
      }
      a:active{
        opacity:1;
      }
    }
  }
</style>

