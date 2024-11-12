const express = require('express');
const mysql = require('mysql');
const cors = require('cors');
const app = express();

app.use(cors({
    origin: 'http://localhost:3000' // Adjust the origin to match your React app's URL
  }));
  

const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'tanayk1103',
    database: 'saler3'
});

db.connect((err) => {
    if (err) {
        console.error("Database connection failed:", err);
        return;
    }
    console.log("Connected to the database.");
});

app.get("/", (req, res) => {
    return res.json("Welcome to the API");
});

app.get("/user", (req, res) => {
    const sql = "SELECT * FROM user";
    db.query(sql, (err, data) => {
        if (err) {
            console.error("Error executing query:", err);
            return res.status(500).json({ error: "An error occurred" });
        }
        return res.json(data);
    });
});

app.listen(8081, () => {
    console.log("Server is running on port 8081");
});
