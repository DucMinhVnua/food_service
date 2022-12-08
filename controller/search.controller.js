const {
  searchDishModel,
  searchDishHistoryModel,
} = require("../models/search.model");

exports.searchDishController = (req, res) => {
  const { keyword } = req.body;

  if (keyword.length <= 0) {
    res.status(200).send({
      code: 0,
      data: {
        keyword,
        data: [],
        total: 0,
      },
    });
  }

  function handleData(err, data) {
    if (err) {
      res.status(404).send({
        code: 1,
        message: err,
      });
      return;
    }

    res.status(200).send({
      code: 0,
      data: {
        keyword,
        data,
        total: data.length,
      },
    });
  }

  searchDishModel(keyword, handleData);
};

//
exports.searchHistoryOrderedController = (req, res) => {
  const { keyword, orderBy, id_customer, id_shop } = req.body;

  function handleData(err, data) {
    if (err) {
      res.status(404).send({
        code: 1,
        message: err,
      });
      return;
    }

    res.status(200).send({
      code: 0,
      data: {
        keyword,
        data,
        total: data.length,
      },
    });
  }

  searchDishHistoryModel(
    {
      keyword,
      orderBy,
      id_customer,
      id_shop,
    },
    handleData
  );
};
