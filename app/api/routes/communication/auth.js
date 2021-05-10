const express = require('express');
const router = express.Router()
const auth_controler = require('../../controllers/communication/auth')
router.post('/login', auth_controler.singin)

module.exports = router