export default {
  vxaddCart (state, val) {
    state.vxfood.push(val)
  },
  vxdecreaseCart (state, val) {
    state.vxfood.forEach((value, index) => {
      if (value.name === val.name) {
        state.vxfood.splice(index, 1)
      }
    })
  }
}
