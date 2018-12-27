<template>
  <v-content class="white">
    <v-toolbar dark color="primary">
      <router-link to="/">
        <v-btn icon>
          <v-icon>arrow_back</v-icon>
        </v-btn>
      </router-link>

      <v-toolbar-title>
        Settings
      </v-toolbar-title>
      <v-spacer />
    </v-toolbar>

    <v-list two-line>
      <v-list-tile avatar to="/settings/profile">
        <v-list-tile-avatar>
          <img src="https://cdn.vuetifyjs.com/images/lists/3.jpg" />
        </v-list-tile-avatar>

        <v-list-tile-content>
          <v-list-tile-title class="title">
            {{ user.name }}
          </v-list-tile-title>
          <v-list-tile-sub-title>
            {{ user.phone }}
          </v-list-tile-sub-title>
        </v-list-tile-content>
      </v-list-tile>
    </v-list>

    <v-divider />

    <v-list one-line>
      <v-list-tile avatar to="/settings/account">
        <v-list-tile-action>
          <v-icon color="primary">vpn_key</v-icon>
        </v-list-tile-action>

        <v-list-tile-content>
          <v-list-tile-title>
            Account
          </v-list-tile-title>
        </v-list-tile-content>
      </v-list-tile>

      <v-divider inset />

      <v-list-tile avatar to="/settings/notifications">
        <v-list-tile-action>
          <v-icon color="primary">notifications</v-icon>
        </v-list-tile-action>

        <v-list-tile-content>
          <v-list-tile-title>
            Notifications
          </v-list-tile-title>
        </v-list-tile-content>
      </v-list-tile>

      <v-divider inset />

      <v-list-tile avatar to="/settings/data">
        <v-list-tile-action>
          <v-icon color="primary">data_usage</v-icon>
        </v-list-tile-action>

        <v-list-tile-content>
          <v-list-tile-title>
            Data and storage usage
          </v-list-tile-title>
        </v-list-tile-content>
      </v-list-tile>
    </v-list>
  </v-content>
</template>

<script>
  import { mapGetters } from 'vuex'

  import users from 'modules/users'

  export default {
    computed: {
      ...mapGetters({
        user: users.types.getters.getCurrent,
      }),
    },
  }
</script>
