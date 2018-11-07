<template>
  <div class="mb">
    <head-nav title="购物车"></head-nav>
    <div class="shopArea">
      <p class="location clearFix" v-if="location">
        <span class="fl">送到地点: {{location}}</span>
        <span class="fr">编辑地址</span>
      </p>

      <div class="shop" v-for="(item,index) in cartList" :key="index">
        <div class="shopShow">
          <div class="pic ">
            <img :src="item.imgUrl" width="100%" height="100%" alt="">
          </div>
          <div class="des ">{{item.des}}</div>
        </div>

        <div class="buyNum ">
          <p class=" buyfont">{{item.symbol}} {{item.price}}</p>
          <p class="addNum">
            <a href="javascript:;" class="reduce" @click="shopReduce(index)">-</a>
            <a href="javascript:;" class="num" >{{item.cartnum}}</a>
            <a href="javascript:;" class="add" @click="shopAdd(index)">+</a>
          </p>
          <a href="javascript:;" class="del" @click="del(index)">删除</a>
        </div>
      </div>

      <div class="totalPrice">
        <div class="total">
          <p class="totalMoney">
            <span class="font">总计:</span> <span>￥ {{totalPrice.price}}</span>
          </p>
          <p class="preferential">
            总金额￥{{totalPrice.price}} 优惠￥0.00
          </p>
        </div>
        <div class="goPayment">
          <span class="font">去结算</span><span class="num">({{totalPrice.count}}件)</span>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
  import shopTool from '../common/shopTool'
  import connect from '../common/connect'
  export default {
    data(){
      return{
        cartList:[],
        location:''
      }
    },
    created(){
         //获取本地存储购物车信息
      let shop=shopTool.getGoods()
      let shopId=Object.keys(shop)
     //console.log(shopId)
      let title=this.$route.query.title
     //console.log(title)
      shopId.forEach((item)=>{
       // console.log(item,this.dataURL('vue.php',title,item))

        this.$ajax.get(this.dataURL('vue.php',title,item))
          .then((res)=>{
           // console.log(res.data)
            res.data['cartnum']=shop[item]
            this.cartList.push(res.data)
          }).catch((error)=>{
          console.log(error)
        })
      })
      console.log(this.cartList)

    },
    computed:{
      totalPrice(){
        let sum={
          count:0,
          price:0
        }
        this.cartList.forEach((item,index)=>{
          sum.count+=item.cartnum
          sum.price+=item.cartnum*item.price
        })
        return sum
      }
    },
    methods:{
      shopReduce(index){
        if( this.cartList[index].cartnum<=0) return
        this.cartList[index].cartnum--
        shopTool.addUpdate({
          id:this.cartList[index].id,
          num:-1
        })
        connect.$emit('addcart',-1)
      },
      shopAdd(index){
        this.cartList[index].cartnum++
        shopTool.addUpdate({
          id:this.cartList[index].id,
          num:1
        })
        connect.$emit('addcart',1)
      },
      del(index){
        //console.log(this.cartList[index].id)
        let id=this.cartList[index].id
        let num=this.cartList[index].cartnum
        this.cartList.splice(index,1)
        shopTool.deleteGood(id)
        connect.$emit('addcart',-num)
      }
    }
  }
</script>

<style scoped lang="less">
  @rem:750/10rem;
  .mb{
    margin-bottom: 130/@rem;
  }
  .shopArea{
    text-align: left;
    background: #fff;

    .location{
      font-size: 32/@rem;
      color: #ccc;
      padding: 10/@rem;
      padding: 20/@rem 55/@rem;
    }
    .shop{
      border-bottom: 1px solid #ddd;
      border-top: 1px solid #ddd;
      padding: 0 55/@rem;
      .shopShow{
        display: flex;
        justify-content: space-between;
        align-items: center;
        overflow: hidden;
        padding: 25/@rem 0;
        .pic{
          width: 200/@rem;
          height: 200/@rem;
        }
        .des{
          width: 400/@rem;
          font-size: 35/@rem;
        }
      }

      .buyNum{
        border-top: 1px solid #ddd;
        border-left: none;
        border-right: none;
        padding: 20/@rem 0;
        display: flex;
        justify-content: space-between;
        align-items: center;
        .buyfont{
          font-size: 40/@rem;
        }
        .addNum{
          font-size: 40/@rem;
          a{
            width: 60/@rem;
            height: 60/@rem;
            background: #f1f1f1;
            display: inline-block;
            color: #878787;
            text-align: center;
          }
          a:active{
            background: #ddd;
          }
        }
        .del{
          color: skyblue;
          font-size: 40/@rem;
        }
      }
    }
    .totalPrice{
      height: 100/@rem;
      text-align: center;
      display: flex;
      justify-content: space-between;
      margin-top: 20/@rem;
      background: rgba(255,255,255,0.7);
      box-shadow: 0 -1px 2px #d7d7d7;
      /*align-items: center;*/
      .all{

        color: #999;
        font-size: 20/@rem;
        i{
          width: 40/@rem;
          height: 40/@rem;
          border-radius: 50%;
          background: #e93b3d;
        }
        i::after{
          content: '';
        }
      }
      .total{
        text-align: left;
        text-indent: 1em;
        p{
          height: 50%;
          font-size: 32/@rem ;
          line-height: 50/@rem;
          color: #999;
        }
        .totalMoney{
          color: #e4393c;
          font-weight: bold;
          .font{
            color: #333;
          }
        }
        .preferential{
          font-size: 18/@rem;
        }
      }
      .goPayment{
        width: 220/@rem;
        background: #e4393c;
        color: #fff;
        span{
          vertical-align: middle;
        }
        .font{
          font-size: 32/@rem;
        }
        .num{
          font-size: 23/@rem;
        }
      }
    }
  }

</style>

