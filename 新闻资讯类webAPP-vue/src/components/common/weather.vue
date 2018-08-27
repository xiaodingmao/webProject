<template>
  <div class="bg">
     <head-nav title="实时天气预报"></head-nav>

     <div class="weather">
      <!-- 地址显示-->
       <div class="address">{{cityInfos.c9}} {{cityInfos.c7}} {{cityInfos.c5}}</div>
      <!--   时间显示牌-->
       <div class="clearFix">
         <div id="date" class="on">
           <div class="date_main clearfix">
             <div class="date_left">
               <div class="location">{{location}}</div>
               <div class="main">
                 <p class="month" id="month">{{dateTime.month}}月</p>
                 <p class="date" id="day">{{dateTime.day}}</p>
               </div>
             </div>
             <div class="date_right">
               <p class="time" id="time">{{dateTime.hour}} :{{dateTime.minu}} :{{dateTime.sec}}</p>
               <p class="date" id="year">{{dateTime.year}}年{{dateTime.month}}月{{dateTime.day}}日</p>
               <p class="week" id="week">星期{{arr[dateTime.week]}}</p>
             </div>
           </div>
           <div class="date_close" id="date_close" ></div>
         </div>
       </div>

       <ul class="weatherList">
          <li>
            <p class="week">周{{arr[dateTime.week]}}(实时)</p>
            <p class="day">{{dateTime.month}}月{{dateTime.day}}日</p>
            <div class="pic"><img :src="now.weather_pic" width="100%" height="100%" alt=""></div>
            <p class="temperature"> {{now.temperature}} °C</p>
            <p class="nowWeather">{{now.weather}}</p>
            <p class="windDir">{{now.wind_direction}}</p>
            <p class="humidity">空气湿度 {{now.sd}}</p>
          </li>
         <li>
           <p class="week">周{{arr[((dateTime.week+1)%7)]}}</p>
           <p class="day">{{dateTime.month}}月{{dateTime.day+1}}日</p>
           <div class="pic"><img :src="f2.day_weather_pic" width="100%" height="100%" alt=""></div>
           <p class="temperature">{{f2.night_air_temperature}} ~ {{f2.day_air_temperature}} °C</p>
           <p class="nowWeather">{{f2.day_weather}}</p>
           <p class="windDir">{{f2.day_wind_direction}}</p>
           <p class="humidity">降水概率 {{f2.jiangshui}}</p>
         </li>
         <li>
           <p class="week">周{{arr[((dateTime.week+2)%7)]}}</p>
           <p class="day">{{dateTime.month}}月{{dateTime.day+2}}日</p>
           <div class="pic"><img :src="f3.day_weather_pic" width="100%" height="100%" alt=""></div>
           <p class="temperature">{{f3.night_air_temperature}} ~ {{f3.day_air_temperature}} °C</p>
           <p class="nowWeather">{{f3.day_weather}}</p>
           <p class="windDir">{{f3.day_wind_direction}}</p>
           <p class="humidity">降水概率 {{f3.jiangshui}}</p>
         </li>
       </ul>

     </div>
  </div>
</template>
<script>
  import '../../../static/css/date.css'
  //import '../../assets/dateSet.less'
  export default {
    data(){
      return{
        cityInfos:{},
        f1:{},
        f2:{},
        f3:{},
        now:{},
        location:'深圳',
        dateTime:{year:'',month:'',day:'',hour:'',minu:'',sec:'',week:''},
        arr: ['天','一','二','三','四','五','六']
      }
    },

    created(){
      //请求天气数据
         this.$.ajax({
           type: 'post',
           url: 'http://route.showapi.com/9-2',
           dataType: 'json',
           data: {
             "showapi_timestamp": this.formatterDateTime(),
             "showapi_appid": 54005, //这里需要改成自己的appid
             "showapi_sign": '623f1688fd704ea3bc884fe7dd3cca05',  //这里需要改成自己的应用的密钥secret
             "area":"深圳"
           },
           error: function(XmlHttpRequest, textStatus, errorThrown) {
             alert("操作失败!");
           },
           //运用箭头函数绑定父级作用域
           success: (result)=> {
             //console.log(result)
             this.f2=result.showapi_res_body.f2;
             this.cityInfos=result.showapi_res_body.cityInfo;
             this.f1=result.showapi_res_body.f1;
             this.f3=result.showapi_res_body.f3;
             this.now=result.showapi_res_body.now;
           }
         })
      //实时执行时间函数
      setInterval(this.timePlay,1000)
      this.timePlay()
    },
    methods:{
      //重组当前时间格式
      formatterDateTime(){
        let date=new Date()
        let month=date.getMonth()+1
        let dateTime=date.getFullYear()+(month>=10?month:'0'+month)+(date.getDate()<10?'0'+date.getDate():date.getDate())
                     +(date.getHours()<10?'0'+date.getHours():date.getHours())+(date.getMinutes()<10?'0'+date.getMinutes():date.getMinutes())
                     +(date.getSeconds()<10?'0'+date.getSeconds():date.getSeconds())
        return dateTime
      },
      //时间实时显示函数
      timePlay(){
        let date=new Date()
        let month=date.getMonth()+1
        this.dateTime.year=date.getFullYear()
        this.dateTime.month=(month>=10?month:'0'+month)
        this.dateTime.day=(date.getDate()<10?'0'+date.getDate():date.getDate())
        this.dateTime.hour=(date.getHours()<10?'0'+date.getHours():date.getHours())
        this.dateTime.minu=(date.getMinutes()<10?'0'+date.getMinutes():date.getMinutes())
        this.dateTime.sec=(date.getSeconds()<10?'0'+date.getSeconds():date.getSeconds())
        this.dateTime.week=date.getDay()
       // console.log(this.dateTime.week)
      }
    }
  }
</script>

<style scoped lang="less">
  @rem:750/10rem;
  .bg{
    height: 100%;
    background: -webkit-linear-gradient(
      top,
      #394984,
      #edb46d
    ) !important;
  }
  .weather{
    overflow: hidden;
    zoom:1;
    padding-top: 10/@rem;

    .address{
      color: #fff;
      font-size: 28/@rem;
    }
    .location{
      font-size: 2px ;
      color: #eee;
      text-shadow: 1px 1px 1px #555;
      -webkit-text-size-adjust: 100% ;
    }
    .weatherList{
      display: flex;
      height: 440/@rem;
      border-top: 1px solid rgba(255,255,255,0.1);
      li{
        flex: 1;
        border-right: 1px solid rgba(255,255,255,0.1);
        padding: 20/@rem 0;
        overflow: hidden;
        p{
          color: #fff ;
          text-shadow: 1px 1px 1px #555;;
          font-size: 20/@rem;
          margin: 6/@rem 0;
        }
        .week{

        }
        .day{
          font-size: 16/@rem;
          opacity: 0.5;
        }
        .pic{
          width: 130/@rem;
          height: 130/@rem;
          margin: auto;
        }
        .temperature{
        }
        .nowWeather{

        }
        .windDir{

        }
        .humidity{

        }

      }
      li:last-child{
        border: none;
      }
    }
  }
</style>
