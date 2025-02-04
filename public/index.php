<?php

header('Content-type', 'application/json');

echo json_encode([
    'status' => true,
    'name' => 'Vitor Guedes',
    'email' => 'vtrf2.0@gmail.com'
]);