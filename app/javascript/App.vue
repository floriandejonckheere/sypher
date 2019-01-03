<template>
  <div id="app">
    <v-app app>
      <Alerts />
      <Requests />

      <router-view />
    </v-app>
  </div>
</template>

<script>
  import Alerts from 'components/Alerts'
  import Requests from 'components/Requests'

  export default {
    components: {
      Alerts,
      Requests,
    },
  }
</script>
