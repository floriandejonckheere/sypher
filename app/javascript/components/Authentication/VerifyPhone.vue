<template>
  <v-content>
    <v-container fill-height>
      <v-layout column align-center>
        <v-flex class="text-xs-center">
          <h1>Verify your phone</h1>
          <p class="caption">Sypher will send a text message to this number to verify your phone (carrier charges may apply)</p>
        </v-flex>
        <v-flex xs8>
          <v-container fluid grid-list-md>
            <v-layout row>
              <v-flex xs2>
                <v-text-field autofocus placeholder="32" prefix="+" mask="###" />
              </v-flex>
              <v-flex>
                <v-text-field placeholder="Phone number" mask="###############" />
              </v-flex>
            </v-layout>
          </v-container>
        </v-flex>
        <v-flex xs1>
          <v-btn to="/auth/pin" block class="success">Next</v-btn>
        </v-flex>
      </v-layout>
    </v-container>
  </v-content>
</template>
