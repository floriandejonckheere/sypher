import signout from './signout'
import verifyPhone from './verifyPhone'
import verifyPin from './verifyPin'

export default {
  [signout.type]: signout,
  [verifyPhone.type]: verifyPhone,
  [verifyPin.type]: verifyPin,
}
