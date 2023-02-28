-- Exercise 1

CREATE TABLE orders
(
    orderId      INT,
    date         DATE,
    customerId   INT,
    customerName VARCHAR(15),
    city         VARCHAR(15),
    itemId       INT,
    itemName     VARCHAR(15),
    quantity     INT,
    price        REAL,
    PRIMARY KEY (orderId, customerId, itemId)
);

INSERT INTO orders
VALUES ('2301', '2011-02-23', '101', 'Martin', 'Prague', '3786', 'Net', '3', '35.00');
INSERT INTO orders
VALUES ('2301', '2011-02-23', '101', 'Martin', 'Prague', '4011', 'Racket', '6', '65.00');
INSERT INTO orders
VALUES ('2301', '2011-02-23', '101', 'Martin', 'Prague', '9132', 'Pack-3', '8', '4.75');
INSERT INTO orders
VALUES ('2302', '2012-02-25', '107', 'Herman', 'Madrid', '5794', 'Pack-6', '4', '5.00');
INSERT INTO orders
VALUES ('2303', '2011-11-27', '110', 'Pedro', 'Moscow', '4011', 'Racket', '2', '65.00');
INSERT INTO orders
VALUES ('2303', '2011-11-27', '110', 'Pedro', 'Moscow', '3141', 'Cover', '2', '10.00');

-- Exercise 1a

CREATE TABLE cities
(
    cityId INT,
    city   VARCHAR(15),
    PRIMARY KEY (cityId)
);

CREATE TABLE items
(
    itemId   INT,
    itemName VARCHAR(15),
    price    REAL,
    PRIMARY KEY (itemId)
);

CREATE TABLE customers
(
    customerId   INT,
    customerName VARCHAR(15),
    cityId       INT,
    PRIMARY KEY (customerId),
    FOREIGN KEY (cityId) REFERENCES cities (cityId)
);

CREATE TABLE orders
(
    orderId    INT,
    date       DATE,
    customerId INT,
    itemId     INT,
    quantity   INT,
    PRIMARY KEY (orderId, customerId, itemId),
    FOREIGN KEY (customerId) REFERENCES customers (customerId),
    FOREIGN KEY (itemId) REFERENCES items (itemId)
);

INSERT INTO cities (cityId, city)
VALUES (1, 'Prague'),
       (2, 'Madrid'),
       (3, 'Moscow');

INSERT INTO customers (customerId, customerName, cityId)
VALUES (101, 'Martin', 1),
       (107, 'Herman', 2),
       (110, 'Pedro', 3);

INSERT INTO items (itemId, itemName, price)
VALUES (3786, 'Net', 35.00),
       (4011, 'Racket', 65.00),
       (9132, 'Pack-3', 4.75),
       (5794, 'Pack-6', 5.00),
       (3141, 'Cover', 10.00);

INSERT INTO orders (orderId, date, customerId, itemId, quantity)
VALUES (2301, '2011-02-23', 101, 3786, 3),
       (2301, '2011-02-23', 101, 4011, 6),
       (2301, '2011-02-23', 101, 9132, 8),
       (2302, '2012-02-25', 107, 5794, 4),
       (2303, '2011-11-27', 110, 4011, 2),
       (2303, '2011-11-27', 110, 3141, 2);

-- Exercise 1b

SELECT o.orderId, SUM(o.quantity) as total_items, SUM(o.quantity * i.price) as total_amount
FROM orders o
         JOIN items i ON o.itemId = i.itemId
GROUP BY o.orderId;

SELECT c.customerId, c.customerName, SUM(o.quantity * i.price) AS total_spent
FROM customers c
         JOIN orders o ON c.customerId = o.customerId
         JOIN items i ON o.itemId = i.itemId
GROUP BY c.customerId, c.customerName
ORDER BY total_spent DESC
LIMIT 1;
