export default async ({ commit }) => {
  commit('setCurrentPhone', { phone: null })
  commit('setToken', { token: null })
}
