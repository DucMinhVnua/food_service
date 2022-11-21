const mysql = require("mysql");

const connection = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "food_db",
});

connection.connect((error) => {
  if (error) throw error;
  console.log("Successfully connected");
});

module.exports = connection;
