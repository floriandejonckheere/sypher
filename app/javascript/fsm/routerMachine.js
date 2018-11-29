import { Machine } from 'xstate'

const machine = Machine({
  // Identifier of the state machine
  id: 'router',

  // Enable strict mode
  strict: true,

  // Initial state: pseudo-state without rendering anything
  initial: 'initial',

  states: {
    // Initial state, automatically transitions depending on completeness of user account
    initial: {
      on: {
        // Start signup process
        SIGNUP: 'welcome',
        // Redirect to channels page
        SIGNIN: 'channels',
        // Redirect to complete profile page
        COMPLETE: 'complete',
      },
    },
    // Final state, automatically exists the application
    final: {},

    /**
     * Authentication
     *
     */
    // Signup: welcome and ToS page
    welcome: {
      on: {
        BACK: 'final',
        NEXT: 'verify',
      },
    },
    // Signup: enter phone number
    verify: {
      on: {
        BACK: 'welcome',
        NEXT: 'pin',
      },
    },
    // Signup: enter verification code
    pin: {
      on: {
        BACK: 'verify',
        NEXT: 'profile',
      },
    },
    // Signup: complete profile
    complete: {
      on: {
        BACK: 'final',
        NEXT: 'channels',
      },
    },

    /**
     * Application
     *
     */
    // Application: list of channels
    channels: {
      on: {
        BACK: 'final',
        CHANNEL: 'channel',
      },
    },
  },
})

export default machine
