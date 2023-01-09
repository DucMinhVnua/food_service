const { query } = require("express");
const sql = require("../connection.mysql.js");

const Dish = function (dish) {
  this.id = dish.id;
  this.id_shop = dish.id_shop;
  this.name = dish.name;
  this.price = dish.price;
  this.description = dish.description;
  this.images = dish.images;
  this.create_at = dish.create_at;
  this.percent_discount = dish.percent_discount;
};

Dish.create = (dish, result) => {
  const query_root =
    "INSERT INTO dish (id_shop, name, price, description, images, create_at, percent_discount) VALUES (?, ?, ?, ?, ?, ?, ?)";

  sql.query(
    query_root,
    [
      dish.id_shop,
      dish.name,
      dish.price,
      dish.description,
      dish.images,
      dish.create_at,
      dish.percent_discount,
    ],
    (err, res) => {
      if (err) {
        result(err);
        return;
      }

      result(null, res);
    }
  );
};

Dish.selectAll = (id, result) => {
  const join_1 = "INNER JOIN auth a ON d.id_shop=a.id AND role=0";
  const join_2 = "INNER JOIN coords c ON a.coord_id=c.id";

  let query = `SELECT d.*,a.id AS id_shop,a.user_name, a.email, a.phone_number, a.address, a.avatar, a.coord_id, c.latitude, c.longitude FROM dish d ${join_1} ${join_2}`;
  if (id) {
    query += ` WHERE d.id_shop = ${id}`;
  }

  sql.query(query, (err, res) => {
    if (err) {
      result(err);
      return;
    }

    result(null, res);
  });
};

Dish.delete = (id, result) => {
  sql.query(`DELETE FROM dish WHERE id=?`, id, (err, res) => {
    if (err) {
      result(err);
      return;
    }
    result(null, res);
  });
};

Dish.update = (dish, result) => {
  let query =
    "UPDATE dish SET name=?, price=?, description=?, create_at=?, images=?, percent_discount=? WHERE id=?";
  let values = [
    dish.name,
    dish.price,
    dish.description,
    dish.create_at,
    dish.images,
    dish.percent_discount,
    dish.id,
  ];

  if (!dish.images) {
    query =
      "UPDATE dish SET name=?, price=?, description=?, create_at=?, percent_discount=? WHERE id=?";
    values = [
      dish.name,
      dish.price,
      dish.description,
      dish.create_at,
      dish.percent_discount,
      dish.id,
    ];
  }

  sql.query(query, values, (err, res) => {
    if (err) {
      result(err);
      return;
    }
    result(null, res);
  });
};

// model update sold status: sole out => 1, not sold out yet = 0
Dish.update_sold_status = (dish_id, status, result) => {
  const update_sold_status_query = `UPDATE dish SET sold_out=${status} WHERE id=${dish_id}`;

  sql.query(update_sold_status_query, (err, res) => {
    if (err) {
      result(err);
      return;
    }

    // update order dish, if id dish exits in table orderDish and dish had status to 1(waiting shop confirm)
    // change sold out status to 1 and push more notification.

    const get_dish_sold_out_from_orderDish_query = `SELECT * FROM orderdish WHERE id_dish=${dish_id} AND status=1`
    sql.query(get_dish_sold_out_from_orderDish_query, (err, res_orderDish) => {
      if (err) {
        result(err);
        return;
      }

      const udpate_notification = `UPDATE notification SET sold_out=1 WHERE id_dish=${dish_id} AND status=1`

      sql.query(udpate_notification, (err, res) => {

        if (err) {
          result(err);
          return;
        }

        if (res_orderDish.length > 0) {
          const query_insertNotification = `INSERT INTO notification (id_orderDish, id_dish, id_customer, ordered_time, status, amount, id_shop, sold_out) VALUES (?, ?, ?, ?, ?, ?, ?, ?)`;

          res_orderDish.map(item => {
            sql.query(query_insertNotification, [
              item.id,
              item.id_dish,
              item.id_customer,
              item.ordered_time,
              5,
              item.amount,
              item.id_shop,
              1
            ], (err, res) => {

              if (err) {
                result(err);
                return;
              }

              result(null, res);

            })
          })
        } else {
          result(null, res);
          return;
        }

      })

    })

  })
}

// get dish model
Dish.getDish = (dish_id, result) => {

  sql.query(`SELECT * FROM dish WHERE id=${dish_id}`, (err, res) => {
    if (err) {
      result(err);
      return;
    }

    result(null, res);
  });
};

module.exports = Dish;
