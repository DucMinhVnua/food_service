const sql = require("../connection.mysql.js");

const Notification = function (tutorial) {};

Notification.getAll = ({ id_customer, id_shop }, result) => {
  console.log({ id_customer, id_shop });
  const query_join_dish = `INNER JOIN dish ON dish.id = notification.id_dish`;
  const query_join_shop = `INNER JOIN auth ON auth.id = dish.id_shop`;
  const conditions = id_shop
    ? "notification.id_shop = ?"
    : "notification.id_customer = ?";
  const query = `SELECT notification.*, dish.name, dish.price, dish.images, dish.percent_discount, dish.description, dish.id_shop, auth.address, auth.user_name FROM notification ${query_join_dish} ${query_join_shop} WHERE ${conditions}`;
  sql.query(query, id_customer || id_shop, (err, res) => {
    if (err) {
      result(err);
      return;
    }

    result(null, res);
  });
};

module.exports = Notification;
