const express = require('express')
const router = express.Router()
const {createTicket,getAllTicket,getTicketById} = require('../controller/ticketController')
//const {protect} = require('./../middleware/authProtect')

router.get('/detail/:id',getTicketById)
router.get('/',getAllTicket)
router.post('/create',createTicket)

module.exports = router