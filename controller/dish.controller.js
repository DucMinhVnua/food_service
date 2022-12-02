const Dish = require("../models/dish.model");
const Notification = require("../models/notification.model");
const Order = require("../models/Order.model");

const convertFileNameListToString = (files) => {
  return files
    .map((file) => `${process.env.IP}/uploads/${file.filename}`)
    .join(", ");
};

// INSERT DISH

exports.insertDish = (req, res) => {
  const { id_shop, name, price, description, percent_discount } = req.body;

  if (Object.keys(req.body).length <= 0) {
    res.status(400).send({
      code: 1,
      message: "Body dish can't be empty or miss fields!",
    });
  }

  const dish = new Dish({
    id_shop,
    name,
    price,
    images: req.files ? convertFileNameListToString(req.files) : null,
    description,
    create_at: new Date(),
    percent_discount,
  });

  Dish.create(dish, (err, data) => {
    if (err) {
      res.status(500).send({
        code: 1,
        message: err.message,
      });
    } else {
      res.status(200).send({
        code: 0,
        data: data,
      });
    }
  });
};

// SELECT ALL DISH

exports.selectAll = function (req, res) {
  const { id } = req.body;

  Dish.selectAll(id, (err, data) => {
    if (err) {
      res.status(500).send({
        code: 1,
        message: err.message,
      });
    } else {
      res.status(200).send({
        code: 0,
        data: [...data],
        total: data.length,
      });
    }
  });
};

// DELETE DISH

exports.deleteDish = function (req, res) {
  const { id } = req.body;

  Dish.delete(id, (err, data) => {
    if (err) {
      res.status(500).send({
        code: 1,
        message: err.message,
      });
    } else {
      res.status(200).send({
        code: 0,
        data: data,
      });
    }
  });
};

// UPDATE DISH
exports.updateDish = function (req, res) {
  const { id, name, price, description, percent_discount } = req.body;

  if (Object.keys(req.body).length <= 0) {
    res.status(400).send({
      code: 1,
      message: "Body dish can't be empty or miss fields!",
    });
  }

  const dish = new Dish({
    id,
    name,
    price,
    images: convertFileNameListToString(req.files),
    description,
    create_at: new Date(),
    percent_discount,
  });

  Dish.update(dish, (err, data) => {
    if (err) {
      res.status(500).send({
        code: 1,
        message: err.message,
      });
    } else {
      res.status(200).send({
        code: 0,
        data: data,
      });
    }
  });
};

// GET LIST ORDERED DISH

exports.getListOrdered = (req, res) => {
  const { id, id_shop, order_by } = req.body;

  const sortListNotificationByTimeDesc = (listNotification) => {
    return listNotification.sort(function (a, b) {
      const date1 = new Date(a.ordered_time);
      const date2 = new Date(b.ordered_time);
      return date2 - date1;
    });
  };

  Notification.getAll({ id_customer: id, id_shop }, (err, data) => {
    if (err) {
      return res.status(500).send({
        code: 1,
        message: err.message,
      });
    }

    data = sortListNotificationByTimeDesc(data);

    return res.status(200).send({
      code: 0,
      data: data,
    });
  });
};

// INSERT ORDERED DISH

exports.insertOrderDish = (req, res) => {
  const { id_dish, id_customer, id_shop, status, amount } = req.body;

  const order = new Order({
    id_dish,
    id_customer,
    id_shop,
    status,
    amount,
    ordered_time: new Date(),
  });

  Order.insertOrderDish(order, (err, data) => {
    if (err) {
      res.status(500).send({
        code: 1,
        message: err,
      });
    } else {
      res.status(200).send({
        code: 0,
        data: data,
      });
    }
  });
};

// Update ORDERED DISH

exports.updateOrderDish = (req, res) => {
  const { id, id_dish, id_customer, status, amount, id_shop } = req.body;

  const order = new Order({
    id,
    id_dish,
    id_shop,
    id_customer,
    status,
    amount,
    ordered_time: new Date(),
  });

  Order.updateOrderDish(order, (err, data) => {
    if (err) {
      res.status(500).send({
        code: 1,
        message: err,
      });
    } else {
      res.status(200).send({
        code: 0,
        data: data,
      });
    }
  });
};

// Select ORDERED DISH

exports.selectOrderDish = (req, res) => {
  const { id_customer, id_dish, type } = req.body;

  Order.selectOrderDish({ id_customer, id_dish, type }, (err, data) => {
    if (err) {
      res.status(500).send({
        code: 1,
        message: err,
      });
    } else {
      res.status(200).send({
        code: 0,
        data: data,
      });
    }
  });
};

exports.selectSingleOrderDish = (req, res) => {
  const { id_dish } = req.body;

  console.log(id_dish);

  Order.selectSingleOrderDish(id_dish, (err, data) => {
    if (err) {
      res.status(500).send({
        code: 1,
        message: err,
      });
    } else {
      res.status(200).send({
        code: 0,
        data: data,
      });
    }
  });
};
