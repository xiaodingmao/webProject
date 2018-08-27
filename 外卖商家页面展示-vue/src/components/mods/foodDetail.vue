<template>
  <transition name="move">
  <div class="detailWrapper" v-show="foodetailshow" ref="detailWrapper">
    <div class="foodDetail">
      <div class="back" @click="foodetailshow = !foodetailshow">
        <i class="icon-arrow_lift"></i>
      </div>
      <img :src="foodInfo.image" width="100%" height="425" alt="">
      <div class="info">
        <div class="title">{{foodInfo.name}}</div>
        <div class="desc">
          <span>月售{{foodInfo.sellCount}}份</span>
          <span>好评率{{foodInfo.rating}}%</span>
        </div>
        <div class="price">￥{{foodInfo.price}}</div>
        <div class="shopCart" v-show="foodInfo.num === 0 || foodInfo.num === undefined" @click="add()">
          <div class="text">加入购物车</div>
        </div>
        <cartcontrol :food="foodInfo" ref="cartWrapper"></cartcontrol>
      </div>
      <div class="divider"></div>
      <div class="desc">
        <div class="title">商品介绍</div>
        <div class="content">{{foodInfo.info}}</div>
      </div>
      <div class="divider"></div>
      <div class="evaluation">
        <div class="title">商品评价</div>
        <div class="classify">
          <span v-for="(item,index) in classify" :key="item.id" class="item" :class="{'active': item.active, 'bad': index == 2, 'badActive': index==2 && item.active}"
                @click="ratingChoose(item)">{{item.name}}
            <span class="count">{{item.count}}</span>
          </span>
        </div>
        <div class="switch" @click="flag= !flag">
          <span class="icon-check_circle" :class="{'on': flag}"></span>
          <span class="text">只看有内容的评价</span>
        </div>
        <div class="evel-list">
          <ul>
            <li v-for="item in commentShow" :key="item.id" class="evel">
              <div class="userInfo">
                <div class="time">{{item.rateTime}}</div>
                <div class="user">
                  <span>{{item.rateTime}}</span>
                  <img :src="item.avatar" width="12" height="12" alt="">
                </div>
              </div>
              <div class="content">
                <span class="icon" :class="item.rateType?'icon-thumb_down':'icon-thumb_up'"></span>
                <span class="text">{{item.text}}</span>
              </div>

            </li>
          </ul>
        </div>
      </div>
    </div>
  </div>
  </transition>
</template>
<script>
import cartcontrol from './pursenum.vue'
import Scroll from 'better-scroll'
export default {
  props: ['foodInfo'],
  data () {
    return {
      foodetailshow: false,
      classify: [
        {name: '全部', count: 0, active: true, comment: []},
        {name: '推荐', count: 0, active: false, comment: []},
        {name: '吐槽', count: 0, active: false, comment: []}
      ],
      flag: true,
      comments: []
    }
  },
  components: {
    cartcontrol
  },
  mounted () {
    this.$nextTick(() => {
      /* eslint-disable no-new */
      new Scroll(this.$refs['detailWrapper'], {
        click: true
      })
    })
  },
  computed: {
    commentShow () {
      let arr = []
      if (this.flag) {
        this.comments.forEach(val => {
          if (val.text.length > 0) arr.push(val)
        })
      } else {
        arr = this.comments
      }
      return arr
    }
  },
  methods: {
    add () {
      this.$refs['cartWrapper'].addCount()
    },
    foodshow () {
      this.foodetailshow = true
      this.$nextTick(() => {
        this.foodInfo.ratings.forEach(val => {
          this.classify[0].count++
          if (val.rateType) {
            this.classify[1].count++
          } else {
            this.classify[2].count++
          }
        })
        this.comments = this.foodInfo.ratings
      })
    },
    ratingChoose (item) {
      this.classify.forEach(
        val => {
          val.active = false
        }
      )
      item.active = true
      if (item.name === '全部') {
        this.comments = [] // 先置空放评论的数组
        this.comments = this.foodInfo.ratings
        // console.log(this.comments, item)
      } else if (item.name === '推荐') {
        this.comments = [] // 先置空放评论的数组
        this.foodInfo.ratings.forEach(val => {
          if (val.rateType) {
            this.comments.push(val)
          }
        })
        // console.log(this.comments, item)
      } else {
        this.comments = [] // 先置空放评论的数组
        this.foodInfo.ratings.forEach(val => {
          if (!val.rateType) {
            this.comments.push(val)
          }
        })
      }
    }
  }
}
</script>
