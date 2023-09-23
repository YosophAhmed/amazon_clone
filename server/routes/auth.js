const express = require("express");

const authRouter = express.Router();

authRouter.get(
    "/user",
    (request,response) => {
    response.json({
    message: "Yosoph"
    });
    }
);

module.exports = authRouter;