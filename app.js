const express = require('express')
const app = express()
const port = 3000
// import os module
const os = require("os");

// get host name
const hostName = os.hostname();

app.get('/', (req, res) => {
  res.send('Hello World! from '+ hostName)
})

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})
