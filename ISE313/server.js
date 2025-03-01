const express = require('express');
const mysql = require('mysql');
const bodyParser = require('body-parser');
const app = express();
const path = require('path');

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.static(path.join(__dirname, 'public')));

// Default route to serve the mainpage.html
app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, 'public', 'mainpage.html'));
});

const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '90664929',
    database: 'perfume'
});

db.connect((err) => {
    if (err) throw err;
    console.log('MySQL connected...');
});

// Fetch products for the "ForWomen" page
app.get('/products/forWomen', (req, res) => {
    const query = 'SELECT name, img_url FROM products WHERE category_id = 1';  // Assuming your table has these columns

    db.query(query, (err, results) => {
        if (err) {
            console.error(err);
            return res.status(500).send('Error fetching products');
        }
        res.json(results);  // Send products as JSON
    });
});

// Fetch products for the "ForMen" page
app.get('/products/forMen', (req, res) => {
    const query = 'SELECT name, img_url FROM products WHERE category_id = 2';  // Assuming your table has these columns

    db.query(query, (err, results) => {
        if (err) {
            console.error(err);
            return res.status(500).send('Error fetching products');
        }
        res.json(results);  // Send products as JSON
    });
});

// Fetch products for the "ForUnisex" page
app.get('/products/forUnisex', (req, res) => {
    const query = 'SELECT name, img_url FROM products WHERE category_id = 3';  // Assuming your table has these columns

    db.query(query, (err, results) => {
        if (err) {
            console.error(err);
            return res.status(500).send('Error fetching products');
        }
        res.json(results);  // Send products as JSON
    });
});

const PORT = 3000;
app.listen(PORT, () => console.log(`Server running on http://localhost:${PORT}`));