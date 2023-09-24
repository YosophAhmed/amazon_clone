const express = require("express");
const User = require("../models/user");
const bcryptjs = require('bcryptjs');


const authRouter = express.Router();

authRouter.post('/api/signup', async (request, response) => {
    try{
        const {name, email, password} = request.body;
            const existingUser = await User.findOne({email});
            if(existingUser) {
                return response.status(400).json({message: 'User with same email already exists'});
            }
            const hashedPassword = await bcryptjs.hash(password, 8);
            let user = new User({
                email,
                password: hashedPassword,
                name,
            });
            user = await user.save();
            response.json(user);
    } catch (error) {
        response.status(500).json({error: error.message});
    }

});

module.exports = authRouter;