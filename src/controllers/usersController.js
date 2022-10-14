import connection from './../databases/database.js';

async function user(req, res) {
    const { authorization } = req.headers;
    const token = authorization?.replace('Bearer ', '');

    if(!token) {
        return res.sendStatus(401);
    }

    try {
        const session = await connection.query('SELECT * FROM sessions WHERE token = $1', [token]);
        if(session.rowCount === 0) {
            return res.sendStatus(401);
        }

        const userTokenId = session.rows[0].user_id;
        const userExist = await connection.query('SELECT id FROM users WHERE id = $1', [userTokenId]);
        if(userExist.rowCount === 0) {
            return res.sendStatus(404);
        }

        const userInfo = (await connection.query('SELECT users.id AS id, users.name AS name, SUM(visits.visit_count) AS "visitCount" FROM users JOIN urls ON users.id = urls.user_id JOIN visits ON urls.id = visits.url_id GROUP BY users.id, users.name')).rows[0];
        const shortenedUrlsInfo = (await connection.query('SELECT urls.id AS id, urls.short_url AS "shortUrl", urls.url AS url, visits.visit_count AS "visitCount" FROM urls JOIN visits ON urls.id = visits.url_id')).rows;

        res.status(200).send({
            id: userInfo.id,
            name: userInfo.name,
            visitCount: userInfo.visitCount,
            shortenedUrls: shortenedUrlsInfo
        })
    } catch (error) {
        res.status(500).send(error.message);
    }
        
}

async function ranking(req, res) {

}

export { user, ranking};