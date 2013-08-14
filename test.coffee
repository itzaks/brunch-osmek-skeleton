request = require 'superagent'
expect = require 'expect.js'

describe 'Suite One', ->
  it (done) ->
    request.post('localhost:3000').end (res) ->
      expect(res).to.exist
      expect(res.status).to.equal 200
      expect(res.body).to.contain 'Give'
      done()