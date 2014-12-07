# Routing page d'accueil

    express = require 'express'
    router = express.Router()

#### GET Home page

    router.get '/', (req, res) ->
      if req.session.username?
        res.render 'accueil', { title: 'Accueil', username: req.session.username, lastname: req.session.lastname, firstname: req.session.firstname, email: req.session.email }
      else
        res.redirect '/Connexion'
      console.log "Cookie: " + req.session.username + " " + req.session.password + " " + req.session.cookie.maxAge/1000 + "s"

    module.exports = router
