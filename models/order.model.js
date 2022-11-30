const { query } = require("express");
const sql = require("../connection.mysql.js");

const Order = function (order) {
  this.id_dish = order.id_dish;
  this.id_customer = order.id_customer;
  this.ordered_time = order.ordered_time;
  this.status = order.status;
  this.amount = order.amount;
};

Order.insertOrderDish = (order, result) => {
  //   const query_notification = `INSERT INTO notification (status, order_time) VALUES (?, ?)`;

  //   sql.query(query_notification, (err, res) => {
  //     if (err) {
  //       result({
  //         code: 1,
  //         message: "err query_notification" + err.message,
  //       });
  //       return;
  //     }
  //   });

  const query = `INSERT INTO orderdish (id_dish, id_customer, ordered_time, status, amount) VALUES (?, ?, ?, ?, ?)`;

  let values = [];

  sql.query(
    query,
    [
      order.id_dish,
      order.id_customer,
      order.ordered_time,
      order.status,
      order.amount,
    ],
    (err, res) => {
      if (err) {
        result(err);
        return;
      }

      result(null, {
        code: 0,
        data: res,
      });
    }
  );
};

module.exports = Order;
