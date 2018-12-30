<template>
  <v-content class="white">
    <RequestSpinner :type="requestTypes" />
    <Alert :errors="errors" />

    <v-toolbar dark color="primary">
      <router-link to="/contacts">
        <v-btn icon>
          <v-icon>arrow_back</v-icon>
        </v-btn>
      </router-link>

      <v-toolbar-title>
        {{ user.name }}
      </v-toolbar-title>
      <v-spacer />

      <v-btn icon @click="this.delete">
        <v-icon>delete</v-icon>
      </v-btn>
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

    <v-list two-line>
      <v-list-tile>
        <v-list-tile-content>
          <v-list-tile-title>
            {{ user.name }}
          </v-list-tile-title>
          <v-list-tile-sub-title>
            Name
          </v-list-tile-sub-title>
        </v-list-tile-content>
      </v-list-tile>

      <v-divider />

      <v-list-tile>
        <v-list-tile-content>
          <v-list-tile-title>
            {{ user.phone}}
          </v-list-tile-title>
          <v-list-tile-sub-title>
            Phone number
          </v-list-tile-sub-title>
        </v-list-tile-content>
      </v-list-tile>
    </v-list>
  </v-content>
</template>

<script>
  import { mapGetters } from 'vuex'

  import RequestSpinner from 'components/RequestSpinner'
  import Alert from 'components/Alert'

  import users from 'modules/users'
  import contacts from 'modules/contacts'

  export default {
    data: () => ({
      errors: [],

      requestTypes: [
        contacts.types.actions.delete,
      ]
    }),
    computed: {
      ...mapGetters({
        get: users.types.getters.get,
      }),
      user() {
        return this.get(this.$route.params.phone)
      },
    },
    methods: {
      delete() {
        this.$store.dispatch(contacts.types.actions.delete, { phone: this.user.phone })
          .then(() => { this.$router.push({ name: 'contacts' }) })
          .catch(e => { this.errors.push(e) })
      },
    },
    components: {
      RequestSpinner,
      Alert,
    },
  }
</script>
