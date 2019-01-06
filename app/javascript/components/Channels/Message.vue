<template>
  <v-flex>
    <v-subheader v-if="message.type === 'timestamp'" :key="message.timestamp">
      {{ message.timestamp | moment('dddd, MMMM Do') }}
    </v-subheader>

    <v-container v-else pa-1>
      <v-layout row>
        <v-flex xs9 :offset-xs3="message.user === 0">
          <v-card :color="message.user === 0 ? '#C6DCF8' : 'white'">
            <v-card-text>
              <div class="caption font-weight-bold">{{ message.user }}</div>
              {{ message.text }}
              <div class="grey--text caption pb-2">
                <span class="right">{{ message.timestamp | moment('HH:mm') }}</span>
              </div>
            </v-card-text>
          </v-card>
        </v-flex>
      </v-layout>
    </v-container>
  </v-flex>
</template>

<script>
  export default {
    props: {
      message: { type: Object, default: () => {} },
    },
  }
</script>
