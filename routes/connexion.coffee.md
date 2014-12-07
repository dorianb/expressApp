# Routing page de log in

    express = require 'express'
    router = express.Router()
    db = require '../lib/db'

### GET signin page

    router.get '/', (req, res) ->
      res.render 'connexion', { title: 'Authentification', username: req.session.username, password: req.session.password }

### POST sign in page

    router.post '/', (req, res) ->
      client = db "#{__dirname}/../db"
      client.users.get req.body.username, (err, user) ->
        return next err if err
        if user.username is req.body.username and user.password is req.body.password
          req.session.username = user.username
          req.session.password = user.password
          req.session.lastname = user.lastname
          req.session.firstname = user.firstname
          req.session.email = user.email

          if req.body.rememberMe is true
            req.session.cookie.maxAge = null

          res.json
            signedin: true
            username: user.username
            lastname: user.lastname
            firstname: user.firstname
            email: user.email
        else
          res.json
            signedin: false
            message: "Identifiant/email ou mot de passe incorrect"

        client.close()

    module.exports = router
