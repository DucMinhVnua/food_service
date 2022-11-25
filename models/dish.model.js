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

Dish.selectAll = (result) => {
  const join_1 = "INNER JOIN auth a ON d.id_shop=a.id AND role=0";
  const join_2 = "INNER JOIN coords c ON a.coord_id=c.id";

  sql.query(
    `SELECT d.*,a.id AS id_shop, a.email, a.phone_number, a.address, a.avatar, a.coord_id, c.latitude, c.longitude FROM dish d ${join_1} ${join_2}`,
    (err, res) => {
      if (err) {
        result(err);
        return;
      }

      result(null, res);
    }
  );
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
  sql.query(
    `UPDATE dish SET name=?, price=?, description=?, create_at=?, images=?, percent_discount=? WHERE id=?`,
    [
      dish.name,
      dish.price,
      dish.description,
      dish.create_at,
      dish.images,
      dish.percent_discount,
      dish.id,
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

module.exports = Dish;
