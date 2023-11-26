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
const name = (prn) => {
  return new Promise((resolve, reject) => {
    pool.query(`SELECT fname,lname FROM teacher where tprn=${prn}`, (err, results) => {
      if (err) {
        reject(err); // Reject the promise if there's an error
      } else {
        resolve(results); // Resolve the promise with the results array
      }
    });
  });
};
module.exports = { fetchDataFromDB,name};
