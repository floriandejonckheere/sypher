export const actions = {
  signout: 'auth/SIGNOUT',
  verifyPhone: 'auth/VERIFY_PHONE',
  verifyPin: 'auth/VERIFY_PIN',
}

export const getters = {
  getCurrentPhone: 'auth/GET_CURRENT_PHONE',
  getToken: 'auth/GET_TOKEN',
  isAuthenticated: 'auth/IS_AUTHENTICATED',
  isComplete: 'auth/IS_COMPLETE',
}

export const mutations = {
  setCurrentPhone: 'auth/SET_CURRENT_PHONE',
  setToken: 'auth/SET_TOKEN',
}

export default {
  actions,
  getters,
  mutations,
}
