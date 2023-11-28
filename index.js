const express = require('express');
const path = require('path');
const app = express();
const port = 3000;
const mysqlFunctions = require('./mysql');
let tprn;
let sprn;
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
    sprn=req.body.PRN;
    let pass=req.body.password;
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
                    else if (key == 'sprn') {
                        if (entry[key] == sprn) {
                            c++;
                        }
                    }

                }
                if (c == 2) {
                    res.sendFile(path.join(__dirname, 'student.html'));
                }
            }
            return c;
        });
    }
    mysqlFunctions.studentlogin(handleData);

});
app.post("/loginstaff", (req, res) => {
    tprn = req.body.PRN;
    let pass = req.body.password;
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
                        if (entry[key] == tprn) {
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
app.get("/name",(req,res)=>{
    mysqlFunctions.name(tprn)
    .then((results) => {
        res.json(results) 
      })
      .catch((err) => {
        console.error('Error:', err);
      });
})
app.get("/namestudent",(req,res)=>{
    mysqlFunctions.namestudent(sprn)
    .then((results) => {
        res.json(results) 
      })
      .catch((err) => {
        console.error('Error:', err);
      });
})
app.get("/timetable",(req,res)=>{
    mysqlFunctions.staff1(tprn)
    .then((results) => {
        res.json(results) 
      })
      .catch((err) => {
        console.error('Error:', err);
      });
})
app.get("/att",(req,res)=>{
    mysqlFunctions.attendence(tprn)
    .then((results) => {
        res.json(results) 
      })
      .catch((err) => {
        console.error('Error:', err);
      });
})

//START THE SERVER
app.listen(port, () => {
    console.log(`server started succesfully at http:\\localhost:${port}`);
});
