rimraf = require 'rimraf'
should = require 'should'
fs = require 'fs'
importStream = require '../lib/import'
db = require '../lib/db'

describe 'import', ->

  beforeEach (next) ->
    rimraf "#{__dirname}/../db/tmp", next

  it 'Import sample.csv', (next) ->
    client = db "#{__dirname}/../db/tmp"
    fs
    .createReadStream "#{__dirname}/../sample.csv"
    .on 'end', () ->
      client.users.get 'dorianb', (err, user) ->
        return next err if err
        user.username.should.eql 'dorianb'
        user.lastname.should.eql 'Bagur'
        user.firstname.should.eql 'Dorian'
        user.email.should.eql 'dorian@ethylocle.com'
        user.password.should.eql '1234'
        client.users.get 'maoqiaoz', (err, user) ->
          return next err if err
          user.username.should.eql 'maoqiaoz'
          user.lastname.should.eql 'Zhou'
          user.firstname.should.eql 'Maoqiao'
          user.email.should.eql 'maoqiao@ethylocle.com'
          user.password.should.eql '1234'
          client.close()
          next()
    .pipe importStream client, format: 'csv'

  it 'Import sample.json', (next) ->
    client = db "#{__dirname}/../db/tmp"
    fs
    .createReadStream "#{__dirname}/../sample.json"
    .on 'end', () ->
      client.users.get 'dorianb', (err, user) ->
        return next err if err
        user.username.should.eql 'dorianb'
        user.lastname.should.eql 'Bagur'
        user.firstname.should.eql 'Dorian'
        user.email.should.eql 'dorian@ethylocle.com'
        user.password.should.eql '1234'
        client.users.get 'maoqiaoz', (err, user) ->
          return next err if err
          user.username.should.eql 'maoqiaoz'
          user.lastname.should.eql 'Zhou'
          user.firstname.should.eql 'Maoqiao'
          user.email.should.eql 'maoqiao@ethylocle.com'
          user.password.should.eql '1234'
          client.close()
          next()
    .pipe importStream client, format: 'json'
