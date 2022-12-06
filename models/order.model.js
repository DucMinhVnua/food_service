const { query } = require("express");
const sql = require("../connection.mysql.js");
const Notification = require("./notification.model.js");

const Order = function (order) {
  this.id = order.id;
  this.id_dish = order.id_dish;
  this.id_shop = order.id_shop;
  this.id_customer = order.id_customer;
  this.ordered_time = order.ordered_time;
  this.status = order.status;
  this.amount = order.amount;
};

Order.insertOrderDish = (order, result) => {
  const query_select = "SELECT id FROM orderdish WHERE id_dish = ?";
  let query = `INSERT INTO orderdish (id_dish, id_customer, ordered_time, status, amount, id_shop) VALUES (?, ?, ?, ?, ?, ?)`;
  let values = [
    order.id_dish,
    order.id_customer,
    order.ordered_time,
    order.status,
    order.amount,
    order.id_shop,
  ];
  let id_orderDish = "";

  sql.query(query_select, order.id_dish, (err, res) => {
    if (err) {
      result({
        code: 1,
        message: err,
      });
      return;
    }

    sql.query(
      `SELECT * FROM orderdish WHERE id_customer=${order.id_customer} AND id_dish=${order.id_dish}`,
      (err, res) => {
        if (err) {
          result({
            code: 1,
            message: err,
          });
          return;
        }

        if (res.length > 0) {
          // check dish already ordered
          if (res.length > 0) {
            id_orderDish = res[0].id;
            let status_startOrder = 1;
            query = `Update orderdish SET status=?, ordered_time=?, amount=? WHERE id=?`;
            values = [
              status_startOrder,
              order.ordered_time,
              order.amount,
              id_orderDish,
            ];
          }

          sql.query(query, values, (err, data) => {
            const query_insertNotification = `INSERT INTO notification (id_orderDish, id_dish, id_customer, ordered_time, status, amount, id_shop) VALUES (?, ?, ?, ?, ?, ?, ?)`;

            sql.query(
              query_insertNotification,
              [
                id_orderDish,
                order.id_dish,
                order.id_customer,
                order.ordered_time,
                order.status,
                order.amount,
                order.id_shop,
              ],
              (err, res_select) => {
                if (err) {
                  result({
                    code: 1,
                    message: err,
                  });
                  return;
                }

                result(null, data);
              }
            );
          });
        } else {
          const query_insertNotification = `INSERT INTO notification (id_orderDish, id_dish, id_customer, ordered_time, status, amount, id_shop) VALUES (LAST_INSERT_ID(), ?, ?, ?, ?, ?, ?)`;

          sql.query(query, values, (err, res) => {
            if (err) {
              result({
                code: 1,
                message: err,
              });
              return;
            }

            console.log(order);

            sql.query(
              query_insertNotification,
              [
                order.id_dish,
                order.id_customer,
                order.ordered_time,
                order.status,
                order.amount,
                order.id_shop,
              ],
              (err, res_select) => {
                if (err) {
                  result({
                    code: 1,
                    message: err,
                  });
                  return;
                }

                result(null, {
                  code: 0,
                  data: res_select,
                });
              }
            );
          });
        }
      }
    );
  });
};

Order.updateOrderDish = (order, result) => {
  const query = `Update orderdish SET status=? WHERE id=?`;

  const query_insertNotification = `INSERT INTO notification (id_orderDish, id_dish, id_customer, ordered_time, status, amount, id_shop) VALUES ("${order.id}", ?, ?, ?, ?, ?, ?)`;

  sql.query(query, [order.status, order.id], (err, res) => {
    if (err) {
      console.log("err1", err);
      result(err);
      return;
    }

    sql.query(
      query_insertNotification,
      [
        order.id_dish,
        order.id_customer,
        order.ordered_time,
        order.status,
        order.amount,
        order.id_shop,
      ],
      (err, res_select) => {
        if (err) {
          console.log("err2", err);
          result(err);
          return;
        }

        result(null, {
          code: 0,
          data: res_select,
        });
      }
    );
  });
};

Order.selectOrderDish = (
  { id_customer, id_dish, id_shop, status, order_by },
  result
) => {
  let query_join_dish = `INNER JOIN dish ON dish.id = orderdish.id_dish`;

  const query_condition_status = `WHERE orderdish.status = ${status}`;
  const query_orderBy = `ORDER BY dish.price ${order_by}`;
  const query_join_shop = `INNER JOIN auth ON auth.id = dish.id_shop`;
  const query_join_customer = `INNER JOIN auth au_customer ON au_customer.id = orderdish.id_customer`;

  if (id_customer) {
    condition = `WHERE id_customer = ${id_customer}`;
  }

  if (id_shop) {
    condition = `WHERE orderdish.id_shop = ${id_shop}`;
  }

  let query = `SELECT orderdish.*,dish.name, dish.price, dish.description, dish.images, dish.create_at, dish.percent_discount, dish.id_shop, auth.user_name AS name_shop, au_customer.user_name AS name_customer FROM orderdish ${query_join_dish} ${query_join_shop} ${query_join_customer} ${condition}`;

  if (status) {
    query += query + query_condition_status;
  }

  if (order_by) {
    query += query_orderBy;
  }

  sql.query(query, (err, res) => {
    if (err) {
      result(err);
      return;
    }

    result(null, {
      code: 0,
      data: res,
    });
  });
};

Order.selectSingleOrderDish = (id, result) => {
  const query_join_dish = `INNER JOIN dish ON dish.id = orderdish.id_dish`;
  const query = `SELECT orderdish.*,dish.name, dish.id_shop,dish.price, dish.description, dish.images, dish.create_at, dish.percent_discount, dish.id_shop FROM orderdish ${query_join_dish} WHERE orderdish.id = ${id}`;

  sql.query(query, (err, res) => {
    if (err) {
      result(err);
      return;
    }

    result(null, {
      code: 0,
      data: res,
    });
  });
};

module.exports = Order;
