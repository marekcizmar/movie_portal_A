
const { client } = require('./database/clientConnection')
const express = require('express')
const cors = require("cors")
const app = express();
const PORT = 5000;
app.use(cors())

app.get('/movie', function (req, res) {
    client.query(`SELECT * FROM movie`, (err, result) => {
        res.send(result.rows)
    })

})

app.get('/genre', function (req, res) {
    client.query(`SELECT * FROM genre`, (err, result) => {
        res.send(result.rows)
    })

})

app.delete('/movie/:id', function (req, res) {
    const movieId = req.params.id;
  
    client.query('DELETE FROM movie WHERE id = $1', [movieId], (err, result) => {
      if (err) {
        console.error('Error deleting movie:', err);
        res.status(500).json({ error: 'An error occurred while deleting the movie.' });
      } else {
        res.sendStatus(200);
      }
    });
  });

try {
    client.connect()
    app.listen(PORT, () => console.log(`Server running on port: http://localhost:${PORT}`));
} catch (error) {
    console.log(error);
}
