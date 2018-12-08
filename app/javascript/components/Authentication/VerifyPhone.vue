<template>
  <v-content>
    <v-container fill-height>
      <v-layout column align-center>
        <v-flex class="text-xs-center">
          <h1>Verify your phone</h1>
          <p class="caption">Sypher will send a text message to this number to verify your phone (carrier charges may
            apply)</p>
        </v-flex>
        <v-flex xs8>
          <v-form ref="form" v-model="valid" lazy-validation>
            <v-container fluid grid-list-md>
              <v-layout row>
                <v-flex xs2>
                  <v-text-field
                          :autofocus="true"
                          name="country"
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
        <v-flex xs1>
          <v-btn
            block
            class="primary"
            :disabled="!valid"
            @click="submit"
          >Next</v-btn>
        </v-flex>
      </v-layout>
    </v-container>
  </v-content>
</template>

<script>
  export default {
    data: () => ({
      valid: false,
      country: '',
      countryRules: [
        v => !!v || 'Country code is required',
        v => /^[0-9]{1,4}$/.test(v) || 'Invalid country code',
      ],

      phone: '',
      phoneRules: [
        v => !!v || 'Phone is required',
        v => /^[0-9]{5,15}$/.test(v) || 'Invalid phone number',
      ],

    }),
    methods: {
      submit () {
        if (this.$refs.form.validate()) {
          const phone = `${this.country}${this.phone}`

          this.$store.dispatch('auth/verifyPhone', { phone })
        }
      },
      verifyPhone: () => {
      },
    },
  }
</script>
