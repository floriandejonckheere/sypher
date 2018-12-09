<template>
  <v-content class="white">
    <RequestSpinner type="deleteUser" />
    <Alert :errors="errors" />

    <v-toolbar dark color="primary">
      <router-link to="/settings">
        <v-btn icon>
          <v-icon>arrow_back</v-icon>
        </v-btn>
      </router-link>

      <v-toolbar-title>
        Account
      </v-toolbar-title>
      <v-spacer />
    </v-toolbar>

    <v-list two-line>
      <v-subheader>Privacy</v-subheader>

      <v-list-tile to="#">
        <v-list-tile-content>
          <v-list-tile-title>
            Last seen
          </v-list-tile-title>

          <v-list-tile-sub-title>
            My contacts
          </v-list-tile-sub-title>
        </v-list-tile-content>
      </v-list-tile>

      <v-divider />

      <v-list-tile to="#">
        <v-list-tile-content>
          <v-list-tile-title>
            Receive read notifications
          </v-list-tile-title>

          <v-list-tile-sub-title>
            My contacts
          </v-list-tile-sub-title>
        </v-list-tile-content>
      </v-list-tile>

      <v-divider />

      <v-list-tile to="#">
        <v-list-tile-content>
          <v-list-tile-title>
            My profile
          </v-list-tile-title>

          <v-list-tile-sub-title>
            Everyone
          </v-list-tile-sub-title>
        </v-list-tile-content>
      </v-list-tile>

      <v-subheader>Account</v-subheader>

      <v-list-tile @click="dialog = true">
        <v-list-tile-content>
          <v-list-tile-title>
            Delete my account
          </v-list-tile-title>
        </v-list-tile-content>
      </v-list-tile>

      <v-divider />

      <v-list-tile @click="signout">
        <v-list-tile-content>
          <v-list-tile-title>
            Sign out
          </v-list-tile-title>
        </v-list-tile-content>
      </v-list-tile>
    </v-list>

    <!-- Delete Modal -->
    <v-dialog v-model="dialog" scrollable>
      <v-card>
        <v-card-title class="headline">Delete account?</v-card-title>
        <v-card-text>
          <p>Are you sure you want to delete your account? This will remove all data from your device and from our servers permanently!</p>
          <p><strong>This operation cannot be undone</strong></p>
        </v-card-text>
        <v-card-actions>
          <v-spacer />
          <v-btn flat @click="dialog = false">Cancel</v-btn>
          <v-btn color="red darken-1" flat @click="deleteUser">Delete my account</v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>
  </v-content>
</template>


<script>
  import RequestSpinner from 'components/RequestSpinner'
  import Alert from 'components/Alert'

  export default {
    data: () => ({
      dialog: false,
      errors: null,
    }),
    methods: {
      deleteUser () {
        this.dialog = false

        this.$store.dispatch('auth/deleteUser')
          .then(() => { this.$router.push({ name: 'welcome' }) })
          .catch((e) => { this.errors = e })
      },
      signout () {
        this.$store.dispatch('auth/signout')
          .then(() => { this.$router.push({ name: 'welcome' }) })
          .catch((e) => { this.errors = e })
      },
    },
    components: {
      RequestSpinner,
      Alert,
    },
  }
</script>
