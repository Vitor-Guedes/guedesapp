<?php

namespace App;

class App
{
    public function run()
    {
        header('Content-type', 'application/json');

        echo json_encode([
            'status' => true,
            'name' => 'Vitor Guedes Gomes',
            'email' => 'vtrf2.0@gmail.com',
            'age' => 29
        ]);
    }
}