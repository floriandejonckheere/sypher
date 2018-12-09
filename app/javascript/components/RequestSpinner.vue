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
    data: function () {
      return {}
    },
    props: {
      type: { type: String, default: '' },
    },
    computed: {
      isPending() {
        return this.$store.getters['requests/isPending'](this.type)
      }
    }
  }
</script>
