<template>
  <div>
    <h2>Initial</h2>

    <p>Current state is <strong v-text="getCurrentState"></strong></p>

    <input type="button" value="signup" @click="signup" /> <br />
    <input type="button" value="signin" @click="signin" /> <br />
    <input type="button" value="complete" @click="complete" />
  </div>
</template>

<script>
  import { mapGetters } from 'vuex'

  import router from '../store/modules/router'

  import { transitions } from '../fsm/routerMachine'

  export default {
    computed: {
      ...mapGetters([
        'isAuthenticated',
        'isComplete',
        'getCurrentState',
      ]),
    },
    methods: {
      signup: function () {
        this.$store.dispatch(router.actionTypes.TRANSITION, { type: transitions.SIGNUP })
      },
      signin: function () {
        this.$store.dispatch(router.actionTypes.TRANSITION, { type: transitions.SIGNIN })
      },
      complete: function () {
        this.$store.dispatch(router.actionTypes.TRANSITION, { type: transitions.COMPLETE })
      },
    },
  }
</script>
