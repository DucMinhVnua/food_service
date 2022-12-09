const sql = require("../connection.mysql.js");

// search by keyword, result returned by keyword any position
exports.searchDishModel = (keyword, result) => {
  // case keyword empty return handle
  if (keyword === "") {
    result(err);
    return;
  }

  // initializa variables
  const querySelectTable =
    "SELECT dish.*, auth.address, auth.user_name AS name_shop FROM dish";
  const conditionLike = `WHERE name LIKE "%${keyword}%"`;
  const queryJoinAuthByIdShop = "INNER JOIN auth ON auth.id = dish.id_shop";
  const queryJoinCoordsFromAuthTable =
    "INNER JOIN coords ON coords.id = auth.coord_id";

  // handle query get results searched
  sql.query(
    `${querySelectTable} ${queryJoinAuthByIdShop} ${queryJoinCoordsFromAuthTable} ${conditionLike}`,
    (err, res) => {
      // catch error in handling function
      if (err) {
        result(err);
        return;
      }

      result(null, res);
    }
  );
};

/* search dish ordered from notification table had value status = 4 by keyword and you can sort by dish ordered time */

exports.searchDishHistoryModel = (req, result) => {
  // initialize variables
  const querySelectTable =
    "SELECT notification.*, dish.name, dish.price, dish.images, dish.percent_discount, dish.description, dish.id_shop, auth.address, auth.user_name AS name_shop, au_customer.user_name AS name_customer FROM notification";
  let condition = "WHERE status = 4";
  const conditionLike = `dish.name LIKE "%${req.keyword}%"`;
  const queryJoinDish = "INNER JOIN dish ON dish.id = notification.id_dish";
  const orderBy = `ORDER BY notification.ordered_time ${req.orderBy}`;
  const query_join_shop = `INNER JOIN auth ON auth.id = dish.id_shop`;
  const query_join_customer = `INNER JOIN auth au_customer ON au_customer.id = notification.id_customer`;

  if (req.id_customer) {
    condition =
      condition + ` AND notification.id_customer = ${req.id_customer}`;
  }

  if (req.id_shop) {
    condition = condition + ` AND notification.id_shop = ${req.id_shop}`;
  }

  let queryRoot = `${querySelectTable} ${queryJoinDish} ${query_join_shop} ${query_join_customer} ${condition} AND ${conditionLike}`;

  // config when had orderBy
  if (req.orderBy) {
    queryRoot = queryRoot + orderBy;
  }

  // handle query get results searched
  sql.query(`${queryRoot}`, (err, res) => {
    // catch error in handling function
    if (err) {
      result(err);
      return;
    }

    result(null, res);
  });
};
