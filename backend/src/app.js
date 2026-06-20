const express = require('express');// for instance of express

const app = express();
app.use(express.json());

module.exports = app;