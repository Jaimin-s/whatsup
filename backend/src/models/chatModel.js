const mongoose = require('mongoose');
const { updateSearchIndex } = require('./userModel');

const chatSchema = new mongoose.Schema({
  participants: [{
    type: mongoose.Schema.Types.ObjectId,
    ref: 'User',
    required: true 
  }],
  lastmessage: {
    type: mongoose.Schema.Types.ObjectId,
    ref: 'Message',
    required: true
  },
  updatedAt: {
    type: Date,
    default: Date.now
  }
}, {timestamps: true});

module.exports = mongoose.model('Chat', chatSchema);
