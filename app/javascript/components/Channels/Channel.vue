<template>
  <v-content>
    <v-toolbar fixed dark color="primary">
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

    <v-container fluid class="mb-5 pb-5">
      <v-layout column>
        <template v-for="item in items">
          <Message :message="item" />
        </template>
      </v-layout>
    </v-container>

    <v-footer fixed height="auto">
      <div color="white">
        <v-container fluid>
          <v-layout row>
            <v-flex>
              <v-chip color="white" class="sy-message-input pa-1 pr-2" disabled>
                <v-btn small fab flat class="ma-0 pa-0">
                  <v-icon>insert_emoticon</v-icon>
                </v-btn>
                <v-text-field autofocus placeholder="Type a message"/>
              </v-chip>
            </v-flex>
            <v-flex>
              <v-btn color="blue" dark small fab depressed>
                <v-icon>send</v-icon>
              </v-btn>
            </v-flex>
          </v-layout>
        </v-container>
      </div>
    </v-footer>
  </v-content>
</template>

<script>
  import Message from './Message'

  export default {
    data: () => {
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
    },
    components: {
      Message,
    },
  }
</script>
