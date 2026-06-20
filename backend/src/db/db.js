const mongoose = require('mongoose');

const connectdb = async () => {
    try {
        await mongoose.connect(process.env.MONGO_URI);
        console.log("✅ MongoDB Connected Successfully!");
    } catch (error) {
        console.error("❌ MongoDB Connection Error:", error);
    }
};

module.exports = connectdb;

// const mongoose = require('mongoose');

// const connectdb = async () => {
//     try {
//         await mongoose.connect('mongodb://test_user:nQ5gYtVCOfyhRCF7@main-cluster-shard-00-00.qemoonu.mongodb.net:27017,main-cluster-shard-00-01.qemoonu.mongodb.net:27017,main-cluster-shard-00-02.qemoonu.mongodb.net:27017/whatsup?ssl=true&replicaSet=atlas-m0z038-shard-0&authSource=admin&retryWrites=true&w=majority');
//         console.log('Database connected successfully...');
//     } catch (error) {
//         console.error('--- Database Connection Error ---');
//         console.error(error); 
//         console.error('---------------------------------');
//     }
// }

// module.exports = connectdb;