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

    // case dish already ordered
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

    const query_insertNotification = `INSERT INTO notification (id_orderDish, id_dish, id_customer, ordered_time, status, amount, id_shop) VALUES (${
      res.length > 0 ? id_orderDish : "LAST_INSERT_ID()"
    }, ?, ?, ?, ?, ?, ?)`;

    sql.query(query, values, (err, res) => {
      if (err) {
        result({
          code: 1,
          message: err,
        });
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
  });
};

Order.updateOrderDish = (order, result) => {
  const query = `Update orderdish SET status=? WHERE id=?`;

  const query_insertNotification = `INSERT INTO notification (id_orderDish, id_dish, id_customer, ordered_time, status, amount, id_shop) VALUES ("${order.id}", ?, ?, ?, ?, ?, ?)`;

  sql.query(query, [order.status, order.id], (err, res) => {
    if (err) {
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
  { id_customer, id_dish, status, order_by },
  result
) => {
  let query_join_dish = `INNER JOIN dish ON dish.id = orderdish.id_dish`;
  let condition = `id_customer = ${id_customer}`;

  const query_condition_status = `WHERE orderdish.status = ${status}`;
  const query_orderBy = `ORDER BY dish.price ${order_by}`;

  if (id_dish) {
    condition = `WHERE orderdish.id_dish = ${id_dish}`;
  }

  let query = `SELECT orderdish.*, dish.id_shop, dish.price, dish.description, dish.images, dish.create_at, dish.percent_discount, dish.id_shop FROM orderdish ${query_join_dish} ${condition}`;

  console.log(query);

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
  const query = `SELECT orderdish.*, dish.id_shop,dish.price, dish.description, dish.images, dish.create_at, dish.percent_discount, dish.id_shop FROM orderdish ${query_join_dish} WHERE orderdish.id = ${id}`;

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
