const express = require('express');
const bodyParser = require('body-parser');
const { exec } = require('child_process');
// const cors = require('cors');

const app = express();
const port = 8000; // You can change this port if needed

// app.use(cors());
app.use(bodyParser.json());

app.post('/processData', (req, res) => {
  const chatMessage = req.body.inputString;
  console.log(chatMessage)

  // Run the Python script with the received data
  exec(`python chatbot.py ${chatMessage}`, (error, stdout, stderr) => {
    if (error) {
      console.error(`Error executing Python script: ${error}`);
      return res.status(500).json({ error: 'Internal server error' });
    }

    // console.log(`Python script output: ${stdout}`);
    const lines = stdout.split('\n');
    console.log(lines[3])
    res.json({ res: lines[3]});
  });
});

app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
