const express = require("express");
const mongoose = require("mongoose");
const authRouter = require("./routes/auth");

const PORT = 3000;
const app = express();
const url = "";

app.use(express.json());
app.use(authRouter);

mongoose.connect(url).then(() => {
    console.log("Connection Successful");
}).catch((error => {
    console.log(error);
}));

app.listen(
    PORT,
    "0.0.0.0",
    () => {
    console.log(`connected at port ${PORT}`);
    }
);