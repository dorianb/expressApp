# Import

    stream = require 'stream'
    util = require 'util'
    parse = require 'csv-parse'

    importStream = (destination, format = format: 'csv') ->
      return new importStream destination, format unless this instanceof importStream
      this.destination = destination
      this.format = format.format
      stream.Writable.call this

    util.inherits importStream, stream.Writable
    importStream.prototype._write = (chunk, encoding, done) ->
      if this.format is 'csv'
        that = this
        parse chunk.toString(), (err, users) ->
          for k, v of users
            that.destination.users.set v[0],
              lastname: v[1]
              firstname: v[2]
              email: v[3]
              password: v[4]
            , (err) ->
              return next err if err
      if this.format is 'json'
        users = JSON.parse chunk.toString()
        for k, v of users
          this.destination.users.set v.username,
            lastname: v.lastname
            firstname: v.firstname
            email: v.email
            password: v.password
          , (err) ->
            return next err if err
      done()

    module.exports = importStream
