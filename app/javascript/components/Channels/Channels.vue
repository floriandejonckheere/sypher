<template>
  <div class="container">
    <nav class="navbar is-primary">
      <div class="navbar-item">
        <router-link to="/" class="button is-white">
          <font-awesome-icon icon="arrow-left" />
        </router-link>
      </div>
      <div class="navbar-brand">
        <a class="navbar-item" href="https://bulma.io">
          <img src="https://bulma.io/images/bulma-logo.png" alt="Bulma: a modern CSS framework based on Flexbox" width="112" height="28">
        </a>
      </div>

      <div class="navbar-menu is-active">
        <div class="navbar-start"></div>
        <div class="navbar-end">
          <div class="navbar-item">
            <router-link to="/settings" class="button is-white">
              Settings
            </router-link>
          </div>
        </div>
      </div>
    </nav>

    <h3 class="title">Channels</h3>
    <p class="subtitle">Sypher will send a text to your this number to verify your phone number</p>

    <div class="field has-addons">
      <p class="control">
        <input class="input has-text-right" type="text" placeholder="+32" style="width: 4em;">
      </p>
      <p class="control">
        <input class="input" type="text" placeholder="Your phone number">
      </p>
    </div>
    <div class="field">
      <p class="control">
        <a class="button is-primary">
          Next
        </a>
      </p>
    </div>
  </div>
</template>
