var Db = require('./dbcrud')
var express = require('express')
var bodyParser = require('body-parser')
var cors = require('cors')
var app = express()
var router = express.Router()

app.use(bodyParser.urlencoded({ extended: true}))
app.use(bodyParser.json())
app.use(cors())
app.use('/api', router)

router.use((request, response, next) => {
    console.log("SERVER IN FUNZIONE...")
    next()
});

router.route("/opere").get((request, response) => {
    Db.getElencoOpere().then((data) => {
        response.json(data[0])
    })
})

router.route('/opere/:id').get((request, response) => {
    Db.getOpera(request.params.id).then((data) => {
      response.json(data[0]);
    })
  })  

var port = process.env.PORT || 8090
app.listen(port)
console.log("Le API Recensioni sono in ascolto sulla porta " + port)