<template>
  <v-content class="white">
    <v-toolbar dark color="primary">
      <router-link to="/">
        <v-btn icon>
          <v-icon>arrow_back</v-icon>
        </v-btn>
      </router-link>

      <v-toolbar-title>
        Contacts
        <div class="caption">{{ contacts.length }} contacts</div>
      </v-toolbar-title>
      <v-spacer />
    </v-toolbar>

    <v-list two-line>
      <template v-for="(contact, index) in contacts">
        <v-list-tile avatar :to="`/contacts/${contact.phone}`">
          <v-list-tile-avatar>
            <img :src="`https://cdn.vuetifyjs.com/images/lists/${index + 1}.jpg`" />
          </v-list-tile-avatar>

          <v-list-tile-content>
            <v-list-tile-title>
              <strong>{{ contact.name || contact.phone }}</strong>
            </v-list-tile-title>
            <v-list-tile-sub-title>
              <strong>{{ contact.name ? contact.phone : null}}</strong>
            </v-list-tile-sub-title>
          </v-list-tile-content>
        </v-list-tile>
      </template>
    </v-list>

    <router-link to="/contacts/add">
      <v-btn
        dark fab hover large fixed bottom right color="primary"
      >
        <v-icon>add</v-icon>
      </v-btn>
    </router-link>
  </v-content>
</template>

<script>
  import { mapGetters } from 'vuex'

  import contacts from 'modules/contacts'
  import users from 'modules/users'

  export default {
    computed: {
      ...mapGetters({
        getUser: users.types.getters.get,
        getAll: contacts.types.getters.getAll,
      }),
      contacts() {
        return this.getAll.map(c => this.getUser(c) || { phone: c })
      },
    },
  }
</script>
