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

      <v-list-tile to="#">
        <v-list-tile-content>
          <v-list-tile-title>
            Delete my account
          </v-list-tile-title>
        </v-list-tile-content>
      </v-list-tile>
    </v-list>
  </v-content>
</template>
