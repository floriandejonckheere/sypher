<template>
  <v-content>
    <v-container fill-height>
      <v-layout column align-center>
        <v-flex class="text-xs-center">
          <h1>Verify PIN</h1>
          <p class="caption">Enter the six-digit PIN that was sent to your phone</p>
        </v-flex>
        <v-flex xs8>
                <v-text-field autofocus placeholder="PIN" mask="######" size="6"/>
        </v-flex>
        <v-flex xs1>
          <v-btn to="/channels" block class="success">Next</v-btn>
        </v-flex>
      </v-layout>
    </v-container>
  </v-content>
</template>
