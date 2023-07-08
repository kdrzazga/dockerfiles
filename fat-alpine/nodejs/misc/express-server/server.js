//curl http://localhost:3001/
//curl -X POST -d 4 http://localhost:3001/numbers
//
const express = require('express');
const app = express();
const port = 3001;

// Middleware to parse JSON requests
app.use(express.json());

let numbers = [];

// GET route
app.get('/', (req, res) => {
  const message = "This is JS EXPRESS server (other than the one from http library). The point is to add numbers to a list. " + numbers
  res.send(message);
});

app.post('/numbers', (req, res) => {
  const { number } = req.body;

  if (typeof number !== 'number') {
    return res.status(400).send('Bad Request');
  }

  numbers.push(number);
  res.send('Number added successfully');
});

app.listen(port, () => {
  console.log(`Server listening on port ${port}`);
});
