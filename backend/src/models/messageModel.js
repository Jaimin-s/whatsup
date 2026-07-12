const mongoose = require("mongoose");

const messageSchema = new mongoose.Schema({
    senderId: { type: mongoose.Schema.Types.ObjectId, ref: 'User', require: true},
    receiverId: { type: mongoose.Schema.Types.ObjectId, ref: 'User', required: true},
    text: {type: String, required: true},
    status: {type: String, enum: ['sent','delievered','read'], default: 'sent'},
    timestamp: { type: Date, default: Date.now}
});

module.exports = mongoose.model('Message', messageSchema);