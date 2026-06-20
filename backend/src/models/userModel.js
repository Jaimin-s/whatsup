const mongoose = require('mongoose');

const userSchema = new mongoose.Schema({
    phoneNumber: { type: String, required: true, unique: true },
    username: { type: String, required: true },
    status: { type: String, default: 'Hey there! I am using WhatsApp.' },
    profilepic: { type: String, default: "" }
}, { timestamps: true });

module.exports = mongoose.model("User", userSchema);
