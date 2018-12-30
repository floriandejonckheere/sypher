<template>
  <div>
    <div v-for="(alert, index) in alerts">
      <div class="alert">
        <v-alert
                :type="alert.type"
                value="true"
                transition="slide-y-transition"
                dismissible
        >
          {{ alert.message }}
        </v-alert>
      </div>
    </div>
  </div>
</template>

<script>
  import { mapGetters } from 'vuex'

  import alerts from 'modules/alerts'

  export default {
    computed: {
      ...mapGetters({
        alerts: alerts.types.getters.getAll,
      }),
    },
  }
</script>
