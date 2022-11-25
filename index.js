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
} = require("./Routes/dish.route");
const { getListShop } = require("./controller/auth.controller");
const {
  insertDish,
  selectAll,
  deleteDish,
  updateDish,
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
app.get(get_dish_list, selectAll);
app.post(delete_dish, deleteDish);
app.post(update_dish, upload.array("images"), updateDish);

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`);
});
