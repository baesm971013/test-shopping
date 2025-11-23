import { createStore } from 'vuex'

export default createStore({
  state: {
    user: null,
    products: []
  },
  mutations: {
    SET_USER(state, user) {
      state.user = user
    },
    SET_PRODUCTS(state, products) {
      state.products = products
    }
  },
  actions: {
    setUser({ commit }, user) {
      commit('SET_USER', user)
    },
    setProducts({ commit }, products) {
      commit('SET_PRODUCTS', products)
    }
  }
})