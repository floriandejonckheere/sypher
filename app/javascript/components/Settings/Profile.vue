<template>
  <v-content class="white">
    <RequestSpinner :type="requestTypes" />
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

    <v-img :aspect-ratio="16/9" src="https://cdn.vuetifyjs.com/images/cards/desert.jpg">
      <v-layout pa-2 column fill-height class="lightbox white--text">
        <v-spacer></v-spacer>
        <v-flex shrink>
          <div class="title py-1">{{ user.name }}</div>
          <div class="subheading py-1">{{ user.phone }}</div>
        </v-flex>
      </v-layout>
    </v-img>

    <v-list one-line>
      <v-list-tile @click="">
        <v-list-tile-content>
          <v-list-tile-title>
            Change profile picture
          </v-list-tile-title>
        </v-list-tile-content>
      </v-list-tile>

      <v-divider />

      <v-list-tile @click="dialog.name = true">
        <v-list-tile-content>
          <v-list-tile-title>
            Change name
          </v-list-tile-title>
        </v-list-tile-content>
      </v-list-tile>
    </v-list>

    <!-- Change name Modal -->
    <v-dialog v-model="dialog.name" scrollable>
      <v-card>
        <v-card-title class="headline">Change name</v-card-title>
        <v-card-text>
          <v-form ref="form" v-model="valid" @submit="update">
            <v-text-field
                    autofocus
                    name="name"
                    v-model="name"
                    required
                    placeholder="Your name"
                    counter="20"
                    :rules="nameRules"
            />
          </v-form>
        </v-card-text>
        <v-card-actions>
          <v-spacer />
          <v-btn flat @click="dialog.name = false">Cancel</v-btn>
          <v-btn color="primary darken-1" flat @click="update">Update</v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>
  </v-content>
</template>

<script>
  import { mapGetters } from 'vuex'

  import RequestSpinner from 'components/RequestSpinner'
  import Alert from 'components/Alert'

  import users from 'modules/users'

  export default {
    data: () => ({
      dialog: {
        name: false,
      },

      valid: false,
      name: '',
      nameRules: [
        v => !!v || 'Name is required',
        v => /^.{1,20}/.test(v) || 'Name must be between 1 and 20 characters',
      ],

      errors: null,

      requestTypes: [
        users.types.actions.update,
      ]
    }),
    computed: {
      ...mapGetters({
        user: users.types.getters.getCurrent,
      }),
    },
    methods: {
      update(e) {
        e.preventDefault()

        if (this.$refs.form.validate()) {
          this.dialog.name = false

          this.$store.dispatch(users.types.actions.update, { name: this.name })
            .catch((e) => { this.errors = e })
        }
      },
    },
    mounted: function() {
      this.name = this.user.name
    },
    components: {
      RequestSpinner,
      Alert,
    },
  }
</script>
