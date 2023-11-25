const mysql = require('mysql');

// Create connection
const connection = mysql.createConnection({
  host: '127.0.0.1',
  user: 'root',
  password: 'root',
  database: 'erp',
  port: '3306' // If different from default port 3306
});

// Connect to MySQL
connection.connect((err) => {
  if (err) {
    console.error('Error connecting to MySQL:', err);
    return;
  }
  console.log('Connected to MySQL!');
});
const prn= '10412023';

// Perform queries or operations
export function login(p){
connection.query(`SELECT * FROM teacher where tprn=${p}`, (error, results, fields) => {
  if (error) throw error;
  console.log(results);
  })};
  login(prn);
// Close the connection
connection.end();