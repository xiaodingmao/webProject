<template>

  <div class="mb map" id="container">
    <div id="tip"></div>
  </div>

</template>
<script>
  export default {
    mounted(){
      //初始化地图
      var map = new AMap.Map('container', {
        resizeEnable: true,
        zoom:14,//级别
       // center: [116.397428, 39.90923],//中心点坐标
        viewMode:'3D'//使用3D视图
      })
      //得到当前地图信息
      AMap.plugin('AMap.CitySearch', function () {
        var citySearch = new AMap.CitySearch()
        //自动获取用户IP，返回当前城市
        citySearch.getLocalCity(function(status, result) {
          if (status === 'complete' && result.info === 'OK') {
            if (result && result.city && result.bounds) {
              var cityinfo = result.city;
              var citybounds = result.bounds;
              document.getElementById('tip').innerHTML = '您当前所在城市：'+cityinfo;
              //地图显示当前城市
              map.setBounds(citybounds);
              console.log(result)
            }
          } else {
            document.getElementById('tip').innerHTML = result.info;
          }
        });
      })
      //添加点标记
      var marker=new AMap.Marker({
        position:map.getCenter()
      })
      map.add(marker)
    }
  }
</script>

<style scoped lang="less">
  @rem:750/10rem;
  .mb{
    margin-bottom: 130/@rem;
  }
  .map{
    height: 100%;
    font-size:14/@rem;
    #tip{
      height: 45/@rem;
      background-color: #fff;
      padding-left: 10/@rem;
      padding-right: 10/@rem;
      border: 1px solid #969696;
      position: absolute;
      font-size: 12/@rem;
      right: 10/@rem;
      top: 20/@rem;
      z-index:999;
      border-radius: 3/@rem;
      line-height: 45/@rem;
    }
  }

</style>

