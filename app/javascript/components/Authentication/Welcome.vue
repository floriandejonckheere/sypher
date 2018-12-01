<template>
  <v-content>
    <v-container fill-height>
      <v-layout column justify-space-around align-center>
        <v-flex class="text-xs-center">
          <h1>Welcome to Sypher</h1>
        </v-flex>
        <v-flex>
          <v-icon color="primary" size="20em" class="sy-logo">fingerprint</v-icon>
        </v-flex>
        <v-flex xs1>
          <v-container fluid>
            <v-layout column>
              <v-flex class="text-xs-center">
                <span class="caption">
                  By continuing you accept the Sypher <a href="#" @click="dialog = true">Terms of Service</a> and <a href="#" @click="dialog = true">Privacy Policy</a>.
                </span>
              </v-flex>
              <v-flex>
                <v-btn to="/auth/verify" block class="primary">Agree and continue</v-btn>
              </v-flex>
            </v-layout>
          </v-container>
        </v-flex>
      </v-layout>
    </v-container>

    <!-- ToS Modal -->
    <v-dialog v-model="dialog" scrollable>
      <v-card>
        <v-card-title>Terms of Service and Privacy Policy</v-card-title>
        <v-divider></v-divider>
        <v-card-text>
          <TermsOfService />
        </v-card-text>
        <v-divider></v-divider>
        <v-card-actions>
          <v-spacer />
          <v-btn color="blue darken-1" flat @click="dialog = false">Close</v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>
  </v-content>
</template>

<script>
  import TermsOfService from './TermsOfService'

  export default {
    data () {
      return {
        dialog: false,
      }
    },
    components: {
      TermsOfService,
    },
  }
</script>
