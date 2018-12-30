<template>
  <v-content class="white">
    <RequestSpinner :types="requestTypes" />

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

      <v-list-tile @click="dialog.signout = true">
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
        <v-card-title class="headline">Delete account</v-card-title>
        <v-card-text>
          <p>Are you sure you want to delete your account? This will remove all data from your device and from our servers permanently!</p>
          <p><strong>You will lose all your messages, media and contacts irreversibly</strong></p>
        </v-card-text>
        <v-card-actions>
          <v-spacer />
          <v-btn flat @click="dialog.delete = false">Cancel</v-btn>
          <v-btn color="red darken-1" flat @click="destroy">Delete my account</v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>

    <!-- Signout Modal -->
    <v-dialog v-model="dialog.signout" scrollable>
      <v-card>
        <v-card-title class="headline">Sign out</v-card-title>
        <v-card-text>
          <p>Are you sure you want to sign out? This will remove all data from your device permanently! Your contacts and other settings are still stored on our servers.</p>
          <p><strong>You will lose all your messages and media irreversibly</strong></p>
        </v-card-text>
        <v-card-actions>
          <v-spacer />
          <v-btn flat @click="dialog.signout = false">Cancel</v-btn>
          <v-btn color="red darken-1" flat @click="signout">Sign out</v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>
  </v-content>
</template>


<script>
  import { mapGetters } from 'vuex'

  import RequestSpinner from 'components/RequestSpinner'

  import alerts from 'modules/alerts'
  import auth from 'modules/auth'
  import users from 'modules/users'
  import settings from 'modules/settings'

  import { types } from 'modules/alerts/state'
  import { scopes } from 'modules/settings/state'

  export default {
    data: () => ({
      dialog: {
        delete: false,
        signout: false,
        seen: false,
        read: false,
      },
      scopes,

      seenScope: null,
      readScope: null,

      requestTypes: [
        users.types.actions.destroy,
        settings.types.actions.setPrivacy,
      ],
    }),
    computed: {
      ...mapGetters({
        getSeenScope: settings.types.getters.getSeenScope,
        getReadScope: settings.types.getters.getReadScope,
      }),
    },
    methods: {
      destroy() {
        this.dialog.delete = false

        this.$store.dispatch(users.types.actions.destroy)
          .then(() => {
            this.$store.dispatch(alerts.types.actions.add, { type: types.SUCCESS, message: 'Account deleted' })
            this.$router.push({ name: 'welcome' })
          })
      },
      signout() {
        this.$store.dispatch(auth.types.actions.signout)
          .then(() => {
            this.$store.dispatch(alerts.types.actions.add, { type: types.SUCCESS, message: 'Signed out' })
            this.$router.push({ name: 'welcome' })
          })
      },
      setPrivacy() {
        this.$store.dispatch(settings.types.actions.setPrivacy,
          { seenScope: this.seenScope, readScope: this.readScope })
          .then(() => {
            this.dialog.seen = false
            this.dialog.read = false
          })
      },
    },
    mounted: function() {
      this.seenScope = this.getSeenScope;
      this.readScope = this.getReadScope;
    },
    components: {
      RequestSpinner,
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
