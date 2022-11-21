
const sql = require("../connection.mysql.js");

const getAll = (email, password, res) => {
    let query = `SELECT auth.*, coords.* FROM auth INNER JOIN coords ON auth.coord_id=coords.id WHERE auth.email="${email}" AND auth.password="${password}"`

    sql.query(query, (error_sql, rows) => {
        if (error_sql) {
            return res.status(404).send(error_sql);
        }

        if (rows.length <= 0) {
            return res.status(200).send({
                error: 1,
                messageError: "email or password not found!",
                data: [],
            });
        }

        return res.status(200).send({
            error: 0,
            messageError: "found account successfully!",
            data: {
                id: rows[0].id,
                user_name: rows[0].user_name,
                phone_number: rows[0].phone_number,
                address: rows[0].address,
                role: rows[0].role,
                coords: {
                    coord_id: rows[0].coord_id,
                    latitude: rows[0].latitude,
                    longitude: rows[0].longitude,
                },
            },
        });
    })
}

module.exports = getAll

module.exports.logName = () => {
    console.log("hello")
}
