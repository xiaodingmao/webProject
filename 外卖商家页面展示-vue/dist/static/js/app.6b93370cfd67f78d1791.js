webpackJsonp([1],{NHnr:function(s,t,a){"use strict";Object.defineProperty(t,"__esModule",{value:!0});var i=a("7+uW"),e={props:["score","size"],computed:{stars:function(){for(var s=[],t=Math.floor(this.score),a=this.score-t,i=0;i<t;i++)s.push("on");for(a>.5&&s.push("half");s.length-5==0;)s.push("off");return s}}},n={render:function(){var s=this.$createElement,t=this._self._c||s;return t("div",{staticClass:"star star-48",class:"star-"+this.size},this._l(this.stars,function(s){return t("span",{key:s.id,staticClass:"star-item",class:s})}))},staticRenderFns:[]},c=a("VU/8")(e,n,!1,null,null,null).exports,o={props:["seller"],data:function(){return{icon:["decrease","discount","special","invoice","guarantee"],show:!1}},components:{score:c}},r={render:function(){var s=this,t=s.$createElement,a=s._self._c||t;return a("div",{staticClass:"header"},[a("div",{staticClass:"content-wrapper"},[a("div",{staticClass:"avatar"},[a("img",{attrs:{src:s.seller.avatar,width:"64",height:"64"}})]),s._v(" "),a("div",{staticClass:"content"},[a("div",{staticClass:"title"},[a("span",{staticClass:"brand"}),a("span",{staticClass:"name"},[s._v(s._s(s.seller.name))])]),s._v(" "),a("div",{staticClass:"description"},[s._v(s._s(s.seller.description)+"/"+s._s(s.seller.deliveryTime)+"分钟送达")]),s._v(" "),a("div",{staticClass:"supports"},[a("div",{staticClass:"supports_desc"},[a("span",{staticClass:"icon decrease"}),s._v(" "),a("span",{staticClass:"text"},[s._v(s._s(s.seller.supports[0].description))])])])]),s._v(" "),a("div",{staticClass:"support-count"},[a("span",{staticClass:"count",on:{click:function(t){s.show=!s.show}}},[s._v(s._s(s.seller.supports.length+"个"))]),s._v(" "),a("i",{staticClass:"icon-keyboard_arrow_right"})])]),s._v(" "),a("div",{staticClass:"bulletin-wrapper"},[a("span",{staticClass:"bulletin-title"}),s._v(" "),a("span",{staticClass:"bulletin-text"},[s._v(s._s(s.seller.bulletin))])]),s._v(" "),a("div",{staticClass:"background"}),s._v(" "),a("transition",{attrs:{name:"fade"}},[a("div",{directives:[{name:"show",rawName:"v-show",value:s.show,expression:"show"}],staticClass:"detail"},[a("div",{staticClass:"detail-wrapper clearfix"},[a("div",{staticClass:"detail-main"},[a("h1",{staticClass:"name"},[s._v(s._s(s.seller.name))]),s._v(" "),a("div",{staticClass:"star-wrapper"},[a("score",{attrs:{score:s.seller.score}})],1),s._v(" "),a("div",{staticClass:"title"},[a("div",{staticClass:"line"}),s._v(" "),a("div",{staticClass:"text"},[s._v("优惠信息")]),s._v(" "),a("div",{staticClass:"line"})]),s._v(" "),a("ul",{staticClass:"supports"},s._l(s.seller.supports,function(t){return a("li",{key:t.id,staticClass:"support-item"},[a("span",{staticClass:"icon",class:s.icon[t.type]}),s._v(" "),a("span",{staticClass:"text"},[s._v(s._s(t.description))])])})),s._v(" "),a("div",{staticClass:"title"},[a("div",{staticClass:"line"}),s._v(" "),a("div",{staticClass:"text"},[s._v("商家公告")]),s._v(" "),a("div",{staticClass:"line"})]),s._v(" "),a("div",{staticClass:"bulletin"},[s._v(s._s(s.seller.bulletin))])])]),s._v(" "),a("div",{staticClass:"detail-close",on:{click:function(t){s.show=!s.show}}},[a("i",{staticClass:"icon-close"})])])])],1)},staticRenderFns:[]},l=a("VU/8")(o,r,!1,null,null,null).exports,v=a("mtWM"),d=a.n(v),u={name:"App",data:function(){return{datas:{seller:{},goods:[],ratings:[]},show:!0}},mounted:function(){var s=this;d.a.get("/static/data.json").then(function(t){s.datas.seller=t.data.seller})},components:{vhead:l}},f={render:function(){var s=this,t=s.$createElement,a=s._self._c||t;return a("div",{attrs:{id:"app"}},[a("vhead",{attrs:{seller:s.datas.seller}}),s._v(" "),a("div",{staticClass:"tab"},[a("div",{staticClass:"tab-item"},[a("router-link",{attrs:{to:"/goods"}},[s._v("商品")])],1),s._v(" "),a("div",{staticClass:"tab-item"},[a("router-link",{attrs:{to:"/ratings"}},[s._v("评论")])],1),s._v(" "),a("div",{staticClass:"tab-item"},[a("router-link",{attrs:{to:"/seller"}},[s._v("商家")])],1)]),s._v(" "),a("keep-alive",[a("router-view",{ref:"tmvue",attrs:{seller:s.datas.seller}})],1)],1)},staticRenderFns:[]};var _=a("VU/8")(u,f,!1,function(s){a("yrZL")},null,null).exports,p=a("/ocq"),m=a("GQaK"),h=a("Dd8w"),C=a.n(h),w=a("NYxO"),g={props:["food"],methods:C()({},Object(w.b)(["vxaddCart","vxdecreaseCart"]),{addCount:function(){void 0===this.food.num&&(i.a.set(this.food,"num",0),i.a.set(this.food,"active",!0)),this.food.num++,this.food.active&&(this.vxaddCart(this.food),this.food.active=!1)},decreaseCount:function(){this.food.num--,0===this.food.num&&this.vxdecreaseCart(this.food)}}),computed:C()({},Object(w.c)(["vxfood"]))},k={render:function(){var s=this,t=s.$createElement,a=s._self._c||t;return a("div",{staticClass:"cartcontrol"},[a("transition",{attrs:{name:"fadeRotate"}},[a("div",{directives:[{name:"show",rawName:"v-show",value:s.food.num>0,expression:"food.num >0"}],staticClass:"cart-decrease",on:{click:function(t){s.decreaseCount()}}},[a("span",{staticClass:"icon-remove_circle_outline inner"})])]),s._v(" "),a("div",{directives:[{name:"show",rawName:"v-show",value:s.food.num>0,expression:"food.num >0"}],staticClass:"cart-count"},[s._v(s._s(s.food.num))]),s._v(" "),a("div",{staticClass:"cart-add",on:{click:function(t){s.addCount(t)}}},[a("i",{staticClass:"icon-add_circle"})])],1)},staticRenderFns:[]},y=a("VU/8")(g,k,!1,null,null,null).exports,x={props:["deliveryPrice","minPrice","shopfood"],data:function(){return{show:!1}},methods:{empty:function(){this.shopfood.forEach(function(s){s.num=0}),this.show=!1},showcart:function(){var s=this;this.show=!this.show,this.$nextTick(function(){new m.a(s.$refs.cartWrap,{click:!0})})}},computed:{totalPrice:function(){var s=0;return this.shopfood.forEach(function(t){s+=t.num*t.price}),s},totalCount:function(){var s=0;return this.shopfood.forEach(function(t){s+=t.num}),s},payDesc:function(){return 0===this.totalPrice?"还差"+this.minPrice+"元起送":this.totalPrice<this.minPrice?"还差"+(this.minPrice-this.totalPrice)+"元起送":"去结算"}},components:{purchaseNum:y}},b={render:function(){var s=this,t=s.$createElement,a=s._self._c||t;return a("div",{staticClass:"shopCart"},[a("div",{staticClass:"content",on:{click:s.showcart}},[a("div",{staticClass:"content-left"},[a("div",{staticClass:"logo-wrapper"},[s._m(0),s._v(" "),a("div",{directives:[{name:"show",rawName:"v-show",value:s.totalCount>0,expression:"totalCount > 0"}],staticClass:"badge"},[s._v(s._s(s.totalCount))])]),s._v(" "),a("div",{directives:[{name:"show",rawName:"v-show",value:s.totalPrice,expression:"totalPrice"}],staticClass:"price",class:{active:s.totalPrice}},[s._v("￥"+s._s(s.totalPrice))]),s._v(" "),a("div",{directives:[{name:"show",rawName:"v-show",value:s.totalPrice<99,expression:"totalPrice < 99"}],staticClass:"desc"},[s._v("另需要配送费"+s._s(s.deliveryPrice)+"元")])]),s._v(" "),a("div",{staticClass:"content-right",class:{enough:s.totalPrice>=s.minPrice}},[a("div",{staticClass:"pay"},[s._v(s._s(s.payDesc))])])]),s._v(" "),a("transition",{attrs:{name:"transHeight"}},[a("div",{directives:[{name:"show",rawName:"v-show",value:s.totalPrice>0&&s.show,expression:"totalPrice > 0 && show"}],staticClass:"shopcart-list"},[a("div",{staticClass:"list-header"},[a("h1",{staticClass:"title"},[s._v("购物车")]),s._v(" "),a("span",{staticClass:"empty",on:{click:function(t){s.empty()}}},[s._v("清空")])]),s._v(" "),a("div",{ref:"cartWrap",staticClass:"list-content"},[a("ul",s._l(s.shopfood,function(t){return a("li",{key:t.id,staticClass:"food"},[a("span",{staticClass:"name"},[s._v(s._s(t.name))]),s._v(" "),a("div",{staticClass:"price"},[a("span",[s._v("￥"+s._s(t.price))])]),s._v(" "),a("div",{staticClass:"cartcontrol-wrapper"},[a("purchaseNum",{attrs:{food:t}})],1)])}))])])])],1)},staticRenderFns:[function(){var s=this.$createElement,t=this._self._c||s;return t("div",{staticClass:"logo active"},[t("i",{staticClass:"icon-shopping_cart"})])}]},P={props:["foodInfo"],data:function(){return{foodetailshow:!1,classify:[{name:"全部",count:0,active:!0,comment:[]},{name:"推荐",count:0,active:!1,comment:[]},{name:"吐槽",count:0,active:!1,comment:[]}],flag:!0,comments:[]}},components:{cartcontrol:y},mounted:function(){var s=this;this.$nextTick(function(){new m.a(s.$refs.detailWrapper,{click:!0})})},computed:{commentShow:function(){var s=[];return this.flag?this.comments.forEach(function(t){t.text.length>0&&s.push(t)}):s=this.comments,s}},methods:{add:function(){this.$refs.cartWrapper.addCount()},foodshow:function(){var s=this;this.foodetailshow=!0,this.$nextTick(function(){s.foodInfo.ratings.forEach(function(t){s.classify[0].count++,t.rateType?s.classify[1].count++:s.classify[2].count++}),s.comments=s.foodInfo.ratings})},ratingChoose:function(s){var t=this;this.classify.forEach(function(s){s.active=!1}),s.active=!0,"全部"===s.name?(this.comments=[],this.comments=this.foodInfo.ratings):"推荐"===s.name?(this.comments=[],this.foodInfo.ratings.forEach(function(s){s.rateType&&t.comments.push(s)})):(this.comments=[],this.foodInfo.ratings.forEach(function(s){s.rateType||t.comments.push(s)}))}}},$={render:function(){var s=this,t=s.$createElement,a=s._self._c||t;return a("transition",{attrs:{name:"move"}},[a("div",{directives:[{name:"show",rawName:"v-show",value:s.foodetailshow,expression:"foodetailshow"}],ref:"detailWrapper",staticClass:"detailWrapper"},[a("div",{staticClass:"foodDetail"},[a("div",{staticClass:"back",on:{click:function(t){s.foodetailshow=!s.foodetailshow}}},[a("i",{staticClass:"icon-arrow_lift"})]),s._v(" "),a("img",{attrs:{src:s.foodInfo.image,width:"100%",height:"425",alt:""}}),s._v(" "),a("div",{staticClass:"info"},[a("div",{staticClass:"title"},[s._v(s._s(s.foodInfo.name))]),s._v(" "),a("div",{staticClass:"desc"},[a("span",[s._v("月售"+s._s(s.foodInfo.sellCount)+"份")]),s._v(" "),a("span",[s._v("好评率"+s._s(s.foodInfo.rating)+"%")])]),s._v(" "),a("div",{staticClass:"price"},[s._v("￥"+s._s(s.foodInfo.price))]),s._v(" "),a("div",{directives:[{name:"show",rawName:"v-show",value:0===s.foodInfo.num||void 0===s.foodInfo.num,expression:"foodInfo.num === 0 || foodInfo.num === undefined"}],staticClass:"shopCart",on:{click:function(t){s.add()}}},[a("div",{staticClass:"text"},[s._v("加入购物车")])]),s._v(" "),a("cartcontrol",{ref:"cartWrapper",attrs:{food:s.foodInfo}})],1),s._v(" "),a("div",{staticClass:"divider"}),s._v(" "),a("div",{staticClass:"desc"},[a("div",{staticClass:"title"},[s._v("商品介绍")]),s._v(" "),a("div",{staticClass:"content"},[s._v(s._s(s.foodInfo.info))])]),s._v(" "),a("div",{staticClass:"divider"}),s._v(" "),a("div",{staticClass:"evaluation"},[a("div",{staticClass:"title"},[s._v("商品评价")]),s._v(" "),a("div",{staticClass:"classify"},s._l(s.classify,function(t,i){return a("span",{key:t.id,staticClass:"item",class:{active:t.active,bad:2==i,badActive:2==i&&t.active},on:{click:function(a){s.ratingChoose(t)}}},[s._v(s._s(t.name)+"\n          "),a("span",{staticClass:"count"},[s._v(s._s(t.count))])])})),s._v(" "),a("div",{staticClass:"switch",on:{click:function(t){s.flag=!s.flag}}},[a("span",{staticClass:"icon-check_circle",class:{on:s.flag}}),s._v(" "),a("span",{staticClass:"text"},[s._v("只看有内容的评价")])]),s._v(" "),a("div",{staticClass:"evel-list"},[a("ul",s._l(s.commentShow,function(t){return a("li",{key:t.id,staticClass:"evel"},[a("div",{staticClass:"userInfo"},[a("div",{staticClass:"time"},[s._v(s._s(t.rateTime))]),s._v(" "),a("div",{staticClass:"user"},[a("span",[s._v(s._s(t.rateTime))]),s._v(" "),a("img",{attrs:{src:t.avatar,width:"12",height:"12",alt:""}})])]),s._v(" "),a("div",{staticClass:"content"},[a("span",{staticClass:"icon",class:t.rateType?"icon-thumb_down":"icon-thumb_up"}),s._v(" "),a("span",{staticClass:"text"},[s._v(s._s(t.text))])])])}))])])])])])},staticRenderFns:[]},E={props:["seller"],data:function(){return{icon:["decrease","discount","special","invoice","guarantee"],foodDetail:{},goods:[]}},mounted:function(){var s=this;d.a.get("/static/data.json").then(function(t){s.goods=t.data.goods}),this.$nextTick(function(){s.scroll()})},components:{shopCart:a("VU/8")(x,b,!1,null,null,null).exports,purchaseNum:y,foodDetail:a("VU/8")(P,$,!1,null,null,null).exports},computed:{buyfood:function(){var s=[];return this.goods.forEach(function(t){t.foods.forEach(function(t){t.num>0&&s.push(t)})}),s}},methods:{scroll:function(){new m.a(this.$refs.foodsWrapper,{click:!0}),new m.a(this.$refs.menuWrapper,{click:!0})},getFoodInfo:function(s){this.foodDetail=s,this.$refs.foodDesc.foodshow()}}},T={render:function(){var s=this,t=s.$createElement,a=s._self._c||t;return a("div",{staticClass:"goods"},[a("div",{ref:"menuWrapper",staticClass:"menu-wrapper"},[a("ul",s._l(s.goods,function(t){return a("li",{key:t.id,staticClass:"menu-item",on:{click:function(t){s.foods()}}},[a("span",{staticClass:"text"},[a("span",{directives:[{name:"show",rawName:"v-show",value:t.type>0,expression:"item.type>0"}],staticClass:"iconMap",class:s.icon[t.type]}),s._v("\n          "+s._s(t.name)+"\n        ")])])}))]),s._v(" "),a("div",{ref:"foodsWrapper",staticClass:"foods-wrapper"},[a("ul",s._l(s.goods,function(t){return a("li",{key:t.id,staticClass:"food-list food-list-hook"},[a("h1",{staticClass:"title"},[s._v(s._s(t.name))]),s._v(" "),a("ul",s._l(t.foods,function(t){return a("li",{key:t.id,staticClass:"food-item"},[a("div",{staticClass:"icon",on:{click:function(a){s.getFoodInfo(t)}}},[a("img",{attrs:{src:t.icon,width:"57",height:"57"}})]),s._v(" "),a("div",{staticClass:"content"},[a("h2",{staticClass:"name"},[s._v(s._s(t.name))]),s._v(" "),a("p",{staticClass:"description"},[s._v(s._s(t.description))]),s._v(" "),a("div",{staticClass:"sell-info"},[a("span",{staticClass:"sell-count"},[s._v("月售"+s._s(t.sellCount)+"份")]),s._v(" "),a("span",{staticClass:"rating"},[s._v("好评率"+s._s(t.rating))]),s._v(" "),a("div",{staticClass:"price"},[a("span",{staticClass:"newPrice"},[s._v("￥"+s._s(t.price))])]),s._v(" "),a("div",{staticClass:"cartcontrol-wrapper"},[a("purchaseNum",{attrs:{food:t}})],1)])])])}))])}))]),s._v(" "),a("shopCart",{attrs:{shopfood:s.buyfood,deliveryPrice:s.seller.deliveryPrice,minPrice:s.seller.minPrice}}),s._v(" "),a("foodDetail",{ref:"foodDesc",attrs:{foodInfo:s.foodDetail}})],1)},staticRenderFns:[]},I=a("VU/8")(E,T,!1,null,null,null).exports,W={props:["comments"],data:function(){return{classify:[{name:"全部",count:0,active:!0},{name:"推荐",count:0,active:!1},{name:"吐槽",count:0,active:!1}],remarks:[],flag:!0}},components:{star:c},filters:{time:function(s){return s||0}},computed:{commentShow:function(){var s=[];return this.flag?this.remarks.forEach(function(t){t.text.length>0&&s.push(t)}):s=this.remarks,s}},mounted:function(){},methods:{counts:function(){var s=this;this.$nextTick(function(){s.remarks=s.comments,s.comments.forEach(function(t){s.classify[0].count++,t.rateType?s.classify[2].count++:s.classify[1].count++})})},classifyclick:function(s){var t=this;this.classify.forEach(function(s){s.active=!1}),s.active=!0,"全部"===s.name?(this.remarks=[],this.remarks=this.comments):"推荐"===s.name?(this.remarks=[],this.comments.forEach(function(s){s.rateType||t.remarks.push(s)})):(this.remarks=[],this.comments.forEach(function(s){s.rateType&&t.remarks.push(s)}))}}},N={render:function(){var s=this,t=s.$createElement,a=s._self._c||t;return a("div",{ref:"evaluationWrapper",staticClass:"evaluation"},[a("div",{staticClass:"classify"},s._l(s.classify,function(t,i){return a("span",{key:t.id,staticClass:"item",class:{active:t.active,bad:2===i,badActive:2===i&&t.active},on:{click:function(a){s.classifyclick(t)}}},[s._v("\n            "+s._s(t.name)+"\n     "),a("span",{staticClass:"count"},[s._v(s._s(t.count))])])})),s._v(" "),a("div",{staticClass:"switch",on:{click:function(t){s.flag=!s.flag}}},[a("span",{staticClass:"icon-check_circle",class:{on:s.flag}}),s._v(" "),a("span",{staticClass:"text"},[s._v("只看有内容的评价")])]),s._v(" "),a("div",{staticClass:"evel-list"},[a("ul",s._l(s.commentShow,function(t){return a("li",{key:t.id,staticClass:"evel"},[a("div",{staticClass:"avatar"},[a("img",{attrs:{src:t.avatar,width:"28",height:"28"}})]),s._v(" "),a("div",{staticClass:"content"},[a("div",{staticClass:"user"},[a("span",{staticClass:"name"},[s._v(s._s(t.username))]),s._v(" "),a("span",{staticClass:"rateTime"},[s._v(s._s(t.rateTime))])]),s._v(" "),a("div",{staticClass:"star-wrapper"},[a("star",{attrs:{size:24,score:t.score}}),s._v(" "),a("span",{staticClass:"deliveryTime"},[s._v(s._s(s._f("time")(t.deliveryTime))+"分钟送达")])],1),s._v(" "),a("div",{staticClass:"text"},[s._v("\n            "+s._s(t.text)+"\n          ")]),s._v(" "),a("div",{staticClass:"recommend"},[a("span",{directives:[{name:"show",rawName:"v-show",value:t.recommend.length,expression:"item.recommend.length"}],staticClass:"icon icon-thumb_up"}),s._v(" "),s._l(t.recommend,function(t){return a("span",{key:t.id,staticClass:"dish"},[s._v(s._s(t))])})],2)])])}))])])},staticRenderFns:[]},D={props:["seller"],data:function(){return{ratings:[]}},mounted:function(){var s=this;d.a.get("/static/data.json").then(function(t){s.ratings=t.data.ratings,s.$refs.eval.counts()}),this.$nextTick(function(){new m.a(s.$refs.ratingsWrapper,{click:!0})})},components:{star:c,evaluation:a("VU/8")(W,N,!1,null,null,null).exports}},F={render:function(){var s=this,t=s.$createElement,a=s._self._c||t;return a("div",{ref:"ratingsWrapper",staticClass:"ratingsWrapper"},[a("div",{staticClass:"ratings-content"},[a("div",{staticClass:"info"},[a("div",{staticClass:"mark"},[a("div",{staticClass:"num"},[s._v(s._s(s.seller.score))]),s._v(" "),a("div",{staticClass:"text"},[s._v("综合评分")]),s._v(" "),a("div",{staticClass:"contrast"},[s._v("高于周边商家"+s._s(s.seller.rankRate)+"%")])]),s._v(" "),a("div",{staticClass:"stars"},[a("div",{staticClass:"serviceScore"},[a("span",{staticClass:"text"},[s._v("服务态度")]),s._v(" "),a("star",{attrs:{size:36,score:s.seller.serviceScore}}),s._v(" "),a("span",{staticClass:"num"},[s._v(s._s(s.seller.serviceScore))])],1),s._v(" "),a("div",{staticClass:"foodScore"},[a("span",{staticClass:"text"},[s._v("服务态度")]),s._v(" "),a("star",{attrs:{size:36,score:s.seller.foodScore}}),s._v(" "),a("span",{staticClass:"num"},[s._v(s._s(s.seller.foodScore))])],1),s._v(" "),a("div",{staticClass:"deliveryTime"},[a("span",{staticClass:"text"},[s._v("送达时间")]),s._v(" "),a("span",{staticClass:"time"},[s._v(s._s(s.seller.deliveryTime))])])])]),s._v(" "),a("div",{staticClass:"divider"}),s._v(" "),a("evaluation",{ref:"eval",attrs:{comments:s.ratings}})],1)])},staticRenderFns:[]},R=a("VU/8")(D,F,!1,null,null,null).exports,S={props:["seller"],data:function(){return{collectflag:!1,iconClassMap:["decrease","discount","special","invoice","guarantee"]}},components:{star:c},mounted:function(){var s=this;this.$nextTick(function(){new m.a(s.$refs.sellerWrapper,{click:!0}),new m.a(s.$refs.picList,{startX:0,click:!0,scrollX:!0,scrollY:!1,eventPassthrough:"vertical"})})}},U={render:function(){var s=this,t=s.$createElement,a=s._self._c||t;return a("div",{ref:"sellerWrapper",staticClass:"seller-wrapper"},[a("div",{staticClass:"seller-content"},[a("div",{staticClass:"info"},[a("div",{staticClass:"title"},[a("div",{staticClass:"text"},[s._v(s._s(s.seller.name))]),s._v(" "),a("div",{staticClass:"star-wrapper"},[a("star",{attrs:{size:36,score:s.seller.score}}),s._v(" "),a("span",{staticClass:"rate-count"},[s._v("("+s._s(s.seller.ratingCount)+")")]),s._v(" "),a("span",{staticClass:"sell-count"},[s._v("月售"+s._s(s.seller.sellCount)+"单")])],1),s._v(" "),a("div",{staticClass:"collect",on:{click:function(t){t.stopPropagation(),t.preventDefault(),s.collectflag=!s.collectflag}}},[a("span",{staticClass:"icon-favorite",class:{active:s.collectflag}}),s._v(" "),a("span",{staticClass:"text"},[s._v(s._s(s.collectflag?"已收藏":"收藏"))])])]),s._v(" "),a("div",{staticClass:"remark"},[a("div",{staticClass:"block"},[a("h2",[s._v("起送价")]),s._v(" "),a("div",{staticClass:"content"},[a("span",{staticClass:"num"},[s._v(s._s(s.seller.minPrice))]),s._v("元\n          ")])]),s._v(" "),a("div",{staticClass:"block"},[a("h2",[s._v("商家配送")]),s._v(" "),a("div",{staticClass:"content"},[a("span",{staticClass:"num"},[s._v(s._s(s.seller.deliveryPrice))]),s._v("元\n          ")])]),s._v(" "),a("div",{staticClass:"block"},[a("h2",[s._v("平均配送时间")]),s._v(" "),a("div",{staticClass:"content"},[a("span",{staticClass:"num"},[s._v(s._s(s.seller.deliveryTime))]),s._v("分钟\n          ")])])])]),s._v(" "),a("div",{staticClass:"divider"}),s._v(" "),a("div",{staticClass:"activities"},[a("div",{staticClass:"bulletin"},[a("h1",[s._v("公告与活动")]),s._v(" "),a("div",{staticClass:"content"},[s._v("\n          "+s._s(s.seller.bulletin)+"\n        ")])])]),s._v(" "),a("div",{staticClass:"supports"},[a("ul",s._l(s.seller.supports,function(t){return a("li",{key:t.id,staticClass:"item"},[a("span",{staticClass:"iconMap",class:s.iconClassMap[t.type]}),s._v(" "),a("span",{staticClass:"text"},[s._v(s._s(t.description))])])}))]),s._v(" "),a("div",{staticClass:"divider"}),s._v(" "),a("div",{ref:"picList",staticClass:"seller-imgs"},[a("h1",[s._v("商家实景")]),s._v(" "),a("div",{staticClass:"img-wrapper"},s._l(s.seller.pics,function(s){return a("img",{key:s.id,attrs:{src:s,width:"120",height:"90"}})}))]),s._v(" "),a("div",{staticClass:"divider"}),s._v(" "),a("div",{staticClass:"seller-info"},[a("h1",[s._v("商家信息")]),s._v(" "),a("ul",{staticClass:"info-list"},s._l(s.seller.infos,function(t){return a("li",{key:t.id,staticClass:"info"},[s._v(s._s(t))])}))])])])},staticRenderFns:[]},V=a("VU/8")(S,U,!1,null,null,null).exports;i.a.use(p.a);var M=new p.a({routes:[{path:"/goods",component:I},{path:"/ratings",component:R},{path:"/seller",component:V},{path:"/",redirect:"/goods"},{path:"/*",redirect:"/"}]});i.a.use(w.a);var j=new w.a.Store({state:{vxfood:[]},mutations:{vxaddCart:function(s,t){s.vxfood.push(t)},vxdecreaseCart:function(s,t){s.vxfood.forEach(function(a,i){a.name===t.name&&s.vxfood.splice(i,1)})}}});i.a.config.productionTip=!1,new i.a({el:"#app",router:M,store:j,components:{App:_},template:"<App/>"})},yrZL:function(s,t){}},["NHnr"]);
//# sourceMappingURL=app.6b93370cfd67f78d1791.js.map