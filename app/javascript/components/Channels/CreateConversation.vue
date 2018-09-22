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
      <template v-for="(item, index) in items">
        <v-list-tile avatar :to="`/channels/${item.id}`">
          <v-list-tile-avatar>
            <img :src="`https://cdn.vuetifyjs.com/images/lists/${index + 1}.jpg`" />
          </v-list-tile-avatar>

          <v-list-tile-content>
            <v-list-tile-title>
              <strong>{{ item.name }}</strong>
            </v-list-tile-title>
          </v-list-tile-content>
        </v-list-tile>
      </template>
    </v-list>
  </v-content>
</template>

<script>
  module.exports = {
    data: function() {
      return {
        items: [
          {
            // Unique identifier
            id: 0,
            // Phone number
            phone: '+32000000000',
            // Name
            name: 'Florian',
          },
          {
            // Unique identifier
            id: 1,
            // Phone number
            phone: '+32000000001',
            // Name
            name: 'John',
          },
          {
            // Unique identifier
            id: 2,
            // Phone number
            phone: '+32000000002',
            // Name
            name: 'Jane',
          },
          {
            // Unique identifier
            id: 3,
            // Phone number
            phone: '+32000000003',
            // Name
            name: 'Thomas',
          },
        ]
      }
    }
  }
</script>
