<?php
// Database configuration
/*
$dbHost = 'localhost';
$dbName = 'licera';
$dbUsername = 'root';
$dbPassword = '';
*/

$host = 'localhost';
$dbname = 'u593341949_db_licera';
$username = 'u593341949_dev_licera';
$password = '20201362Licera';


try {
    $pdo = new PDO("mysql:host={$dbHost};dbname={$dbName}", $dbUsername, $dbPassword);
    // Set the PDO error mode to exception
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("Connection failed: " . $e->getMessage());
}
?>
