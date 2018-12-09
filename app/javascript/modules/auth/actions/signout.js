export default async ({ commit }) => {
  commit('setUser', { user: { name: null, phone: null } })
  commit('setToken', { token: null })
}
