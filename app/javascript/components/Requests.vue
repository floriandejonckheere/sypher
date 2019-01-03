<template>
  <div>
  <v-dialog v-model="isAnyPending" persistent content-class="requests">
    <v-container>
        <v-progress-circular indeterminate :size="70" :width="7" color="white" />
    </v-container>
  </v-dialog>
  </div>
</template>

<script>
  import { mapGetters } from 'vuex'

  import requests from 'modules/requests'

  export default {
    computed: {
      ...mapGetters({
        isAnyPending: requests.types.getters.isAnyPending,
      })
    },
  }
</script>
