<template>
  <v-content>
    <v-container fill-height>
      <v-layout column align-center>
        <v-flex class="text-xs-center">
          <h1>Verify your phone</h1>
          <p class="caption">Please enter the six-digit code that was sent to your phone</p>
        </v-flex>
        <v-flex xs8>
          <v-text-field autofocus placeholder="Code" mask="######" />
          <div class="text-xs-center">
            <a href="#" class="caption">Resend verification text</a>
          </div>
        </v-flex>
        <v-flex xs1>
          <v-btn to="/auth/profile" block class="success">Next</v-btn>
        </v-flex>
      </v-layout>
    </v-container>
  </v-content>
</template>
