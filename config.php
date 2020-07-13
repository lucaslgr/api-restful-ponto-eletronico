<?php
    require 'environment.php';

    if (ENVIRONMENT == 'development') {
        define('BASE_URL', 'http://localhost/project-ponto-eletronico/');
        $config['dbname'] = 'batponto'; //Usei essa tabela para exemplo
        $config['host'] = '127.0.0.1'; //ou 'localhost'
        $config['dbuser'] = 'root';
        $config['dbpass'] = '';
    }
    else { //Se não => ENVIRONMENT = 'production'
        define('BASE_URL', 'https://api-batponto.encautech.com/');
        $config['dbname'] = 'encaute2_access_control';
        $config['host'] = 'localhost';
        $config['dbuser'] = 'encaute2_manager';
        $config['dbpass'] = 'QA==m&ZQ+HR;';
    }

    global $db;

    try {
        $db = new PDO('mysql:dbname='.$config['dbname'].';host='.$config['host'],
                        $config['dbuser'],
                        $config['dbpass']);
    } catch(PDOException $e) {
        die($e->getMessage());
        exit();
    }

?>