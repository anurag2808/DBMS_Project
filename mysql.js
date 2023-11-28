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
function studentlogin(callback) {
  pool.query('SELECT sprn,passwords FROM student', (err, results) => {
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
const staff1 = (prn) => {
  return new Promise((resolve, reject) => {
    pool.query(`SELECT panel_name,day FROM timetable where tprn=${prn}` , (err, results) => {
      if (err) {
        reject(err); // Reject the promise if there's an error
      } else {
        resolve(results); // Resolve the promise with the results array
      }
    });
  });
};
const namestudent = (prn) => {
  return new Promise((resolve, reject) => {
    pool.query(`SELECT fname,lname FROM student where sprn=${prn}`, (err, results) => {
      if (err) {
        reject(err); // Reject the promise if there's an error
      } else {
        resolve(results); // Resolve the promise with the results array
      }
    });
  });
};
const attendence = (prn) => {
  return new Promise((resolve, reject) => {
    pool.query(`select * from attendance where tprn=${prn}`, (err, results) => {
      if (err) {
        reject(err); // Reject the promise if there's an error
      } else {
        resolve(results); // Resolve the promise with the results array
      }
    });
  });
};
const attendence_mark = (prn1,prn2,st) => {
  return new Promise((resolve, reject) => {
    pool.query(`call update_att3(${prn1},${prn2},"${st}")`, (err, results) => {
      if (err) {
        reject(err); // Reject the promise if there's an error
      } else {
        resolve(results); // Resolve the promise with the results array
      }
    });
  });
};
module.exports = { fetchDataFromDB,name,staff1,studentlogin,namestudent,attendence,attendence_mark};
