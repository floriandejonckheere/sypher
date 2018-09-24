<template>
  <v-content>
    <v-toolbar dark color="primary">
      <router-link to="/channels">
        <v-btn icon>
          <v-icon>arrow_back</v-icon>
        </v-btn>
      </router-link>

      <v-toolbar-title>
        New conversation
        <div class="caption">Select contact</div>
      </v-toolbar-title>

      <v-spacer />

      <v-btn icon>
        <v-icon>add</v-icon>
      </v-btn>
    </v-toolbar>

    <v-list one-line>
      <template v-for="(user, index) in users">
        <v-list-tile avatar :to="`/channels/${user.id}`">
          <v-list-tile-avatar>
            <img :src="`https://cdn.vuetifyjs.com/images/lists/${index + 1}.jpg`" />
          </v-list-tile-avatar>

          <v-list-tile-content>
            <v-list-tile-title>
              <strong>{{ user.name }}</strong>
            </v-list-tile-title>
          </v-list-tile-content>
        </v-list-tile>
      </template>
    </v-list>
  </v-content>
</template>

<script>
  import { mapGetters } from 'vuex'

  export default {
    computed: {
      ...mapGetters({
        users: 'users/getAllUsersAlphabetically',
      })
    }
  }
</script>
