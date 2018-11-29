<template>
  <div>
    <h2>Initial</h2>

    <input type="button" value="click!" @click="signup" />
  </div>
</template>

<script>
  import { mapGetters } from 'vuex'

  export default {
    computed: {
      ...mapGetters([
        'isAuthenticated',
        'isComplete',
      ]),
    },
    methods: {
      signup: () => {
        this.$store.dispatch('SIGNUP')
      },
    },
  }
</script>
