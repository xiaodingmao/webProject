<template>
  <div class="cartcontrol">
    <transition name="fadeRotate">
    <div class="cart-decrease" v-show="food.num >0" @click="decreaseCount()">
      <span class="icon-remove_circle_outline inner"></span>
    </div>
    </transition>
    <div class="cart-count" v-show="food.num >0">{{ food.num }}</div>
    <div class="cart-add" @click="addCount($event)">
      <i class="icon-add_circle"></i>
    </div>
  </div>
</template>
<script>
import Vue from 'vue'
import {mapState, mapMutations} from 'vuex'
export default {
  props: ['food'],
  methods: {
    ...mapMutations([
      'vxaddCart',
      'vxdecreaseCart'
    ]),
    addCount () {
      // console.log(e)
      if (typeof this.food.num === 'undefined') {
        Vue.set(this.food, 'num', 0)
        Vue.set(this.food, 'active', true)
      }
      this.food.num++
      if (this.food.active) {
        this.vxaddCart(this.food)
        this.food.active = false
      }
    },
    decreaseCount () {
      this.food.num--
      if (this.food.num === 0) {
        this.vxdecreaseCart(this.food)
      }
    }
  },
  computed: {
    ...mapState([
      'vxfood'
    ])
  }
}
</script>
