require("dotenv").config();

const {
  login_route,
  register_route,
  update_user_route,
  get_info_user,
} = require("../Routes/auth.route");
const {
  selectUser,
  insertUser,
  updateUser,
  getInfoUser,
} = require("../controller/auth.controller");

const multer = require("multer");
const { app } = require("../app.init");

const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, "uploads/");
  },
  filename: function (req, file, cb) {
    cb(null, new Date().toISOString().replace(/:/g, "-") + file.originalname);
  },
});

const upload = multer({ storage: storage });

module.exports = {
  login_model: (app) =>
    app.post(login_route, (req, res) => {
      const { email, password } = req.body;

      if (!email || !password) {
        return res.status(403).send({
          error: 1,
          error_message: "Check again your body data!",
        });
      }

      selectUser(email, password, res);
    }),

  register_model: (app) =>
    app.post(register_route, (req, res) => {
      const {
        email,
        password,
        user_name,
        phone_number,
        role,
        address,
        avatar,
        latitude,
        longitude,
        description,
      } = req.body;

      insertUser(
        email,
        password,
        user_name,
        phone_number,
        role,
        address,
        avatar,
        latitude,
        longitude,
        description,
        res
      );
    }),

  update_user_model: (app) =>
    app.post(update_user_route, upload.single("avatar"), (req, res) => {
      const {
        id,
        coord_id,
        password,
        user_name,
        phone_number,
        address,
        latitude,
        longitude,
      } = req.body;

      const avatar = req.file
        ? `${process.env.IP}/uploads/${req.file.filename}`
        : null;

      updateUser(
        id,
        coord_id,
        password,
        user_name,
        phone_number,
        address,
        avatar,
        latitude,
        longitude,
        res
      );
    }),

  get_info: (app) =>
    app.post(get_info_user, (req, res) => {
      const { id } = req.body;
      if (id) {
        getInfoUser(id, res);
      }
    }),
};
