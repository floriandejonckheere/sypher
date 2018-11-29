<template>
  <v-content class="white">
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
          <div class="title py-1">Florian Dejonckheere</div>
          <div class="subheading py-1">+32 123 45 67 89</div>
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

      <v-list-tile @click="">
        <v-list-tile-content>
          <v-list-tile-title>
            Change name
          </v-list-tile-title>
        </v-list-tile-content>
      </v-list-tile>
    </v-list>
  </v-content>
</template>
