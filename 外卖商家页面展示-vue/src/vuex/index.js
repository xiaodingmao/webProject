import Vue from 'vue'
import Vuex from 'vuex'
Vue.use(Vuex)
/* eslint-disable */
import state from './state'
import mutations from './mutations'
export default new Vuex.Store({
  state,
  mutations
})
