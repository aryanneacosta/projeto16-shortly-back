import express from "express";
import { user, ranking } from './../controllers/usersController.js';

const userRouter = express.Router();

userRouter.get('/users/me', user);
userRouter.get('/ranking', ranking);

export default userRouter;