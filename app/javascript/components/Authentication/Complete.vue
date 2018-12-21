<template>
  <v-content>
    <RequestSpinner :type="requestTypes" />
    <Alert :errors="errors" />

    <v-container fill-height>
      <v-layout column align-center>
        <v-flex class="text-xs-center">
          <h1>Complete your profile</h1>
          <p class="caption">Enter your name to let people know who you are</p>
        </v-flex>
        <v-flex xs8>
          <v-form ref="form" v-model="valid">
            <v-text-field
                    autofocus
                    name="name"
                    v-model="name"
                    required
                    placeholder="Your name"
                    counter="20"
                    :rules="nameRules"
            />
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

  import users from 'modules/users'

  export default {
    data: () => ({
      valid: false,
      name: '',
      nameRules: [
        v => !!v || 'Name is required',
        v => /^.{1,20}/.test(v) || 'Name must be between 1 and 20 characters',
      ],

      errors: null,

      requestTypes: [
        users.requests.complete,
      ],
    }),
    methods: {
      submit () {
        if (this.$refs.form.validate()) {
          this.$store.dispatch('users/complete', { name: this.name })
            .then(() => { this.$router.push({ name: 'channels' }) })
            .catch((e) => { this.errors = e })
        }
      },
    },
    components: {
      RequestSpinner,
      Alert,
    },
  }
</script>
