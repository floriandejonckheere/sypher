import { Machine } from 'xstate'

const transitions = {
  SIGNUP: 'routerMachine/SIGNUP',
  SIGNIN: 'routerMachine/SIGNIN',
  COMPLETE: 'routerMachine/COMPLETE',

  BACK: 'routerMachine/BACK',
  NEXT: 'routerMachine/NEXT',
}

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
        [transitions.SIGNUP]: 'welcome',
        // Redirect to channels page
        [transitions.SIGNIN]: 'channels',
        // Redirect to complete profile page
        [transitions.COMPLETE]: 'complete',
      },
      meta: { path: '/' },
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
        [transitions.BACK]: 'final',
        [transitions.NEXT]: 'verify',
      },
      meta: { path: '/auth/welcome' },
    },
    // Signup: enter phone number
    verify: {
      on: {
        [transitions.BACK]: 'welcome',
        [transitions.NEXT]: 'pin',
      },
    },
    // Signup: enter verification code
    pin: {
      on: {
        [transitions.BACK]: 'verify',
        [transitions.NEXT]: 'profile',
      },
    },
    // Signup: complete profile
    complete: {
      on: {
        [transitions.BACK]: 'final',
        [transitions.NEXT]: 'channels',
      },
    },

    /**
     * Application
     *
     */
    // Application: list of channels
    channels: {
      on: {
        [transitions.BACK]: 'final',
      },
    },
  },
})

export { transitions }
export default machine
