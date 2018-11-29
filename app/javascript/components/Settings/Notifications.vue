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

        <v-list-tile-content @click="notifications = !notifications">
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

        <v-list-tile-content @click="vibrate = !vibrate">
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
  export default {
    data () {
      return {
        notifications: false,
        vibrate: false,
      }
    },
  }
</script>
