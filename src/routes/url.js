import express from "express";
import { shortenUrl, getUrls } from './../controllers/urlsController.js';

const urlRouter = express.Router();

urlRouter.post('/urls/shorten', shortenUrl);
urlRouter.get('/urls/:id', getUrls);

export default urlRouter;