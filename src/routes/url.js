import express from "express";
import { shortenUrl, getUrl, openUrl, deleteUrl } from './../controllers/urlsController.js';

const urlRouter = express.Router();

urlRouter.post('/urls/shorten', shortenUrl);
urlRouter.get('/urls/:id', getUrl);
urlRouter.get('/urls/open/:shortUrl', openUrl);
urlRouter.delete('/urls/:id', deleteUrl);

export default urlRouter;