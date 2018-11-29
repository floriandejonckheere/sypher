<template>
  <v-content>
    <v-toolbar dark color="primary">
      <router-link to="/settings">
        <v-btn icon>
          <v-icon>arrow_back</v-icon>
        </v-btn>
      </router-link>

      <v-toolbar-title>
        Data and storage usage
      </v-toolbar-title>
      <v-spacer />
    </v-toolbar>

    <v-list two-line>
      <v-list-tile @click="">
        <v-list-tile-content>
          <v-list-tile-title>
            Stored messages
          </v-list-tile-title>

          <v-list-tile-sub-title>
            0
          </v-list-tile-sub-title>
        </v-list-tile-content>
      </v-list-tile>

      <v-divider />

      <v-list-tile @click="">
        <v-list-tile-content>
          <v-list-tile-title>
            Contacts
          </v-list-tile-title>

          <v-list-tile-sub-title>
            3
          </v-list-tile-sub-title>
        </v-list-tile-content>
      </v-list-tile>
    </v-list>
  </v-content>
</template>
