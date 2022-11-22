const { login_route, register_route, update_user_route } = require('../Routes/auth.route')
const { selectUser, insertUser, updateUser } = require('../controller/auth.controller')

module.exports = {
    login_model: (app) => app.post(login_route, (req, res) => {
        const { email, password } = req.body;

        if (!email || !password) {
            return res.status(403).send({
                error: 1,
                error_message: 'Check again your body data!'
            })
        }

        selectUser(email, password, res)
    }),

    register_model: (app) => app.post(register_route, (req, res) => {
        const { email, password, user_name, phone_number, role, address, avatar, latitude, longitude } = req.body

        insertUser(email, password, user_name, phone_number, role, address, avatar, latitude, longitude, res)
    }),

    update_user_model: (app) => app.post(update_user_route, (req, res) => {
        const { id, coord_id, password, user_name, phone_number, address, avatar, latitude, longitude } = req.body

        updateUser(id, coord_id, password, user_name, phone_number, address, avatar, latitude, longitude, res)
    })
}