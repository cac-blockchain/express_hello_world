const express = require("express");
const app = express();
const port = 3000;
// import os module
const os = require("os");

// get host name
const hostName = os.hostname();
const version = "v" + 1;
app.get("/", (req, res) => {
  console.log(`${new Date()} ${hostName} : access / ` + version);
  res.send(`${new Date()} Hello World! from  ${hostName} ` + version);
});

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`);
});
