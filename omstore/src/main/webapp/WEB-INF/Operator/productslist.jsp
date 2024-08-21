<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Dashboard</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        /* Add your CSS styling here */
        body {
            font-family: Arial, sans-serif;
        }
        .container {
            display: flex;
        }
        .sidebar {
            width: 20%;
            background-color: #f8f8f8;
            padding: 20px;
        }
        .main-content {
            width: 80%;
            padding: 20px;
        }
        .card {
            border: 1px solid #ddd;
            border-radius: 5px;
            padding: 20px;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="sidebar">
            <h2>Store Management</h2>
            <ul>
                <li><a href="#">Dashboard</a></li>
                <li><a href="#">Order Management</a></li>
                <li><a href="#">Product Management</a></li>
                <li><a href="#">Customer Management</a></li>
                <li><a href="#">Marketing</a></li>
                <li><a href="#">Store Settings</a></li>
            </ul>
        </div>
        <div class="main-content">
            <h1>Dashboard</h1>
            <div class="card">
                <h3>Order Processing Status</h3>
                <p>Pending Payment: 0</p>
                <p>Order Confirmation: 0</p>
                <p>Shipping: 0</p>
                <p>Cancelled Requests: 0</p>
                <p>Return Requests: 0</p>
                <p>Exchange Requests: 0</p>
            </div>
            <div class="card">
                <h3>Product and Inventory Status</h3>
                <p>New Products in 48 Hours: 0</p>
                <p>Updated Products in 48 Hours: 0</p>
                <p>Stock Needed: 0</p>
                <p>Stock: 0</p>
            </div>
            <div class="card">
                <h3>Order Statistics</h3>
                <p>Order Summary (2024.07.23 - 2024.07.29)</p>
                <p>Orders: 0</p>
                <p>Cancelled/Returned Orders: 0</p>
            </div>
            <div class="card">
                <h3>Updates</h3>
                <p>Added customizable options for products.</p>
                <p>Customer segmentation features added.</p>
                <p>Enhanced post layout customization.</p>
            </div>
        </div>
    </div>
</body>
</html>
