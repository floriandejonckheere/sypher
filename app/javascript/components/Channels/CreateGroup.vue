<template>
  <v-content>
    <v-toolbar dark color="primary">
      <router-link to="/channels">
        <v-btn icon>
          <v-icon>arrow_back</v-icon>
        </v-btn>
      </router-link>

      <v-toolbar-title>
        New group
        <div class="caption">Select one or more contacts</div>
      </v-toolbar-title>

      <v-spacer />

      <v-btn icon>
        <v-icon>add</v-icon>
      </v-btn>
    </v-toolbar>

    <v-list one-line>
      <template v-for="(item, index) in items">

        <v-list-tile @click="" avatar>
          <v-list-tile-action>
            <v-checkbox v-model="selected[item.id]"></v-checkbox>
          </v-list-tile-action>

          <v-list-tile-avatar>
            <img :src="`https://cdn.vuetifyjs.com/images/lists/${index + 1}.jpg`" />
          </v-list-tile-avatar>

          <v-list-tile-content @click="selected[item.id] = !selected[item.id]">
            <v-list-tile-title>
              <strong>{{ item.name }}</strong>
            </v-list-tile-title>
          </v-list-tile-content>
        </v-list-tile>
      </template>
    </v-list>

    <v-btn icon fab large bottom right fixed color="primary" to="/channels/0">
      <v-icon>done</v-icon>
    </v-btn>
  </v-content>
</template>

<script>
  export default {
    data: () => {
      return {
        selected: {
          0: false,
          1: false,
          2: false,
          3: false,
        },
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
