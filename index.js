const express= require('express');
const path=require('path');
const app= express();
const port=3000;
app.use( express.static('public'));
app.get("/",(req,res)=>{
    res.sendFile(path.join(__dirname,'dbms.html'));
});
app.get("/loginstaff",(req,res)=>{
    res.sendFile(path.join(__dirname,'loginstaff.html'));
});
app.get("/loginstudent",(req,res)=>{
    res.sendFile(path.join(__dirname,'loginstudent.html'));
});
//START THE SERVER
app.listen(port,()=>{
    console.log(`server started succesfully at http:\\localhost:${port}`);
});