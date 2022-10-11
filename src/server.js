import express from 'express';
import dotenv from 'dotenv';
import cors from 'cors';

dotenv.config();

const server = express();

server.use(cors());
server.use(express.json());

server.listen(process.env.PORT, () => {
    console.log(`The listening port is ${process.env.PORT}`);
});