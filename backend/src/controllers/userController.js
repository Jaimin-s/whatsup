const User = require('../models/userModel');

// this function creates a new iser in the database
const registerUser = async (req, res) => {
    try {
        const { phoneNumber, username } = req.body;
        
        const existinguser = await User.findOne({ phoneNumber });
        if(existinguser){
            return res.status(400).json({message: 'user already existes...'});
        }

        const newuser = await User.create({phoneNumber, username});
        if(newuser){
            return res.status(201).json(User);
        }
    } catch (error) {
        res.status(500).json({error: error.message});
    }
}

module.exports = { registerUser };