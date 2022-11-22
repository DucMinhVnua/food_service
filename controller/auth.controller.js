
const sql = require("../connection.mysql.js");

// GET INFO USER

const selectUser = (email, password, res) => {

    let query = `SELECT auth.*, coords.latitude, coords.longitude FROM auth LEFT JOIN coords ON auth.coord_id=coords.id WHERE auth.email="${email}" AND auth.password="${password}"`

    sql.query(query, (error_sql, rows) => {
        if (error_sql) {
            return res.status(404).send(error_sql);
        }

        if (rows.length <= 0) {
            return res.status(200).send({
                error: 1,
                error_message: "email or password not found!",
                data: [],
            });
        }

        return res.status(200).send({
            error: 0,
            error_message: "found account successfully!",
            data: {
                id: rows[0].id,
                user_name: rows[0].user_name,
                phone_number: rows[0].phone_number,
                address: rows[0].address,
                role: rows[0].role,
                coords: {
                    id: rows[0].coord_id,
                    latitude: rows[0].latitude,
                    longitude: rows[0].longitude,
                },
                avatar: rows[0].avatar
            },
        });
    })
}

// INSERT USER

const insertUser = (email, password, user_name, phone_number, role, address, avatar, latitude, longitude, res) => {

    const query_select_email = `SELECT * FROM auth WHERE email = '${email}'`

    // SELECT TO CHECK EMAIL EXISTS

    sql.query(query_select_email, async (err, rows) => {
        if (rows.length <= 0) {
            let query_insert_coords = `INSERT INTO coords (latitude, longitude) VALUE ("${latitude}", "${longitude}")`

            // INSERT COORDINATE

            sql.query(query_insert_coords, (error_sql) => {

                // GET LAST ROW OF COORDS TABLE

                const query_select_coords_last_row = `SELECT * FROM coords ORDER BY id DESC LIMIT 1;`
                sql.query(query_select_coords_last_row, (err, [row]) => {
                    // INSERT USER

                    if (!error_sql) {
                        let query_insert_user = `INSERT INTO auth (email, password, user_name, phone_number, role, address, avatar, coord_id) VALUES ("${email}","${password}","${user_name}","${phone_number}", "${role}", "${address}", "${avatar || 'https://jes.edu.vn/wp-content/uploads/2017/10/h%C3%ACnh-%E1%BA%A3nh.jpg'}", "${row.id}")`

                        sql.query(query_insert_user, (error_sql) => {
                            if (error_sql) {
                                return res.status(404).send({
                                    code: 1,
                                    error_sql
                                });
                            }

                            return res.status(200).send({
                                code: 0,
                                message: 'Insert user successfully!',
                                account_already_exists: false
                            })
                        })
                    }
                })


            })

        } else {
            res.status(200).send({
                code: 0,
                message: 'Account exists already!',
                account_already_exists: true
            })
        }
    })


}

// UPDATE USER

const updateUser = (id, coord_id, password, user_name, phone_number, address, avatar, latitude, longitude, res) => {

    let query_update_coords = `UPDATE coords SET latitude="${latitude}", longitude="${longitude}" WHERE id="${coord_id}"`

    // UPDATE COORDINATE

    sql.query(query_update_coords, (error_sql) => {
        if (!error_sql) {

            // UPDATE USER

            let query_update_user = `UPDATE auth SET password="${password}", user_name="${user_name}", phone_number="${phone_number}", address="${address}", avatar="${avatar || 'https://jes.edu.vn/wp-content/uploads/2017/10/h%C3%ACnh-%E1%BA%A3nh.jpg'}" WHERE id="${id}"`

            sql.query(query_update_user, (error_sql, rows) => {
                if (error_sql) {
                    res.status(200).send({
                        code: 1,
                        error_message: "update false: " + error_sql
                    })
                }

                res.status(200).send({
                    code: 0,
                    error_message: "update successful!"
                })
            })
        }
    })
}

module.exports = {
    selectUser,
    insertUser,
    updateUser
}
