<template>
  <div class="mb">
    <head-nav title="留言反馈"></head-nav>
    <div class="sheet">
      <mt-field label="用户名" placeholder="请输入用户名" v-model="username"></mt-field>
      <mt-field label="邮箱" placeholder="请输入邮箱" type="email" v-model="email"></mt-field>
      <mt-field label="密码" placeholder="请输入密码" type="password" v-model="password"></mt-field>
      <mt-field label="手机号" placeholder="请输入手机号" type="tel" v-model="phone"></mt-field>
      <mt-field label="问题反馈" placeholder="问题反馈" type="textarea" rows="4" v-model="introduction"></mt-field>
      <mt-button type="primary">提交</mt-button>
    </div>
  </div>
</template>
<script>
  export default {
    data(){
      return{
        username:'',
        email:'',
        password:'',
        phone:'',
        website:'',
        introduction:''
      }
    }
  }
</script>

<style scoped lang="less">
  @rem:750/10rem;
  .mb{
    margin-bottom: 130/@rem;
  }
  #write{
    background-color: #15131E;
    p{
      font-size: 30/@rem;
      color: rgba(128,118,212,1);
    }
  }
</style>
