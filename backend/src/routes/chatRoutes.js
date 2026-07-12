const express = require('express');
const protect = require('../middleware/authMiddleware');
const chatController = require('../controllers/chatController');
const router = express.Router();

router.get('/', protect, chatController);

module.exports = router;