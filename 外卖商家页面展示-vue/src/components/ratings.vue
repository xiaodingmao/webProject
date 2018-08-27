<template>
  <div class="ratingsWrapper" ref="ratingsWrapper">
    <div class="ratings-content">
      <div class="info">
        <div class="mark">
          <div class="num">{{seller.score}}</div>
          <div class="text">综合评分</div>
          <div class="contrast">高于周边商家{{seller.rankRate}}%</div>
        </div>
        <div class="stars">
          <div class="serviceScore">
            <span class="text">服务态度</span>
            <star :size="36" :score="seller.serviceScore"></star>
            <span class="num">{{seller.serviceScore}}</span>
          </div>
          <div class="foodScore">
            <span class="text">服务态度</span>
            <star :size="36" :score="seller.foodScore"></star>
            <span class="num">{{seller.foodScore}}</span>
          </div>
          <div class="deliveryTime">
            <span class="text">送达时间</span>
            <span class="time">{{seller.deliveryTime}}</span>
          </div>
        </div>
     </div>
     <div class="divider"></div>
      <evaluation :comments="ratings" ref="eval"></evaluation>
   </div>
  </div>
</template>
<script>
import axios from 'axios'
import star from './mods/star.vue'
import evaluation from './mods/evaluation.vue'
import Scroll from 'better-scroll'
export default {
  props: ['seller'],
  data () {
    return {
      ratings: []
    }
  },
  mounted () {
    axios.get('/static/data.json').then(res => {
      this.ratings = res.data.ratings
      this.$refs['eval'].counts()
    })
    this.$nextTick(() => {
      /* eslint-disable no-new */
      new Scroll(this.$refs['ratingsWrapper'], {
        click: true
      })
    })
  },
  components: {
    star,
    evaluation
  }
}

</script>
