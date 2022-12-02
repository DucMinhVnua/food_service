const multer = require("multer");
const { app, port } = require("./app.init");
const {
  login_model,
  register_model,
  update_user_model,
  get_info,
} = require("./models/auth.model");

const { get_shop_list } = require("./Routes/auth.route");
const {
  create_dish,
  get_dish_list,
  delete_dish,
  update_dish,
  notification_dish,
  create_order_dish,
  update_order_dish,
  select_single_order_dish,
  select_orders_dish,
} = require("./Routes/dish.route");
const { getListShop } = require("./controller/auth.controller");
const {
  insertDish,
  selectAll,
  deleteDish,
  updateDish,
  getListOrdered,
  insertOrderDish,
  updateOrderDish,
  selectOrderDish,
  selectSingleOrderDish,
} = require("./controller/dish.controller");

const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, "uploads/");
  },
  filename: function (req, file, cb) {
    cb(null, new Date().toISOString().replace(/:/g, "-") + file.originalname);
  },
});

const upload = multer({ storage: storage });

// AUTH

login_model(app);
register_model(app);
update_user_model(app);
get_info(app);

app.get(get_shop_list, getListShop);
app.post(create_dish, upload.array("images"), insertDish);
app.post(get_dish_list, selectAll);
app.post(delete_dish, deleteDish);
app.post(update_dish, upload.array("images"), updateDish);
app.post(notification_dish, getListOrdered);
app.post(create_order_dish, insertOrderDish);
app.post(update_order_dish, updateOrderDish);
app.post(select_orders_dish, selectOrderDish);
app.post(select_single_order_dish, selectSingleOrderDish);

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`);
});
