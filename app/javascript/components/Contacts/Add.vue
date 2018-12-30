<template>
  <v-content class="white">
    <RequestSpinner :type="requestTypes" />

    <v-toolbar dark color="primary">
      <router-link to="/contacts">
        <v-btn icon>
          <v-icon>close</v-icon>
        </v-btn>
      </router-link>

      <v-toolbar-title>
        Add contact
      </v-toolbar-title>
      <v-spacer />

      <v-btn icon @click="submit">
        <v-icon>check</v-icon>
      </v-btn>
    </v-toolbar>

    <v-container>
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
    </v-container>
  </v-content>
</template>

<script>
  import RequestSpinner from 'components/RequestSpinner'

  import alerts from 'modules/alerts'
  import contacts from 'modules/contacts'

  export default {
    data: () => ({
      valid: false,
      country: '32',
      countryRules: [
        v => !!v || 'Country code is required',
        v => /^[0-9]{1,3}$/.test(v) || 'Invalid country code',
      ],

      phone: '471451721',
      phoneRules: [
        v => !!v || 'Phone is required',
        v => /^[0-9]{8,14}$/.test(v) || 'Invalid phone number',
      ],

      requestTypes: [
        contacts.types.actions.add,
      ],
    }),
    methods: {
      submit (e) {
        e.preventDefault()

        if (this.$refs.form.validate()) {
          const phone = `+${this.country}${this.phone}`

          this.$store.dispatch(contacts.types.actions.add, { phone })
            .then(() => { this.$router.push({ name: 'contacts' }) })
        }
      },
    },
    components: {
      RequestSpinner,
    },
  }
</script>
