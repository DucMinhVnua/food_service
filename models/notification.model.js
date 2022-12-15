const sql = require("../connection.mysql.js");

const Notification = function (tutorial) {};

Notification.getAll = ({ id_customer, id_shop }, result) => {
  const query_join_dish = `INNER JOIN dish ON dish.id = notification.id_dish`;
  const query_join_shop = `INNER JOIN auth ON auth.id = dish.id_shop`;
  const query_join_coords = `INNER JOIN coords ON coords.id = auth.coord_id`;
  const query_join_customer = `INNER JOIN auth au_customer ON au_customer.id = notification.id_customer`;
  const conditions = id_shop
    ? "notification.id_shop = ?"
    : "notification.id_customer = ?";
  const query = `SELECT notification.*, dish.name, dish.price, dish.images, dish.percent_discount, dish.description, dish.id_shop, auth.address, auth.user_name AS name_shop, au_customer.user_name AS name_customer, coords.latitude, coords.longitude FROM notification ${query_join_dish} ${query_join_shop} ${query_join_customer} ${query_join_coords} WHERE ${conditions} ORDER BY notification.ordered_time DESC`;
  sql.query(query, id_shop || id_customer, async (err, res) => {
    if (err) {
      result(err);
      return;
    }

    result(null, res);
  });
};

module.exports = Notification;
