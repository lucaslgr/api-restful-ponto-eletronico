<?php

namespace Models;

use \Core\Model;

class Params extends Model
{
    public function __construct()
    {
        parent::__construct();
    }

    public function getAllDepartments(): array
    {
        $result = [];


        $sql = $this->pdo->query("SELECT * FROM departamentos");
        if($sql->rowCount() > 0){
            $result = $sql->fetchAll(\PDO::FETCH_ASSOC);
        }

        return $result;
    }

    public function getAllPositions(): array
    {
        $result = [];


        $sql = $this->pdo->query("SELECT * FROM cargos");
        if($sql->rowCount() > 0){
            $result = $sql->fetchAll(\PDO::FETCH_ASSOC);
        }

        return $result;
    }
}