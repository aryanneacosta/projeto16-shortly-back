import express from "express";
import { shortenUrl } from './../controllers/urlsController.js';

const urlRouter = express.Router();

urlRouter.post('/urls/shorten', shortenUrl);

export default urlRouter;