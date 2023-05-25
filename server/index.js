const { client } = require('./database/clientConnection')
const express = require('express')

const app = express();
const PORT = 5000;

app.get('/', function (req, res) {
    res.send('Hello World')
})



try {
    client.connect()
    app.listen(PORT, () => console.log(`Server running on port: http://localhost:${PORT}`));
} catch (error) {
    console.log(error);
}