<template>
  <v-content>
    <v-toolbar dark color="primary">
      <router-link to="/channels">
        <v-btn icon>
          <v-icon>arrow_back</v-icon>
        </v-btn>
      </router-link>

      <v-toolbar-title>
        {{ name }}
        <div class="caption">{{ members.map(m => m.name).join(', ') }}</div>
      </v-toolbar-title>
    </v-toolbar>

    <v-container fluid>
      <v-layout column>
        <template v-for="item in items">
          <v-flex>
            <v-subheader v-if="item.type === 'timestamp'" :key="item.timestamp">
              {{ item.timestamp | moment('dddd, MMMM Do') }}
            </v-subheader>

            <v-container v-else pa-1>
              <v-layout row>
                <v-flex xs9 :offset-xs3="item.user === 0">
                  <v-card :color="item.user === 0 ? '#C6DCF8' : 'white'">
                    <v-card-text pt-0>
                      <div class="caption font-weight-bold">{{ members.find(m => m.id === item.user).name }}</div>
                      {{ item.text }}
                      <div class="grey--text caption pb-2">
                        <span class="right">{{ item.timestamp | moment('HH:MM') }}</span>
                      </div>
                    </v-card-text>
                  </v-card>
                </v-flex>
              </v-layout>
            </v-container>
          </v-flex>
        </template>
      </v-layout>
    </v-container>
  </v-content>
</template>

<script>
  module.exports = {
    data: function() {
      return {
        type: 'group',
        name: 'Sypher Development',
        members: [
          {
            id: 0,
            name: 'Florian',
          },
          {
            id: 1,
            name: 'John',
          },
          {
            id: 2,
            name: 'Jane',
          },
          {
            id: 3,
            name: 'Thomas',
          },
        ],
        items: [
          {
            type: 'timestamp',
            timestamp: 1537315200
          },
          {
            type: 'message',
            id: 0,
            user: 1,
            timestamp: 1537328300,
            text: "Did anyone reset the dev server? I can't seem to find my files on it anymore.",
          },
          {
            type: 'message',
            id: 1,
            user: 2,
            timestamp: 1537438300,
            text: "I deployed the latest release again because the data was corrupt.",
          },
          {
            type: 'message',
            id: 2,
            user: 3,
            timestamp: 1537439300,
            text: "I don't really care about the dev server, but I'm just writing a very long message to all y'all, probably to test out the text overflow and wrap, while also making a run-on sentence like you haven't seen before.",
          },
          {
            type: 'timestamp',
            timestamp: 1537401600
          },
          {
            type: 'message',
            id: 3,
            user: 0,
            timestamp: 1537442112,
            text: "People, please don't use the dev server as your personal playground.",
          },
        ]
      }
    }
  }
</script>
