var bodyParser = require("body-parser");
const express = require("express");
const path = require("path");

const app = express();

const port = 3000;

// create application/json parser
var jsonParser = bodyParser.json();

// create application/x-www-form-urlencoded parser
var urlencodedParser = bodyParser.urlencoded({ extended: true });

app.use(express.json());
app.use(jsonParser);
app.use(urlencodedParser);
app.use("/", express.static(__dirname));

module.exports = {
  app,
  port,
};
