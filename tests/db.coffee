# Test for database

rimraf = require 'rimraf'
should = require 'should'
db = require '../lib/db'

describe 'users', ->

  beforeEach (next) ->
    rimraf "#{__dirname}/../db/tmp", next

  it 'insert and get', (next) ->
    client = db "#{__dirname}/../db/tmp"
    client.users.set 'dorianb',
      lastname: 'Bagur'
      firstname: 'Dorian'
      email: 'dorian@ethylocle.com'
    , (err) ->
      return next err if err
      client.users.get 'dorianb', (err, user) ->
        return next err if err
        user.username.should.eql 'dorianb'
        user.lastname.should.eql 'Bagur'
        user.firstname.should.eql 'Dorian'
        user.email.should.eql 'dorian@ethylocle.com'
        client.close()
        next()

  it 'get only a single user', (next) ->
    {users} = db "#{__dirname}/../db/tmp"
    users.set 'dorianb',
      lastname: 'Bagur'
      firstname: 'Dorian'
    , (err) ->
      return next err if err
      users.set 'maoqiaz',
        lastname: 'Zhou'
        firstname: 'Maoqiao'
        email: 'maoqiao@ethylocle.com'
      , (err) ->
        return next err if err
        users.get 'dorianb', (err, user) ->
          return next err if err
          user.username.should.eql 'dorianb'
          user.lastname.should.eql 'Bagur'
          should.not.exists user.email
          next()
