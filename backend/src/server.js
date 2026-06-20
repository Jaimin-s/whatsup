// 1. PLACE THIS AT THE VERY TOP OF SERVER.JS BEFORE ANYTHING ELSE
const dns = require('node:dns');
dns.setServers(['1.1.1.1', '8.8.8.8']); 

// 2. Your existing imports continue below
require('dotenv').config();

const app = require('./app');
const connectdb = require('./db/db');

app.use('/api/users', require('../src/routes/userRoutes'));

const startServer = async () => {
    await connectdb();
    app.listen(3000, () => {
        console.log("✅ Server running on port 3000");
    });
};

startServer();


// app.get('/api/users', (req, res) => {
//     res.send("this is the api/user api path and it exists...");
// });

// app.listen(3000, () => {
//     console.log("Server running on port 3000")
// });