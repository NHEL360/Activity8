<?php
// config.php

$host = 'localhost';
$dbname = 'licera';
$username = 'root';
$password = '';

/*
$host = 'localhost';
$dbname = 'u593341949_db_licera';
$username = 'u593341949_dev_licera';
$password = '20201362Licera';
*/

$dsn = "mysql:host=$host;dbname=$dbname;charset=utf8mb4";

try {
    $pdo = new PDO($dsn, $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die('Connection failed: ' . $e->getMessage());
}
?>
