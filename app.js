const express = require('express')
const app = express()
const port = 3000
// import os module
const os = require("os");

// get host name
const hostName = os.hostname();

app.get('/', (req, res) => {
  console.log(`${(new Date())} ${hostName} : access / v1`);
  res.send(`${(new Date())} Hello World! from  ${hostName} v1`)
})

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})
