export default (object) => {
  return {
    uuid: object.uuid,
    type: object.type,
    name: object.name,
    topic: object.topic,
    users: object.users.filter(u => u.phone),
  }
}
