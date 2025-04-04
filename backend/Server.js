const express = require('express');
const mysql = require('mysql');
const cors = require('cors');
const { preinitModule } = require('react-dom');
const app = express();

app.use(cors({
    origin: 'http://localhost:3000',
    methods: ['GET', 'POST', 'DELETE'] // Add allowed methods
}));

app.use(express.json()); // Middleware to parse JSON bodies

const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'root',
    database: 'saler12'
});

db.connect((err) => {
    if (err) {
        console.error("Database connection failed:", err);
        return;
    }
    console.log("Connected to the database.");
});

// Welcome route
app.get("/", (req, res) => {
    return res.json("Welcome to the API");
});

// Get all users
app.get("/api/users", (req, res) => {
    const sql = "SELECT * FROM user";
    db.query(sql, (err, data) => {
        if (err) {
            console.error("Error executing query:", err);
            return res.status(500).json({ error: "An error occurred" });
        }
        return res.json(data);
    });
});

// Get products for Apple brand
app.get("/api/products/apple", (req, res) => {
    const sql = `SELECT p.product_id, p.product_name, p.availability, p.price
                 FROM product AS p 
                 JOIN brandproduct AS bp ON p.product_id = bp.product_id 
                 JOIN brand AS b ON b.brand_id = bp.brand_id 
                 WHERE b.brand_name = 'Apple'`;
                 
    db.query(sql, (err, data) => {
        if (err) {
            console.error("Error executing query:", err);
            return res.status(500).json({ error: "An error occurred" });
        }
        return res.json(data);
    });
});

// Add a new product
app.post("/api/products", (req, res) => {

    const name = req.body.product_name;
    const brand = req.body.brand;
    const price = req.body.price;
    const availability = req.body.availability
    const product_id = req.body.product_id
    
    console.log(name)
    console.log(brand)
    console.log(price)
    console.log(availability)
    console.log(product_id)
    if (!name || !brand || price === undefined || !availability) {
        return res.status(400).json({ error: "All product details must be provided" });
    }

    const sql = "INSERT INTO product (product_name, brand, price, availability, product_id) VALUES (?, ?, ?, ?, ?)";
    db.query(sql, [name, brand, price, availability,product_id], (err, result) => {
        if (err) {
            console.error("Error adding product:", err);
            return res.status(500).json({ error: "An error occurred" });
        }
        const newProduct = {
            id: result.insertId,
            name,
            brand,
            price,
            availability
        };
        return res.status(201).json(newProduct);
    });
});

// Delete a product by ID
app.delete("/api/products/:id", (req, res) => {
    const productId = req.params.id;

    // Validate productId to ensure it’s a number
    if (isNaN(productId)) {
        return res.status(400).json({ error: "Invalid product ID" });
    }

    const sql = "DELETE FROM product WHERE product_id = ?";
    db.query(sql, [productId], (err, result) => {
        if (err) {
            console.error("Error deleting product:", err);
            return res.status(500).json({ error: "An error occurred" });
        }
        if (result.affectedRows === 0) {
            return res.status(404).json({ error: "Product not found" });
        }
        return res.status(204).send(); // No content
    });
});

app.listen(8081, () => {
    console.log("Server is running on port 8081");
});
