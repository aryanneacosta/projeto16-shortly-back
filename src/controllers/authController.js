import bcrypt from 'bcrypt';
import { v4 as uuid } from 'uuid';
import connection from './../databases/database.js'
import { signUpSchema, signInSchema } from './../schemas/usersSchema.js'

async function signUp(req, res) {
    const user = req.body;
    const passwordHash = bcrypt.hashSync(user.password, 10);

    try {
        const { error } = signUpSchema.validate(user);
        if (error !== undefined) {
            return res.status(422).send(error.details[0].message);
        }

        const emailExists = await connection.query('SELECT email FROM users WHERE email = $1', [user.email]);
        if (emailExists.rowCount !== 0) {
            return res.sendStatus(409);
        }

        await connection.query('INSERT INTO users (name, email, password) VALUES ($1, $2, $3)', [user.name, user.email, passwordHash]);
        res.sendStatus(201);
    } catch (error) {
        res.status(500).send(error.message);
    }
}

async function signIn(req, res) {
    const user = req.body;
    const { password } = req.body;

    try {
        const { error } = signInSchema.validate(user);
        if (error !== undefined) {
            return res.status(422).send(error.details[0].message);
        }

        const userExist = await connection.query('SELECT * FROM users WHERE email = $1', [user.email]);
        if (userExist.rowCount === 0) {
            return res.sendStatus(401);
        }

        const comparePassword = userExist.rows[0].password;
        const validPassword = bcrypt.compareSync(password, comparePassword);
        if (!validPassword) {
            return res.sendStatus(401);
        }

        const token = uuid();
        await connection.query('INSERT INTO sessions (user_id, token) VALUES ($1, $2)', [userExist.rows[0].id, token]);
        const sessionCreated = await connection.query('SELECT token FROM sessions WHERE token = $1', [token]);
        const sessionCreatedToken = sessionCreated.rows[0];
        res.status(200).send(sessionCreatedToken);

    } catch (error) {
        res.status(500).send(error.message);
    }
}

export { signUp, signIn };