import { types } from './state'

export default object => {
  return {
    uuid: object.uuid,
    type: types[object.type],
    name: object.name,
    topic: object.topic,
    users: object.users.filter(u => u.phone),
  }
}
