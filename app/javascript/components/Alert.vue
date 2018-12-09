<template>
  <div class="alert">
    <div v-for="error in errors">
      <v-alert
              type="error"
              value="true"
              transition="slide-y-transition"
              dismissible
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
