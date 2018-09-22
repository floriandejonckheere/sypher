export const dummyAuthState = {
  // Signed in user (identifier)
  user: 0,
  // API token
  token: 'mytoken',
}

export const dummyUsersState = [
  {
    // Unique identifier
    id: 0,
    // Phone number
    phone: '+32000000000',
    // Name
    name: 'Florian',
  },
  {
    // Unique identifier
    id: 1,
    // Phone number
    phone: '+32000000001',
    // Name
    name: 'John',
  },
  {
    // Unique identifier
    id: 2,
    // Phone number
    phone: '+32000000002',
    // Name
    name: 'Jane',
  },
  {
    // Unique identifier
    id: 3,
    // Phone number
    phone: '+32000000003',
    // Name
    name: 'Thomas',
  },
]

export const dummyChannelsState = [
  {
    // Unique identifier
    id: 0,
    // Type of channel, group or conversation
    type: 'group',
    // Members (user identifiers)
    members: [0, 1, 2],
    // Name
    name: 'Sypher Development',
    // Topic
    topic: null,
  },
  {
    // Unique identifier
    id: 1,
    // Type of channel, group or conversation
    type: 'conversation',
    // Members (user identifiers)
    members: [0, 3],
    // Topic
    topic: null,
  }
]
