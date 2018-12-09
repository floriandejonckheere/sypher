<template>
  <div class="alert">
    <div v-for="error in errors">
      <v-alert
              :value="error"
              type="error"
              transition="slide-y-transition"
      >
        {{ error }}
      </v-alert>
    </div>
  </div>
</template>

<script>
  export default {
    props: {
      errors: { type: Array, default: () => [] },
    },
  }
</script>
