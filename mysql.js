// Require necessary modules
const mysql = require('mysql2');
// Create a MySQL connection pool
const pool = mysql.createPool({
  host: '127.0.0.1',
  user: 'root',
  password: 'root',
  database: 'erp',
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0
});

// Function to retrieve data from MySQL
function fetchDataFromDB(callback) {
  pool.query('SELECT tprn,passwords FROM teacher', (err, results) => {
    if (err) {
      return callback(err, null);
    }
    callback(null, results);
  });
}
module.exports = { fetchDataFromDB };
