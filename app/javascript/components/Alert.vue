<template>
  <div class="alert">
    <v-alert
            :value="error"
            type="error"
            transition="slide-y-transition"
    >
      {{ error }}
    </v-alert>
  </div>
</template>

<script>
  export default {
    props: {
      error: { type: String, default: null },
    },
  }
</script>
