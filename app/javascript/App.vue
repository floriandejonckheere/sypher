<template>
  <div id="app">
    <v-app app>
      <Alerts />

      <router-view />
    </v-app>
  </div>
</template>

<script>
  import Alerts from 'components/Alerts'

  export default {
    components: {
      Alerts,
    },
  }
</script>
