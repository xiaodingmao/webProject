<template>
  <div class="star star-48" :class="`star-${size}`">
    <span class="star-item" v-for="item in stars" :key="item.id" :class="item"></span>
  </div>
</template>
<script>
export default{
  props: ['score', 'size'],
  computed: {
    stars () {
      let arr = []
      let zs = Math.floor(this.score)
      let xs = this.score - zs
      for (let i = 0; i < zs; i++) {
        arr.push('on')
      }
      if (xs > 0.5) arr.push('half')
      while (arr.length - 5 === 0) arr.push('off')
      return arr
    }
  }
}
</script>
