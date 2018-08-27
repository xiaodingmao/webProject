<template>
   <div class="goods">
     <div class="menu-wrapper" ref="menuWrapper">
       <ul>
         <li class="menu-item" v-for="item in goods" :key="item.id"  @click="foods()" >
           <span class="text">
             <span v-show="item.type>0" class="iconMap" :class="icon[item.type]"></span>
             {{item.name}}
           </span>
         </li>
       </ul>
     </div>
     <div class="foods-wrapper" ref="foodsWrapper" >
       <ul>
         <li class="food-list food-list-hook" v-for="item in goods" :key="item.id">
           <h1 class="title">{{item.name}}</h1>
           <ul>
             <li class="food-item" v-for="food in item.foods" :key="food.id">
               <div class="icon" @click="getFoodInfo(food)"><img :src="food.icon" width="57" height="57"/></div>
               <div class="content">
                 <h2 class="name">{{food.name}}</h2>
                 <p class="description">{{food.description}}</p>
                 <div class="sell-info">
                   <span class="sell-count">月售{{food.sellCount}}份</span>
                   <span class="rating">好评率{{food.rating}}</span>
                   <div class="price">
                     <span class="newPrice">￥{{food.price}}</span>
                   </div>
                   <div class="cartcontrol-wrapper">
                   <purchaseNum :food="food"></purchaseNum>
                   </div>
                 </div>
               </div>
             </li>
           </ul>
         </li>
       </ul>
     </div>
     <shopCart :shopfood="buyfood" :deliveryPrice="seller.deliveryPrice" :minPrice="seller.minPrice"></shopCart>
     <foodDetail :foodInfo="foodDetail" ref="foodDesc"></foodDetail>
   </div>
</template>
<script>
import axios from 'axios'
import Scroll from 'better-scroll'
import shopCart from './mods/shopCart.vue'
import purchaseNum from './mods/pursenum.vue'
import foodDetail from './mods/foodDetail.vue'
export default {
  props: ['seller'],
  data () {
    return {
      icon: ['decrease', 'discount', 'special', 'invoice', 'guarantee'],
      foodDetail: {},
      goods: []
    }
  },
  mounted () {
    axios.get('/static/data.json').then(res => {
      this.goods = res.data.goods
    })
    this.$nextTick(() => {
      this.scroll()
    })
  },
  components: {
    shopCart,
    purchaseNum,
    foodDetail
  },
  computed: {
    buyfood () {
      let arr = []
      //                 回调里的参数 1.value 2.index
      this.goods.forEach(goods => {
        goods.foods.forEach(foods => {
          if (foods.num > 0) {
            arr.push(foods)
          }
        })
      })
      return arr
    }
  },
  methods: {
    scroll () {
      /* eslint-disable no-new */
      new Scroll(this.$refs['foodsWrapper'], {
        click: true
      })
      new Scroll(this.$refs['menuWrapper'], {
        click: true
      })
    },
    getFoodInfo (val) {
      this.foodDetail = val
      this.$refs['foodDesc'].foodshow()
    }
  }
}
</script>
