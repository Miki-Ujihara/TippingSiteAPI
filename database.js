
const mariadb = require('mariadb');

const pool = mariadb.createPool({
    host: '127.0.0.1',
    port: 3306,
    user:'root',
    password: '1234',
    database: 'm254',
    connectionLimit: 5
});

// Expose a method to establish connection with MariaDB SkySQL
module.exports = Object.freeze({
    pool: pool
});
