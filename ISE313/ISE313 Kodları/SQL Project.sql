CREATE DATABASE perfume;
USE perfume;

CREATE TABLE Users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE Categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE Products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    category_id INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL,
    FOREIGN KEY (category_id) REFERENCES Categories(id)
);

CREATE TABLE Favorites (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    product_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(id),
    FOREIGN KEY (product_id) REFERENCES Products(id),
    UNIQUE(user_id, product_id) -- Aynı kullanıcı için aynı ürün birden fazla kez favoriye eklenmesin
);

INSERT INTO categories (id, name)
VALUES (1, "Kadın"),
(2, "Erkek"),
(3, "Unisex");

INSERT INTO Products (name, category_id, price, stock)
VALUES
('Velvet Blossom 50ML', 1, 45.99, 20),
('Velvet Blossom 100ML', 1, 65.99, 15),
('Moonlight Petal 50ML', 1, 49.99, 18),
('Moonlight Petal 100ML', 1, 69.99, 12),
('Rose Amour 50ML', 1, 55.99, 10),
('Rose Amour 100ML', 1, 75.99, 8),
('Golden Serenade 50ML', 1, 59.99, 8),
('Golden Serenade 100ML', 1, 79.99, 5),
('Whispering Lily 50ML', 1, 50.99, 12),
('Whispering Lily 100ML', 1, 70.99, 10),
('Midnight Grace 50ML', 1, 60.99, 10),
('Midnight Grace 100ML', 1, 80.99, 7),

('Iron Voyage 50ML', 2, 40.99, 20),
('Iron Voyage 100ML', 2, 60.99, 15),
('Stormwood 50ML', 2, 45.99, 18),
('Stormwood 100ML', 2, 65.99, 12),
('Amber Horizon 50ML', 2, 50.99, 15),
('Amber Horizon 100ML', 2, 70.99, 10),
('Shadow Steel 50ML', 2, 55.99, 10),
('Shadow Steel 100ML', 2, 75.99, 8),
('Noble Drift 50ML', 2, 60.99, 12),
('Noble Drift 100ML', 2, 80.99, 9),
('Arctic Ember 50ML', 2, 65.99, 8),
('Arctic Ember 100ML', 2, 85.99, 6),

('Ocean Mist 50ML', 3, 50.99, 25),
('Ocean Mist 100ML', 3, 70.99, 20),
('Sandalwood Dawn 50ML', 3, 55.99, 20),
('Sandalwood Dawn 100ML', 3, 75.99, 15),
('Mystic Echo 50ML', 3, 60.99, 18),
('Mystic Echo 100ML', 3, 80.99, 12),
('Urban Glow 50ML', 3, 65.99, 15),
('Urban Glow 100ML', 3, 85.99, 10),
('Forest Breeze 50ML', 3, 70.99, 10),
('Forest Breeze 100ML', 3, 90.99, 8),
('Pure Eclipse 50ML', 3, 75.99, 8),
('Pure Eclipse 100ML', 3, 95.99, 5);

ALTER TABLE Users
ADD username VARCHAR(255);

ALTER TABLE products ADD img_url VARCHAR(255);

ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '90664929';
FLUSH PRIVILEGES;