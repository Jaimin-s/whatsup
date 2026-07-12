require('dotenv').config();
const jwt = require('jsonwebtoken');


const protect = (req, res, next) => {
    const token = req.headers.authorization?.split(" ")[1];// get token from headers
    if(!token){
        return res.status(401).json({message: "=== Unauthorized ==="});
    }

    try {
        const decoded = jwt.verify(token, process.env.JWT_SECRET);
        req.user = decoded;
        console.log(user)
        next();
    } catch (error) {
        res.status(401).json({message: "...Invalid Token..."});
    }
};

module.exports = protect;