CREATE TABLE categories (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
);

CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category_id INT REFERENCES categories(category_id) ON DELETE SET NULL
);

INSERT INTO categories (category_name)
VALUES 
('Elektronika'),
('Oziq-ovqat'),
('Kiyim-kechak'),
('Kitoblar'),
('Sport narsalari');

INSERT INTO products (product_name, category_id)
VALUES
('Smartfon', 1),
('Noutbuk', 1),
('Kamera', 1),
('Non', 2),
('Sut', 2),
('Kurtka', 3),
('Ko\ylak', 3),
('Roman kitobi', 4),
('Oquv kitobi', 4),
('Top', 5),
('Velosiped', 5),
('Telefon qopqog', NULL),
('Televizor', NULL),
('Shampun', NULL),
('Stol', NULL);


SELECT c.category_name, p.product_name
FROM categories c
JOIN products p ON c.category_id = p.category_id;


SELECT category_name
FROM categories
WHERE category_id IN (SELECT category_id FROM products);

SELECT category_name
FROM categories
WHERE category_id NOT IN (SELECT category_id FROM products);


SELECT product_name
FROM products
WHERE category_id IS NOT NULL;

SELECT product_name
FROM products
WHERE category_id IS NULL;

SELECT * FROM categories;
SELECT * FROM products;

SELECT * FROM categories
WHERE category_id NOT IN (SELECT category_id FROM products);

SELECT * FROM products
WHERE category_id IS NULL;

SELECT c.category_name, p.product_name
FROM categories c
CROSS JOIN products p;

SELECT *
FROM categories
NATURAL JOIN products;

CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    employee_name VARCHAR(100) NOT NULL,
    manager_id INT REFERENCES employees(employee_id)
);

INSERT INTO employees (employee_name, manager_id)
VALUES
('Ali', NULL),
('Vali', 1),
('Olim', 1),
('Karim', 2),
('Sardor', 2);

SELECT e1.employee_name AS Employee, e2.employee_name AS Manager
FROM employees e1
LEFT JOIN employees e2 ON e1.manager_id = e2.employee_id;

CREATE TABLE movies (
    movie_id SERIAL PRIMARY KEY,
    movie_name VARCHAR(100) NOT NULL
);

CREATE TABLE actors (
    actor_id SERIAL PRIMARY KEY,
    actor_name VARCHAR(100) NOT NULL
);

CREATE TABLE movie_actors (
    movie_id INT REFERENCES movies(movie_id) ON DELETE CASCADE,
    actor_id INT REFERENCES actors(actor_id) ON DELETE CASCADE,
    PRIMARY KEY (movie_id, actor_id)
);

INSERT INTO movies (movie_name)
VALUES 
('Avatar'),
('Titanik'),
('Baghi');

INSERT INTO actors (actor_name)
VALUES 
('Leonardo DiCaprio'),
('Kate Winslet'),
('Sam Worthington'),
('Joseph Gordon-Levitt');

INSERT INTO movie_actors (movie_id, actor_id)
VALUES
(1, 3),
(2, 1),
(2, 2),
(3, 1),
(3, 4);

SELECT m.movie_name, a.actor_name
FROM movies m
JOIN movie_actors ma ON m.movie_id = ma.movie_id
JOIN actors a ON ma.actor_id = a.actor_id;

SELECT a.actor_name, m.movie_name
FROM actors a
JOIN movie_actors ma ON a.actor_id = ma.actor_id
JOIN movies m ON ma.movie_id = m.movie_id;
