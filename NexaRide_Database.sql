CREATE DATABASE nexaride_db;
USE nexaride_db;

CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(255),
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL,
    mobile_no VARCHAR(10) NOT NULL
);

CREATE TABLE bookings (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    booking_type ENUM('one way', 'two way', 'tourism') NOT NULL,
    bus_type ENUM('ac', 'non-ac', 'ac-sleeper') NOT NULL,
    from_location VARCHAR(100),
    to_location VARCHAR(100),
    date_of_journey DATE,
    return_from VARCHAR(100),
    return_to VARCHAR(100),
    return_date DATE,
    tourism_place VARCHAR(100),
    number_of_days INT,
    number_of_persons INT NOT NULL,
    total_price INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE passengers (
    passenger_id INT AUTO_INCREMENT PRIMARY KEY,
    booking_id INT,
    name VARCHAR(100) NOT NULL,
    age INT NOT NULL,
    address VARCHAR(255),
    mobile_no VARCHAR(10),
    email_id VARCHAR(100),
    aadhaar_no CHAR(12) NOT NULL,
    FOREIGN KEY (booking_id) REFERENCES bookings(booking_id)
);

CREATE TABLE payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    booking_id INT,
    payment_mode ENUM('upi', 'netbanking', 'debit card', 'credit card') NOT NULL,
    amount INT NOT NULL,
    payment_status ENUM('done', 'cancelled') DEFAULT 'done',
    FOREIGN KEY (booking_id) REFERENCES bookings(booking_id)
);

CREATE TABLE tickets (
    ticket_id INT AUTO_INCREMENT PRIMARY KEY,
    passenger_id INT,
    booking_id INT,
    seat_no VARCHAR(10),
    issue_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (passenger_id) REFERENCES passengers(passenger_id),
    FOREIGN KEY (booking_id) REFERENCES bookings(booking_id)
);

INSERT INTO users (name, address, email, password, mobile_no) VALUES
('Rahul Sharma', 'HYD', 'rahul.sharma@email.com', 'hashedpassword1', '9876543210'),
('Arun Kumar', 'AP', 'arun.kumar@email.com', 'hashedpassword2', '9087654321'),
('Kiran Reddy', 'DELHI', 'kiran.reddy@email.com', 'hashedpassword3', '9000000111'),
('Varun Singh', 'MUMBAI', 'varun.singh@email.com', 'hashedpassword4', '9123456780'),
('Prasad Joshi', 'Bangalore', 'prasad.joshi@email.com', 'hashedpassword5', '9988776655');

INSERT INTO bookings (user_id, booking_type, bus_type, from_location, to_location, date_of_journey, 
                     return_from, return_to, return_date, tourism_place, number_of_days, number_of_persons, total_price)
VALUES
(1, 'one way', 'ac', 'HYD', 'Vijayawada', '2024-08-10', NULL, NULL, NULL, NULL, NULL, 2, 1200),
(2, 'two way', 'non-ac', 'AP', 'Vizag', '2024-08-16', 'Vizag', 'AP', '2024-08-18', NULL, NULL, 3, 1800),
(3, 'tourism', 'ac-sleeper', NULL, NULL, NULL, NULL, NULL, NULL, 'Goa', 4, 4, 10000),
(4, 'one way', 'ac', 'MUMBAI', 'Pune', '2024-08-12', NULL, NULL, NULL, NULL, NULL, 1, 800),
(5, 'two way', 'ac-sleeper', 'Bangalore', 'Mysore', '2024-08-14', 'Mysore', 'Bangalore', '2024-08-15', NULL, NULL, 5, 3000);

INSERT INTO passengers (booking_id, name, age, address, mobile_no, email_id, aadhaar_no) VALUES
(1, 'Rahul', 30, 'HYD', '9876543210', 'rahul@email.com', '123456789012'),
(2, 'Arun', 27, 'AP', '9087654321', 'arun@email.com', '234567890123'),
(2, 'Kiran', 32, 'DELHI', '9000000111', 'kiran@email.com', '345678901234'),
(3, 'Varun', 29, 'MUMBAI', '9123456780', 'varun@email.com', '456789012345'),
(4, 'Prasad', 22, 'Bangalore', '9988776655', 'prasad@email.com', '567890123456');

INSERT INTO payments (booking_id, payment_mode, amount, payment_status) VALUES
(1, 'upi', 1200, 'done'),
(2, 'netbanking', 1800, 'done'),
(3, 'debit card', 10000, 'done'),
(4, 'credit card', 800, 'done'),
(5, 'upi', 3000, 'done');

INSERT INTO tickets (passenger_id, booking_id, seat_no) VALUES
(1, 1, 'A1'),
(2, 2, 'B1'),
(3, 2, 'B2'),
(4, 3, 'C1'),
(5, 4, 'D1');

SELECT * FROM users;
SELECT * FROM bookings;
SELECT * FROM passengers;
SELECT * FROM payments;
SELECT * FROM tickets;

SELECT b.booking_id, u.name AS user_name, b.booking_type, b.bus_type, b.from_location, b.to_location, b.date_of_journey, b.total_price
FROM bookings b
JOIN users u ON b.user_id = u.user_id;

SELECT p.passenger_id, p.name AS passenger_name, b.booking_id, b.from_location, b.to_location, b.date_of_journey
FROM passengers p
JOIN bookings b ON p.booking_id = b.booking_id;

SELECT pay.payment_id, u.name AS user_name, b.booking_id, pay.payment_mode, pay.amount, pay.payment_status
FROM payments pay
JOIN bookings b ON pay.booking_id = b.booking_id
JOIN users u ON b.user_id = u.user_id;

SELECT t.ticket_id, p.name AS passenger_name, b.from_location, b.to_location, t.seat_no, t.issue_date
FROM tickets t
JOIN passengers p ON t.passenger_id = p.passenger_id
JOIN bookings b ON t.booking_id = b.booking_id;






