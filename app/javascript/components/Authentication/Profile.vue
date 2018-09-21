<template>
  <v-content>
    <v-container fill-height>
      <v-layout column align-center>
        <v-flex class="text-xs-center">
          <h1>Complete your profile</h1>
          <p class="caption">Enter your name and select an avatar to let people know who you are</p>
        </v-flex>
        <v-flex xs8>
          <v-text-field autofocus placeholder="Your name" counter="20"/>
        </v-flex>
        <v-flex xs1>
          <v-btn to="/channels" block class="success">Next</v-btn>
        </v-flex>
      </v-layout>
    </v-container>
  </v-content>
</template>
