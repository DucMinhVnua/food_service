const { login_route, register_route } = require('../Routes/auth.route')
const getAll = require('../controller/auth.controller')

module.exports = {
    register_model: (app) => app.post(register_route, (req, res) => {
        res.status(200).send({
            name: "Welcome",
        });
    }),
    login_model: (app) => app.post(login_route, (req, res) => {
        const { email, password } = req.body;
        getAll(email, password, res)
    })
}