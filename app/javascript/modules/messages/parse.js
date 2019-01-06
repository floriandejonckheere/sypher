import { types } from './state'

export default object => {
  return {
    uuid: object.uuid,
    text: object.text,
    timestamp: object.timestamp,
    sender: object.sender.phone,
    channel: object.channel.uuid,
  }
}
