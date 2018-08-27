<template>
  <div class="evaluation" ref="evaluationWrapper">
    <div class="classify">
      <span v-for="(item, index) in classify" :key="item.id" class="item" :class="{'active': item.active,
      'bad': index === 2, 'badActive':index===2&&item.active }" @click="classifyclick(item)">
              {{item.name}}
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
          <div class="avatar">
            <img :src="item.avatar" width="28" height="28">
          </div>
          <div class="content">
            <div class="user">
              <span class="name">{{item.username}}</span>
              <span class="rateTime">{{item.rateTime}}</span>
            </div>
            <div class="star-wrapper">
              <star :size="24" :score="item.score"></star>
              <span class="deliveryTime">{{item.deliveryTime | time}}分钟送达</span>
            </div>
            <div class="text">
              {{item.text}}
            </div>
            <div class="recommend">
              <span class="icon icon-thumb_up" v-show="item.recommend.length"></span>
              <span class="dish" v-for="dish in item.recommend" :key="dish.id">{{dish}}</span>
            </div>
          </div>
        </li>
      </ul>
    </div>
  </div>
</template>
<script>
import star from './star.vue'
export default {
  props: ['comments'],
  data () {
    return {
      classify: [
        {name: '全部', count: 0, active: true},
        {name: '推荐', count: 0, active: false},
        {name: '吐槽', count: 0, active: false}
      ],
      remarks: [],
      flag: true
    }
  },
  components: {
    star
  },
  filters: {
    time (value) {
      return value || 0
    }
  },
  computed: {
    commentShow () {
      let arr = []
      if (this.flag) {
        this.remarks.forEach(val => {
          if (val.text.length > 0) arr.push(val)
        })
      } else {
        arr = this.remarks
      }
      return arr
    }
  },
  mounted () {
  },
  methods: {
    counts () {
      this.$nextTick(() => {
        this.remarks = this.comments
        this.comments.forEach((val) => {
          this.classify[0].count++
          if (val.rateType) {
            this.classify[2].count++
          } else {
            this.classify[1].count++
          }
        })
      })
    },
    classifyclick (item) {
      this.classify.forEach(val => {
        val.active = false
      })
      item.active = true
      if (item.name === '全部') {
        this.remarks = [] // 先置空放评论的数组
        this.remarks = this.comments
      } else if (item.name === '推荐') {
        this.remarks = [] // 先置空放评论的数组
        this.comments.forEach(val => {
          if (!val.rateType) {
            this.remarks.push(val)
          }
        })
      } else {
        this.remarks = [] // 先置空放评论的数组
        this.comments.forEach(val => {
          if (val.rateType) {
            this.remarks.push(val)
          }
        })
      }
    }
  }
}
</script>
