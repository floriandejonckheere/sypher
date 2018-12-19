<template>
  <v-layout row justify-center>
    <v-dialog v-model="isPending" persistent content content-class="request-spinner">
      <v-container fill-height>
        <v-layout column justify-center align-center>
          <v-progress-circular indeterminate :size="70" :width="7" color="white" />
        </v-layout>
      </v-container>
    </v-dialog>
  </v-layout>
</template>

<script>
  export default {
    // data: function () {
    //   return {}
    // },
    props: {
      types: { type: Array, default: () => [] },
    },
    computed: {
      isPending() {
        // Return false if no requests are pending
        return this.types
          .map(t => this.$store.getters['requests/isPending'](t))
          .reduce((acc, curr) => acc || curr, false)
      }
    }
  }
</script>
