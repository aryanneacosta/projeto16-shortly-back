import express from 'express';
import dotenv from 'dotenv';
import cors from 'cors';
import authRouter from './routes/auth.js';
import urlRouter from './routes/url.js';

dotenv.config();

const server = express();

server.use(cors());
server.use(express.json());
server.use(authRouter);
server.use(urlRouter);

server.listen(process.env.PORT, () => {
    console.log(`The listening port is ${process.env.PORT}`);
});