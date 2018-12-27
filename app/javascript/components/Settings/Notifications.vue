<template>
  <v-content class="white">
    <v-toolbar dark color="primary">
      <router-link to="/settings">
        <v-btn icon>
          <v-icon>arrow_back</v-icon>
        </v-btn>
      </router-link>

      <v-toolbar-title>
        Notifications
      </v-toolbar-title>
      <v-spacer />
    </v-toolbar>

    <v-list two-line>
      <v-list-tile @click="">
        <v-list-tile-action>
          <v-checkbox v-model="notifications" />
        </v-list-tile-action>

        <v-list-tile-content @click="toggleNotifications">
          <v-list-tile-title>
            Message notifications
          </v-list-tile-title>

          <v-list-tile-sub-title>
            Receive notifications for new messages
          </v-list-tile-sub-title>
        </v-list-tile-content>
      </v-list-tile>

      <v-divider />

      <v-list-tile @click="">
        <v-list-tile-action>
          <v-checkbox v-model="vibrate" />
        </v-list-tile-action>

        <v-list-tile-content @click="toggleVibrate">
          <v-list-tile-title>
            Vibrate
          </v-list-tile-title>

          <v-list-tile-sub-title>
            Vibrate short on new messages
          </v-list-tile-sub-title>
        </v-list-tile-content>
      </v-list-tile>
    </v-list>
  </v-content>
</template>

<script>
  import { mapGetters } from 'vuex'

  import settings from 'modules/settings'

  export default {
    data () {
      return {
        notifications: false,
        vibrate: false,
      }
    },
    computed: {
      ...mapGetters({
        getNotifications: settings.types.getters.getNotifications,
        getVibrate: settings.types.getters.getVibrate,
      })
    },
    methods: {
      toggleNotifications() {
        this.notifications = !this.notifications

        this.$store.dispatch(settings.types.actions.setNotifications, { notifications: this.notifications, vibrate: this.vibrate })
      },
      toggleVibrate() {
        this.vibrate = !this.vibrate

        this.$store.dispatch(settings.types.actions.setNotifications, { notifications: this.notifications, vibrate: this.vibrate })
      },
    },
    mounted: function() {
      this.notifications = this.getNotifications;
      this.vibrate = this.getVibrate;
    },
  }
</script>
