<template>
  <div class="shopCart" >
    <div class="content" @click="showcart">
      <div class="content-left">
        <div class="logo-wrapper">
          <div class="logo active">
            <i class="icon-shopping_cart"></i>
          </div>
          <div class="badge" v-show="totalCount > 0">{{totalCount}}</div>
        </div>
        <div class="price" :class="{'active':totalPrice}" v-show="totalPrice">￥{{totalPrice}}</div>
        <div class="desc" v-show="totalPrice < 99">另需要配送费{{deliveryPrice}}元</div>
      </div>
      <div class="content-right" :class="{'enough': totalPrice >= minPrice}">
        <div class="pay">{{payDesc}}</div>
      </div>
    </div>
    <!--购物车列表-->
    <transition name="transHeight">
    <div class="shopcart-list"  v-show="totalPrice > 0 && show">
      <div class="list-header">
        <h1 class="title">购物车</h1>
        <span class="empty" @click="empty()">清空</span>
      </div>
      <div class="list-content" ref="cartWrap">
        <ul>
          <li class="food" v-for="item in shopfood" :key="item.id">
            <span class="name">{{item.name}}</span>
            <div class="price">
              <span>￥{{item.price}}</span>
            </div>
            <div class="cartcontrol-wrapper">
              <purchaseNum :food="item"></purchaseNum>
            </div>
          </li>
        </ul>
      </div>
    </div>
    </transition>
  </div>
</template>
<script>
import purchaseNum from './pursenum.vue'
import Scroll from 'better-scroll'
export default{
  props: ['deliveryPrice', 'minPrice', 'shopfood'],
  data () {
    return {
      show: false
    }
  },
  methods: {
    empty () {
      this.shopfood.forEach(food => {
        food.num = 0
      })
      this.show = false
    },
    // 展示购物车时，需要滚动操作
    showcart () {
      this.show = !this.show
      this.$nextTick(() => {
        /* eslint-disable no-new */
        new Scroll(this.$refs['cartWrap'], {
          click: true
        })
      })
    }
  },
  computed: {
    totalPrice () {
      let totals = 0
      this.shopfood.forEach(food => {
        totals += food.num * food.price
      })
      return totals
    },
    totalCount () {
      let counts = 0
      this.shopfood.forEach(food => {
        counts += food.num
      })
      return counts
    },
    payDesc () {
      if (this.totalPrice === 0) {
        return `还差${this.minPrice}元起送`
      } else if (this.totalPrice < this.minPrice) {
        return `还差${this.minPrice - this.totalPrice}元起送`
      } else {
        return `去结算`
      }
    }
  },
  components: {
    purchaseNum
  }
}
</script>
