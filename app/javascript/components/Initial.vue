<template>
  <div>
    <h2>Initial</h2>

    <input type="button" value="signup" @click="signup" />
    <input type="button" value="signin" @click="signin" />
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
