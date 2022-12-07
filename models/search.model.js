const sql = require("../connection.mysql.js");

// search by keyword, result returned by keyword any position
exports.searchDishModel = (keyword, result) => {
  // case keyword empty return handle
  if (keyword === "") {
    result(err);
    return;
  }

  // initializa variables
  const querySelectTable = "SELECT * FROM dish";
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
  const querySelectTable = "SELECT * FROM notification";
  const conditionStatus = "WHERE status = 4";
  const conditionLike = `dish.name LIKE "%${req.keyword}%"`;
  const queryJoinDish = "INNER JOIN dish ON dish.id = notification.id_dish";
  const orderBy = `ORDER BY notification.ordered_time ${req.orderBy}`;
  let queryRoot = `${querySelectTable} ${queryJoinDish} ${conditionStatus} AND ${conditionLike}`;

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
