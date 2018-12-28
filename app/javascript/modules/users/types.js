export const actions = {
  complete: 'users/COMPLETE',
  destroy: 'users/DESTROY',
  get: 'users/GET',
  update: 'users/UPDATE',
}

export const getters = {
  get: 'users/GET',
  getAll: 'users/GET_ALL',
  getCurrent: 'users/GET_CURRENT',
}

export const mutations = {
  set: 'users/SET',
}

export default {
  actions,
  getters,
  mutations,
}
