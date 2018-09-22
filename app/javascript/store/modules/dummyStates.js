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

export const dummyMessagesState = [
  {
    // Unique identifier
    id: 0,
    // Channel identifier
    channel: 0,
    // Contents
    text: 'Did anyone reset the dev server? I can\'t seem to find my files on it anymore.',
    // Sender
    user: 1,
    // Timestamp
    timestamp: 1534961244,
  },
  {
    // Unique identifier
    id: 1,
    // Channel identifier
    channel: 0,
    // Contents
    text: 'I deployed the latest release again because the data was corrupt.',
    // Sender
    user: 2,
    // Timestamp
    timestamp: 1534961244,
  },
  {
    // Unique identifier
    id: 2,
    // Channel identifier
    channel: 0,
    // Contents
    text: 'I don\'t really care about the dev server, but I\'m just writing a very long message to all y\'all, probably to test out the text overflow and wrap, while also making a run-on sentence like you haven\'t seen before.',
    // Sender
    user: 3,
    // Timestamp
    timestamp: 1534961244,
  },
  {
    // Unique identifier
    id: 3,
    // Channel identifier
    channel: 0,
    // Contents
    text: 'People, please don\'t use the dev server as your personal playground.',
    // Sender
    user: 0,
    // Timestamp
    timestamp: 1534961244,
  },
]
