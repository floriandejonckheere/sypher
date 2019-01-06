<template>
  <v-content class="white">
    <v-toolbar dark color="primary">
      <v-toolbar-title>
        Sypher
        <div class="caption">connected</div>
      </v-toolbar-title>
      <v-spacer />

      <router-link to="#">
        <v-btn icon>
          <v-icon>search</v-icon>
        </v-btn>
      </router-link>

      <v-menu min-width="200">
        <v-toolbar-title slot="activator">
          <v-icon dark>more_vert</v-icon>
        </v-toolbar-title>

        <v-list>
          <v-list-tile to="/contacts">
            Contacts
          </v-list-tile>
          <v-list-tile to="/settings">
            Settings
          </v-list-tile>
        </v-list>
      </v-menu>
    </v-toolbar>

    <v-list two-line>
      <template v-for="(channel, index) in getAll">
        <v-list-tile :key="channel.uuid" avatar :to="`/channels/${channel.uuid}`">
          <v-list-tile-avatar>
            <img :src="`https://cdn.vuetifyjs.com/images/lists/${index + 1}.jpg`" />
          </v-list-tile-avatar>

          <v-list-tile-content>
            <v-list-tile-title>
              <span class="black--text" v-bind:class="{ 'font-weight-black': index !== 0 }">
                {{ channel.name }}
              </span>
              <span class="primary--text pa-1" v-if="index !== 0">
                {{ index }}
              </span>
              <span class="grey--text caption right">
                {{ new Date() | moment('calendar') }}
              </span>
            </v-list-tile-title>
            <v-list-tile-sub-title>
              <v-icon size="16px" v-if="channel == 'sending'">access_time</v-icon>
              <v-icon size="16px" v-if="channel == 'sent'">done</v-icon>
              <v-icon size="16px" v-if="channel == 'delivered'">done_all</v-icon>
              <v-icon size="16px" color="primary" v-if="channel == 'read'">done_all</v-icon>
              {{ channel.name }}
            </v-list-tile-sub-title>
          </v-list-tile-content>
        </v-list-tile>

        <v-divider inset  v-if="index != Object.keys(getAll).length - 1" />
      </template>
    </v-list>

    <v-speed-dial fixed bottom right color="primary" transition="slide-y-reverse-transition" v-model="fab">
      <v-btn slot="activator" color="primary" dark fab hover large v-model="fab" @click="sync">
        <v-icon>message</v-icon>
        <v-icon>close</v-icon>
      </v-btn>
      <v-btn fab dark small color="secondary" to="/channels/group">
        <v-icon>group_add</v-icon>
      </v-btn>
      <v-btn fab dark small color="secondary" to="/channels/conversation">
        <v-icon>person_add</v-icon>
      </v-btn>
    </v-speed-dial>
  </v-content>
</template>

<script>
  import { mapGetters } from 'vuex'

  import channels from 'modules/channels'
  import auth from 'modules/auth'
  import users from 'modules/users'

  export default {
    computed: {
      ...mapGetters({
        getAll: channels.types.getters.getAll,
      }),
    },
    methods: {
      sync() {
        this.$store.dispatch(auth.types.actions.sync)
      },
    },
    data: () => {
      return {
        fab: false,
        items: [
          {
            type: 'channel',
            id: 0,
            title: 'Florian Dejonckheere',
            count: 0,
            timestamp: 1537443112,
            preview: "I'll see what I can do about this Sypher thing. I assume it's well written.",
            state: 'read',
          },
          {
            type: 'channel',
            id: 2,
            title: 'John Doe',
            count: 0,
            timestamp: 1537443112,
            preview: "I do like these read notifications in the app",
            state: 'delivered',
          },
          {
            type: 'channel',
            id: 3,
            title: 'Sypher Development',
            count: 23,
            timestamp: 1537442112,
            preview: "People, please don't use the dev server as your personal playground.",
            state: 'sent',
          },
          {
            type: 'channel',
            id: 4,
            title: 'Ex',
            count: 1,
            timestamp: 1536818613,
            preview: "I'll come round to pick up my stuff tomorrow",
          },
          {
            type: 'channel',
            id: 5,
            title: 'Neighbour',
            count: 0,
            timestamp: 1536818613,
            preview: "That's not my dog",
            state: 'sending',
          },
        ]
      }
    },
  }
</script>
