const express = require('express');
const bodyParser = require('body-parser');
const userRoute = require('./route/userRoute');
const authRoute = require('./route/loginRoute');
const fileRoute = require('./route/fileRoute');
const app = express();

app.use(bodyParser.json());
app.use('/api', userRoute);
app.use('/api', authRoute);
app.use('/api', fileRoute);
const port = 3000;
app.listen(port, () => {
    console.log("server running");
});