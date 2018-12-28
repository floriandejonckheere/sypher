<template>
  <v-content>
    <RequestSpinner :type="requestTypes" />
    <Alert :errors="errors" />

    <v-container fill-height>
      <v-layout column align-center>
        <v-flex class="text-xs-center">
          <h1>Verify your phone</h1>
          <p class="caption">Please enter the six-digit code that was sent to your phone</p>
        </v-flex>
        <v-flex xs8>
          <v-form ref="form" v-model="valid" @submit="submit">
            <v-text-field
                    autofocus
                    name="pin"
                    type="number"
                    v-model="pin"
                    required
                    placeholder="Code"
                    :rules="pinRules"
            />
          </v-form>
          <div class="text-xs-center">
            <a href="#" class="caption">Resend verification code</a>
          </div>
        </v-flex>
        <v-flex xs1 style="width: 100%;">
          <v-container fluid>
            <v-layout row>
              <v-flex>
                <v-btn
                        block
                        class="primary"
                        :disabled="!valid"
                        @click="submit"
                >Next</v-btn>
              </v-flex>
            </v-layout>
          </v-container>
        </v-flex>
      </v-layout>
    </v-container>
  </v-content>
</template>

<script>
  import RequestSpinner from 'components/RequestSpinner'
  import Alert from 'components/Alert'

  import auth from 'modules/auth'

  export default {
    data: () => ({
      valid: false,
      pin: '',
      pinRules: [
        v => !!v || 'Code is required',
        v => /^[0-9]{6}$/.test(v) || 'Invalid code',
      ],

      errors: null,

      requestTypes: [
        auth.types.actions.verifyPin,
      ],
    }),
    methods: {
      submit (e) {
        e.preventDefault()

        if (this.$refs.form.validate()) {
          const phone = this.$store.getters[auth.types.getters.getCurrentPhone]
          const pin = parseInt(this.pin)

          this.$store.dispatch(auth.types.actions.verifyPin, { phone, pin })
            .then(() => { this.$router.push({ name: 'complete' }) })
            .catch(e => { this.errors = e })
        }
      },
    },
    components: {
      RequestSpinner,
      Alert,
    },
  }
</script>
