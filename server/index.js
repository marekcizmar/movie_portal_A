
const { client } = require('./database/clientConnection')
const express = require('express')
const cors = require("cors")

const app = express();
const PORT = 5000;

app.use(express.json());
app.use(cors());

app.get('/movie', function (req, res) {
    client.query(`SELECT * FROM movie ORDER BY year desc`, (err, result) => {
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

  app.post('/movie', function (req, res) {
      console.log(req.body)
    const { title, year, genre, summary, image, quality, length } = req.body;
    const query = `INSERT INTO movie (title, year, genre, summary, image, quality, length)
                   VALUES ($1, $2, $3, $4, $5, $6, $7)`;
  
    const values = [title, year, genre, summary, image, quality, length];
  
    client.query(query, values, (err, result) => {
      if (err) {
        console.error('Error adding movie:', err);
        res.status(500).json({ error: 'An error occurred while adding the movie.' });
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
