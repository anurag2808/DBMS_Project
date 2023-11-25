const express = require('express');
const path = require('path');
const app = express();
const port = 3000;
const mysqlFunctions = require('./mysql');
app.use(express.static('public'));
app.use(express.urlencoded({ extended: true }));
app.use(express.json());
app.get("/", (req, res) => {
    res.sendFile(path.join(__dirname, 'dbms.html'));
});
app.get("/loginstaff", (req, res) => {
    res.sendFile(path.join(__dirname, 'loginstaff.html'));
});
app.get("/loginstudent", (req, res) => {
    res.sendFile(path.join(__dirname, 'loginstudent.html'));

});
app.post("/loginstudent", (req, res) => {
    console.log(req.body);
    res.sendFile(path.join(__dirname, 'student.html'));

});
app.post("/loginstaff", (req, res) => {
    let prn = req.body.PRN;
    let pass = req.body.password;
    let count;
    const handleData = (err, data) => {
        if (err) {
            console.error('Error fetching data:', err);
            return;
        }
        data.forEach((entry, index) => {
            var c = 0;
            for (const key in entry) {
                if (Object.prototype.hasOwnProperty.call(entry, key)) {
                    if (key == 'passwords') {
                        if (entry[key] == pass) {
                            c++;
                        }
                    }
                    else if (key == 'tprn') {
                        if (entry[key] == prn) {
                            c++;
                        }
                    }

                }
                if (c == 2) {
                    res.sendFile(path.join(__dirname, 'staff.html'));
                }
            }
            return c;
        });
    }
    mysqlFunctions.fetchDataFromDB(handleData);
})

//START THE SERVER
app.listen(port, () => {
    console.log(`server started succesfully at http:\\localhost:${port}`);
});
