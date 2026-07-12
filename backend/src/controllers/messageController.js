    const mongoose = require('mongoose');

    const Message = require("../models/messageModel");
    const Chat = require("../models/chatModel");

    const sendMessage = async (req, res) => {
        console.log("Request Body Recei ved:", req.body);
        try {
            const {  receiverId, text, status } = req.body;
            const senderId = req.user.id;

            const newMessage = await Message.create({
                senderId,
                receiverId,
                text,
                status
            });

            await Chat.findOneAndUpdate(
                {
                 participants: { $all: [senderId, receiverId]}
                },
                {
                    lastmessage: newMessage._id,
                    updatedAt: Date.now()
                },
                { upsert: true, new: true, setDefaultsOnInsert: true}
        );

            return res.status(201).json({newMessage});
        } catch (error) {
            return res.status(500).json({error: error.message});
        }
    };

    const updateMessageStatus = async (req, res) => {
        try {
            const { id } = req.params;
            const { status } = req.body;

            const updateMessage =await Message.findByIdAndUpdate(
                id, 
                { status },
                { new: true} 
            );

            res.status(200).json(updateMessage);
        } catch (error) {
            return res.status(500).json({message: "Erro updating message status: ", error});
        }
    }

    const getMessage = async (req, res) => {
        try {
            const { senderId, receiverId } = req.params;

            const message = await Message.find({
                $or: [
                    { senderId: senderId, receiverId: receiverId },
                    { senderId: receiverId, receiverId: senderId}
                ]
            }).sort({ timestamp: 1}); // sort by time so messages appear in order

            return res.status(200).json(message);
        } catch (error) {
            return res.status(500).json({error: error.message})
        }
    };


    module.exports = { sendMessage, getMessage, updateMessageStatus };