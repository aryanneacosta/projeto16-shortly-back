import express from "express";
import { shortenUrl, getUrl, openUrl } from './../controllers/urlsController.js';

const urlRouter = express.Router();

urlRouter.post('/urls/shorten', shortenUrl);
urlRouter.get('/urls/:id', getUrl);
urlRouter.get('/urls/open/:shortUrl', openUrl);

export default urlRouter;