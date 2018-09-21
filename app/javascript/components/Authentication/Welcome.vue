<template>
  <v-content fill-height>
    <v-container fluid fill-height>
      <v-layout column justify-space-around align-center>
        <v-flex>
          <h1 class="text-xs-center">Welcome to Sypher</h1>
        </v-flex>
        <v-flex>
          <v-icon color="primary" size="20em" class="sy-logo">fingerprint</v-icon>
        </v-flex>
        <v-flex xs1>
          <v-container fluid>
            <v-layout column>
              <v-flex class="text-xs-center">
            <span class="caption">
              By continuing you accept the Sypher <a href="#" target="_blank">Terms of Service</a> and <a href="#" target="_blank">Privacy Policy</a>.
            </span>
              </v-flex>
              <v-flex>
                <v-btn to="/auth/verify" block class="success">Agree and continue</v-btn>
              </v-flex>
            </v-layout>
          </v-container>
        </v-flex>
      </v-layout>
    </v-container>
  </v-content>
</template>
