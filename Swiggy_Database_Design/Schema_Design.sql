create database swiggy;
show databases;
use swiggy;

CREATE TABLE Users (
    u_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15) UNIQUE,
    password TEXT,
    address TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Restaurants (
    r_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(15),
    address TEXT,
    cuisine_type VARCHAR(100),
    rating DECIMAL(2,1),
    opening_time TIME,
    closing_time TIME,
    is_open BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Menu (
    item_id INT PRIMARY KEY AUTO_INCREMENT,
    r_id INT,
    name VARCHAR(100),
    description TEXT,
    price DECIMAL(10,2),
    category VARCHAR(50),  
    is_available BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (r_id) REFERENCES Restaurants(r_id)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    u_id INT,
    r_id INT,
    total_amount DECIMAL(10,2),
    order_status VARCHAR(20), 
    placed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    delivered_at TIMESTAMP NULL,
    FOREIGN KEY (u_id) REFERENCES Users(u_id),
    FOREIGN KEY (r_id) REFERENCES Restaurants(r_id)
);

CREATE TABLE DeliveryAgents (
    agent_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    phone VARCHAR(15),
    current_status VARCHAR(20), 
    assigned_area VARCHAR(100)
);

CREATE TABLE Payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    u_id INT,
    amount DECIMAL(10,2),
    payment_method VARCHAR(50), 
    payment_status VARCHAR(20),
    paid_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (u_id) REFERENCES Users(u_id)
);

CREATE TABLE Reviews (
    review_id INT PRIMARY KEY AUTO_INCREMENT,
    u_id INT,
    r_id INT,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    comment TEXT,
    review_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (u_id) REFERENCES Users(u_id),
    FOREIGN KEY (r_id) REFERENCES Restaurants(r_id)
);


show tables;

