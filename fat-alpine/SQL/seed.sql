-- Create the CRYPTO_SE database
CREATE DATABASE IF NOT EXISTS CRYPTO_SE;
CREATE DATABASE IF NOT EXISTS BANKING;
CREATE DATABASE IF NOT EXISTS STOCK_EXCHANGE;

-- Use the CRYPTO_SE database
USE CRYPTO_SE;

-- Create the customers table
CREATE TABLE IF NOT EXISTS customers (
    id INTEGER PRIMARY KEY,
    name TEXT,
    email TEXT,
    phone TEXT
);

-- Create the accounts table
CREATE TABLE IF NOT EXISTS accounts (
    id INTEGER PRIMARY KEY,
    customer_id INTEGER,
    name TEXT,
    balance_usd REAL,
    balance_btc REAL,
    balance_eth REAL,
    balance_usdt REAL,
    balance_doge REAL,
    balance_xrp REAL,
    balance_ada REAL,
    balance_solana REAL,
    FOREIGN KEY (customer_id) REFERENCES customers (id)
);

-- Create the order_book table
CREATE TABLE IF NOT EXISTS order_book (
    id INTEGER PRIMARY KEY,
    account_id INTEGER,
    symbol TEXT,
    quantity REAL,
    price REAL,
    FOREIGN KEY (account_id) REFERENCES accounts (id)
);

-- Insert sample data into customers table
INSERT INTO customers (name, email, phone) VALUES
    ('John Doe', 'john@example.com', '123-456-7890'),
    ('Jane Smith', 'jane@example.com', '987-654-3210');

-- Insert sample data into accounts table
INSERT INTO accounts (customer_id, name, balance_usd, balance_btc, balance_eth, balance_usdt, balance_doge, balance_xrp, balance_ada, balance_solana) VALUES
    (1, 'ACC001', 10000, 2.5, 5, 15000, 100000, 5000, 10000, 20000),
    (2, 'ACC002', 5000, 1.2, 10, 8000, 50000, 2000, 5000, 10000);

-- Insert sample data into order_book table
INSERT INTO order_book (account_id, symbol, quantity, price) VALUES
    (1, 'BTC', 2.5, 50000),
    (1, 'ETH', 5, 2000),
    (2, 'BTC', 1.2, 48000);

