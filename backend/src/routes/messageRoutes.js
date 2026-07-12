const express = require('express');
const protect = require('../middleware/authMiddleware');

const { sendMessage, getMessage, updateMessageStatus } = require('../controllers/messageController');

const router = express.Router();

router.post('/send', protect, sendMessage);

router.get('/:senderId/:receiverId', protect, getMessage);

router.put('/:id/status', protect, updateMessageStatus);

module.exports = router;