const mongoose = require('mongoose');
const Chat = require('../models/chatModel');

const getChats = async (req, res) => {
    try {
        const chats = await Chat.find({ participants: req.user.id })
            .populate('participants', 'username profilepic')
            .populate('lastmessage')
            .sort({ updatedAt: -1 });

        const formattedChats = chats.map((chat) => {
            const otherParticipant = (chat.participants || []).find(
                (participant) => participant._id?.toString() !== req.user.id
            );
            const lastMessage = Array.isArray(chat.lastmessage)
                ? chat.lastmessage[0]
                : chat.lastmessage;

            return {
                _id: chat._id,
                contactname: otherParticipant?.username || 'Unknown',
                lastmessage: lastMessage?.text || '',
                participants: chat.participants,
                updatedAt: chat.updatedAt,
            };
        });

        res.status(200).json(formattedChats);
    } catch (error) {
        res.status(500).json({ message: 'Error Fetching Chats: ', error });
    }
};

module.exports = getChats;