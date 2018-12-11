export default {
  getSeenScope: state => state.account.seenScope,
  getReadScope: state => state.account.readScope,

  getNotifications: state => state.device.notifications,
  getVibrate: state => state.device.vibrate,
}
