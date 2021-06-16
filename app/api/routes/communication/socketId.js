const express = require('express');
const router = express.Router()
const contact_controler = require('../../controllers/communication/socketId')
router.post('/socket', contact_controler.contact)

module.exports = router