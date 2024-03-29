require("dotenv").config();

const express = require("express");
const cors = require("cors");
const router = require("./app/router");

const app = express();
const PORT = process.env.PORT || 3000;

app.use(cors());
app.use(express.urlencoded({ extended: true }));

app.use(router);
app.listen(PORT, () => {
  console.log("Le serveur est bien démaré sur http://localhost:${PORT}");
});
