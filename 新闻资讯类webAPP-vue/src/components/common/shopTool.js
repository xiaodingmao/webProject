let shopTool={} //用于操作购物车商品的增删改查，浏览器的本地存储中的商品信息
let shop=JSON.parse(window.localStorage.getItem('goodsInfo')||'{}')//储存购物车的信息

//存储商品
shopTool.saveGoods=function(){
  window.localStorage.setItem('goodsInfo',JSON.stringify(shop))
}
//增加商品
shopTool.addUpdate=function(good){
  //判断该商品是否存在在shopStore中
  if(shop[good.id]){
    shop[good.id]+=good.num
  }else{
    shop[good.id]=good.num
  }
  this.saveGoods()
}
//删除商品
shopTool.deleteGood=function(id){
  //if(shop[id]){
  console.log(shop[id])
    delete shop[id]
 // }
  this.saveGoods()
}

//获取商品信息
shopTool.getGoods=function(){
  return JSON.parse(window.localStorage.getItem('goodsInfo')||'{}')
}

//统计商品总价和总量
shopTool.getGoodsCount=function(){
  let sum=0
  for( let item in shop){
     sum+=shop[item]
  }
  return sum
}

export default shopTool
