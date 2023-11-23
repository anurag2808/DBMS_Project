const http = require('http');
const fs=require('fs');
const { start } = require('repl');
const hostname = '127.0.0.1';
const port = 3000;
const dbms=fs.readFileSync('./dbms.html');
const loginstudent=fs.readFileSync('./loginstudent.html');
const loginstaff=fs.readFileSync('./loginstaff.html');
const server = http.createServer((req, res) => {
  res.statusCode = 200;
  let url=req.url;
  link.rel='stylesheet';
  res.setHeader('Content-Type', 'text/html');
  link.href='style.css';
  if(url =='/')
  {
      res.end(dbms);
  }
  else if(url =='/loginstudent')
  {
      res.end(loginstudent);
  }
 else if(url =='/loginstaff')
  {
      res.end(loginstaff);
  }
  else{
    res.end("<h1>page not found</h1>");
    res.statusCode=404;
    
  }
});
server.listen(port, hostname, () => {
  console.log(`Server running at http://${hostname}:${port}/`);
});