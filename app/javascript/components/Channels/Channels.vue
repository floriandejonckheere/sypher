<template>
  <v-content>
    <v-toolbar dark color="primary">
      <v-toolbar-title>
        Sypher
        <div class="caption">online</div>
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
          <v-list-tile to="/profile">
            Settings
          </v-list-tile>
        </v-list>
      </v-menu>
    </v-toolbar>

    <v-list two-line>
      <template v-for="(item, index) in items">
        <v-subheader v-if="item.type === 'header'" :key="item.title">
          {{ item.title }}
        </v-subheader>

        <v-list-tile v-else :key="item.id" avatar :to="`/channels/${item.id}`">
          <v-list-tile-avatar>
            <img :src="`https://cdn.vuetifyjs.com/images/lists/${index + 1}.jpg`" />
          </v-list-tile-avatar>

          <v-list-tile-content>
            <v-list-tile-title>
              <span class="black--text" v-bind:class="{ 'font-weight-black': item.count !== 0 }">
                {{ item.title }}
              </span>
              <span class="primary--text pa-1" v-if="item.count !== 0">
                {{ item.count }}
              </span>
              <span class="grey--text caption right">
                {{ item.timestamp | moment('calendar') }}
              </span>
            </v-list-tile-title>
            <v-list-tile-sub-title>
              {{ item.preview }}
            </v-list-tile-sub-title>
          </v-list-tile-content>
        </v-list-tile>
      </template>
    </v-list>

    <v-speed-dial fixed bottom right color="primary" transition="slide-y-reverse-transition" v-model="fab">
      <v-btn slot="activator" color="primary" dark fab hover large v-model="fab">
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
  module.exports = {
    data: function() {
      return {
        fab: false,
        items: [
          {
            type: 'header',
            title: 'Today',
          },
          {
            type: 'channel',
            id: 0,
            title: 'Florian Dejonckheere',
            count: 1,
            timestamp: 1537443112,
            preview: "I'll see what I can do about this Sypher thing. I assume it's well written.",
          },
          {
            type: 'channel',
            id: 1,
            title: 'Sypher Development',
            count: 23,
            timestamp: 1537442112,
            preview: "People, please don't use the dev server as your personal playground.",
          },
          {
            type: 'header',
            title: 'Last week',
          },
          {
            type: 'channel',
            id: 2,
            title: 'Ex',
            count: 0,
            timestamp: 1536818613,
            preview: "I'll come round to pick up my stuff tomorrow",
          },
        ]
      }
    }
  }
</script>
