const express = require('express');
const router = express.Router()
const contact_controler = require('../../controllers/communication/contact')
router.post('/contact', contact_controler.contact)

module.exports = router