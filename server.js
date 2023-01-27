
const express = require('express')

const db = require('./database')
const app = express()
const port = 8080
const bodyParser = require("body-parser");

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));

// GET
app.get('/login', async (req, res) => {
    let username = req.query.username;
    let password = req.query.password;
    try {
        const result = await db.pool.query("select * from users where username = ? AND password = ?", [username, password]);
        res.send(result);
    } catch (err) {
    }
});

app.get('/allBets', async (req, res) => {
    try {
        const result = await db.pool.query("select * from bets where status='running'");
        res.send(result);
    } catch (err) {
    }
});

app.get('/bet', async (req, res) => {
    let id = req.query.id;
    try {
        const result = await db.pool.query("select * from bets where bet_id = ?", [id]);
        res.send(result);
    } catch (err) {
    }
});

app.get('/bettings', async (req, res) => {
    let uid = req.query.uid;
    try {
        const result = await db.pool.query("select * from bettings bs inner join bets b on bs.bet_fk = b.bet_id where bs.user_fk = ?", [uid]);
        res.send(result);
    } catch (err) {
    }
});

app.get('/user', async (req, res) => {
    let id = req.query.id;
    try {
        const result = await db.pool.query("select isAdmin from users where user_id = ?", [id]);
        res.send(result);
    } catch (err) {
    }
});

app.post('/register', async (req, res) => {
    try {
        const result = await db.pool.query("INSERT INTO users (username, password) values (?,?)", [req.body["username"], req.body["password"]]);
        res.send(req.body);
    } catch (err) {
    }
});

app.post('/createBetting', async (req, res) => {
    try {
        const result = await db.pool.query("INSERT INTO bettings (amount, user_fk, bet_fk, bet_for) values (?,?,?,(SELECT ? FROM bets where bet_id=?))", [req.body["amount"], req.body["uid"], req.body["bet_id"], req.body["team"], req.body["bet_id"]]);
        res.send(req.body);
    } catch (err) {
    }
});

app.post('/createBet', async (req, res) => {
    try {
        const result = await db.pool.query("INSERT INTO bets (category, team1, team2, status, startTime) values (?,?,?,?,?)", [req.body["cat"], req.body["t1"], req.body["t2"], "running", req.body["start"]]);
        res.send(req.body);
    } catch (err) {
    }
});

app.listen(port, () => console.log(`Listening on port ${port}`));
