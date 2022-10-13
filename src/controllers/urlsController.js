import { nanoid } from 'nanoid';
import connection from './../databases/database.js';
import { urlSchema } from '../schemas/urlsSchema.js';

async function shortenUrl(req, res) {
    const { authorization } = req.headers;
    const token = authorization?.replace('Bearer ', '');
    const { url } = req.body;

    if(!token) {
        return res.sendStatus(401);
    }

    try {
        const session = await connection.query('SELECT * FROM sessions WHERE token = $1', [token]);
        if(session.rowCount === 0) {
            return res.sendStatus(401);
        }

        const { error } = urlSchema.validate(url);
        if (error !== undefined) {
            return res.status(422).send(error.details[0].message);
        }
        
        const userId = session.rows[0].user_id;
        const shortUrl = nanoid();
        
        await connection.query('INSERT INTO urls (user_id, url, short_url) VALUES ($1, $2, $3)', [userId, url, shortUrl]);

        const urlShortened = await connection.query('SELECT * FROM urls WHERE short_url = $1', [shortUrl]);

        const urlId = urlShortened.rows[0].id;
        const shortUrlAdded = urlShortened.rows[0].short_url;

        await connection.query('INSERT INTO visits (url_id) VALUES ($1)', [urlId]);
        res.status(201).send(shortUrlAdded);
    } catch (error) {
        res.status(500).send(error.message);
    }
}

export { shortenUrl };