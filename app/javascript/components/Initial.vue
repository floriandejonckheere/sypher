<template>
  <div>
    <h2>Initial</h2>

    <p>Current state is <strong v-text="getCurrentState"></strong></p>

    <input type="button" value="signup" @click="signup" />
  </div>
</template>

<script>
  import { mapGetters } from 'vuex'

  import router from '../store/modules/router'

  import { transitions } from '../fsm/routerMachine'

  export default {
    computed: {
      ...mapGetters('auth', ['isAuthenticated']),
      ...mapGetters([
        'isComplete',
        'getCurrentState',
      ]),
    },
    methods: {
      signup: function () {
        this.$store.dispatch(router.actionTypes.TRANSITION, {type: transitions.SIGNUP})
      },
    },
  }
</script>
