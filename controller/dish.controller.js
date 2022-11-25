const Dish = require("../models/dish.model");

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
    images: convertFileNameListToString(req.files),
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
  Dish.selectAll((err, data) => {
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
