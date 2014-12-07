# Routing index page

    express = require 'express'
    router = express.Router()

#### GET Home page

    router.get '/', (req, res) ->
      res.redirect '/Accueil'

    module.exports = router
