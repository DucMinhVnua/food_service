const sql = require("../connection.mysql.js");

const Shop = function (tutorial) {
}

Shop.getList = (result) => {
    sql.query("SELECT auth.*, c.latitude, c.longitude FROM auth INNER JOIN coords c ON auth.coord_id=c.id WHERE role = ?", 0, (err, res) => {
        if (err) {
            result(err)
            return
        }

        result(null, res)
    })
}

module.exports = Shop