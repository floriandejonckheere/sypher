<template>
  <v-content>
    <RequestSpinner :type="requestTypes" />
    <Alert :errors="errors" />

    <v-container fill-height>
      <v-layout column align-center>
        <v-flex class="text-xs-center">
          <h1>Verify your phone</h1>
          <p class="caption">Sypher will send a text message to this number to verify your phone (carrier charges may
            apply)</p>
        </v-flex>
        <v-flex xs8>
          <v-form ref="form" v-model="valid" @submit="submit">
            <v-container fluid grid-list-md>
              <v-layout row>
                <v-flex xs2>
                  <v-text-field
                          autofocus
                          name="country"
                          type="number"
                          v-model="country"
                          required
                          placeholder="32"
                          prefix="+"
                          :rules="countryRules"
                  />
                </v-flex>
                <v-flex>
                  <v-text-field
                          name="phone"
                          type="number"
                          v-model="phone"
                          required
                          placeholder="Phone number"
                          :rules="phoneRules"
                  />
                </v-flex>
              </v-layout>
            </v-container>
          </v-form>
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
      country: '',
      countryRules: [
        v => !!v || 'Country code is required',
        v => /^[0-9]{1,3}$/.test(v) || 'Invalid country code',
      ],

      phone: '',
      phoneRules: [
        v => !!v || 'Phone is required',
        v => /^[0-9]{8,14}$/.test(v) || 'Invalid phone number',
      ],

      errors: [],

      requestTypes: [
        auth.types.actions.verifyPhone,
      ],
    }),
    methods: {
      submit (e) {
        e.preventDefault()

        if (this.$refs.form.validate()) {
          const phone = `+${this.country}${this.phone}`

          this.$store.dispatch(auth.types.actions.verifyPhone, { phone })
            .then(() => { this.$router.push({ name: 'pin' }) })
            .catch(e => { this.errors.push(e) })
        }
      },
    },
    components: {
      RequestSpinner,
      Alert,
    },
  }
</script>
