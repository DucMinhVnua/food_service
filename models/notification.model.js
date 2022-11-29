const sql = require("../connection.mysql.js");

const Notification = function (tutorial) {};

Notification.getAll = (id_customer, result) => {
  const query_join_dish = `INNER JOIN dish ON dish.id = od.id_dish`;
  const query = `SELECT od.*, dish.* FROM orderdish od ${query_join_dish} WHERE od.id_customer = ?`;
  sql.query(query, id_customer, (err, res) => {
    if (err) {
      result(err);
    }

    result(null, res);
  });
};

module.exports = Notification;
