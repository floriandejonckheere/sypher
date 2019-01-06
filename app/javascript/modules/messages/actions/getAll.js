import client from 'lib/apollo'

import requests from 'modules/requests'

import { actions as t, mutations as mt } from '../types'
import parse from '../parse'

import getMessages from './getAll.gql'

export default async ({ commit, dispatch }) => {
  return dispatch(requests.types.actions.request, {
    requestType: t.getAll,
    request: () => client.query({ query: getMessages })
  }).then(data => {
    data.messages.forEach(message => commit(mt.set, { message: parse(message) }))
  })
}
