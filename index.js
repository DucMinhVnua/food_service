const { app, port } = require('./app.init')
const { login_model, register_model } = require('./models/auth.model')

// AUTH 

login_model(app);
register_model(app);

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`);
});
