<template>
  <v-content class="white">
    <RequestSpinner type="deleteUser" />
    <RequestSpinner type="setPrivacy" />
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

      <v-list-tile @click="dialog.seen = true">
        <v-list-tile-content>
          <v-list-tile-title>
            Last seen
          </v-list-tile-title>

          <v-list-tile-sub-title>
            {{ seenScope | formatScope }}
          </v-list-tile-sub-title>
        </v-list-tile-content>
      </v-list-tile>

      <v-divider />

      <v-list-tile @click="dialog.read = true">
        <v-list-tile-content>
          <v-list-tile-title>
            Receive read notifications
          </v-list-tile-title>

          <v-list-tile-sub-title>
            {{ readScope | formatScope }}
          </v-list-tile-sub-title>
        </v-list-tile-content>
      </v-list-tile>


      <v-subheader>Account</v-subheader>

      <v-list-tile @click="dialog.delete = true">
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

    <!-- Privacy Modal: seen scope -->
    <v-dialog v-model="dialog.seen" scrollable>
      <v-card>
        <v-card-title class="headline">Last seen</v-card-title>
        <v-card-text>
          <v-radio-group v-model="seenScope">
            <v-list one-line>
              <v-list-tile>
                <v-list-tile-content>
                  <v-radio label="Nobody" :value="scopes.NOBODY" />
                </v-list-tile-content>
              </v-list-tile>
              <v-list-tile>
                <v-list-tile-content>
                  <v-radio label="My contacts" :value="scopes.CONTACTS" />
                </v-list-tile-content>
              </v-list-tile>
              <v-list-tile>
                <v-list-tile-content>
                  <v-radio label="Everyone" :value="scopes.EVERYONE" />
                </v-list-tile-content>
              </v-list-tile>
            </v-list>
          </v-radio-group>
        </v-card-text>
        <v-card-actions>
          <v-spacer />
          <v-btn flat @click="dialog.seen = false">Cancel</v-btn>
          <v-btn color="primary" flat @click="setPrivacy">OK</v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>

    <!-- Privacy Modal: read scope -->
    <v-dialog v-model="dialog.read" scrollable>
      <v-card>
        <v-card-title class="headline">Receive read notifications</v-card-title>
        <v-card-text>
          <v-radio-group v-model="readScope">
            <v-list one-line>
              <v-list-tile>
                <v-list-tile-content>
                  <v-radio label="Nobody" :value="scopes.NOBODY" />
                </v-list-tile-content>
              </v-list-tile>
              <v-list-tile>
                <v-list-tile-content>
                  <v-radio label="My contacts" :value="scopes.CONTACTS" />
                </v-list-tile-content>
              </v-list-tile>
            </v-list>
          </v-radio-group>
        </v-card-text>
        <v-card-actions>
          <v-spacer />
          <v-btn flat @click="dialog.read = false">Cancel</v-btn>
          <v-btn color="primary" flat @click="setPrivacy">OK</v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>

    <!-- Delete Modal -->
    <v-dialog v-model="dialog.delete" scrollable>
      <v-card>
        <v-card-title class="headline">Delete account?</v-card-title>
        <v-card-text>
          <p>Are you sure you want to delete your account? This will remove all data from your device and from our servers permanently!</p>
          <p><strong>This operation cannot be undone</strong></p>
        </v-card-text>
        <v-card-actions>
          <v-spacer />
          <v-btn flat @click="dialog.delete = false">Cancel</v-btn>
          <v-btn color="red darken-1" flat @click="deleteUser">Delete my account</v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>
  </v-content>
</template>


<script>
  import { mapGetters } from 'vuex'

  import RequestSpinner from 'components/RequestSpinner'
  import Alert from 'components/Alert'

  import { scopes } from 'modules/settings/state'

  export default {
    data: () => ({
      dialog: {
        delete: false,
        seen: false,
        read: false,
      },
      scopes,

      seenScope: scopes.EVERYONE,
      readScope: scopes.CONTACTS,

      errors: null,
    }),
    computed: {
      ...mapGetters({
        getSeenScope: 'settings/getSeenScope',
        getReadScope: 'settings/getReadScope',
      })
    },
    methods: {
      deleteUser() {
        this.dialog = false

        this.$store.dispatch('auth/deleteUser')
          .then(() => { this.$router.push({ name: 'welcome' }) })
          .catch((e) => { this.errors = e })
      },
      signout() {
        this.$store.dispatch('auth/signout')
          .then(() => { this.$router.push({ name: 'welcome' }) })
          .catch((e) => { this.errors = e })
      },
      setPrivacy() {
        this.$store.dispatch('settings/setPrivacy', { seenScope: this.seenScope, readScope: this.readScope })
          .then(() => {
            this.dialog.seen = false
            this.dialog.read = false
          })
          .catch((e) => { this.errors = e })
      },
    },
    mounted: function() {
      this.seenScope = this.getSeenScope;
      this.readScope = this.getReadScope;
    },
    components: {
      RequestSpinner,
      Alert,
    },
    filters: {
      formatScope: function (value) {
        switch (value) {
          case scopes.NOBODY:
            return 'Nobody'
          case scopes.CONTACTS:
            return 'My contacts'
          case scopes.EVERYONE:
            return 'Everyone'
          default:
            return ''
        }
      }
    },
  }
</script>
