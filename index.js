const express= require('express');
const path=require('path');
const app= express();
const port=3000;
app.use( express.static('public'));
app.use(express.urlencoded({ extended: true }));
app.use(express.json());
app.get("/",(req,res)=>{
    res.sendFile(path.join(__dirname,'dbms.html'));
});
app.get("/loginstaff",(req,res)=>{
    res.sendFile(path.join(__dirname,'loginstaff.html'));
});
app.get("/loginstudent",(req,res)=>{
    res.sendFile(path.join(__dirname,'loginstudent.html'));
   
});
app.post("/loginstudent",(req,res)=>{
    console.log(req.body);
    res.sendFile(path.join(__dirname,'student.html'));
   
});
app.get("/mysql",(req,res)=>{
  res.send("hello");
});
app.post("/loginstaff",(req,res)=>{
    console.log(req.body);
    res.sendFile(path.join(__dirname,'staff.html'));
})

//START THE SERVER
app.listen(port,()=>{
    console.log(`server started succesfully at http:\\localhost:${port}`);
});
