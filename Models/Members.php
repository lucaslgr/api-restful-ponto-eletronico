<?php

namespace Models;

use \Core\Model;

class Members extends Model
{
    protected int $id_user;
    //Retorna o id do membro logado
    public function getId()
    {
        return $this->id_user;
    }

    //Insere um novo membro no banco de dados
    public function add(string $nome, string $email, string $senha, int $id_cargo, int $id_departamento)
    {
        //Validação do email
        if(filter_var($email, FILTER_VALIDATE_EMAIL)){
            $sql = $this->pdo->prepare(
                "INSERT INTO membros(nome, email, senha, id_cargo, id_departamento)
                VALUES(?, ?, ?, ?, ?)"
            );

            $status_query = $sql->execute(array(
                $nome,
                $email,
                $senha,
                $id_cargo,
                $id_departamento
            ));
            
            return ($status_query)?(''):('Ocorreu um erro na query');
        } else {
            return 'Email inválido';
        }
    }

    //Checa se o membro respectivo as informações passadas existe
    public function checkCredentials(string $email, string $password): bool
    {
        $sql = $this->pdo->prepare("SELECT * FROM membros WHERE email = ?");
        $sql->execute(array(
            $email
        ));

        if ($sql->rowCount() > 0) {
            $info = $sql->fetch(\PDO::FETCH_ASSOC);

            //Verificando a senha
            if(password_verify($password, $info['senha'])){
                $this->id_user = $info['id']; //Salvando o id do membro logado
                return true;
            } else //Errou a senha
                return false;
        } else //membro não existe
            return false;
    }

    //Checa se o email informado já foi utilizado em algum cadastro
    public function checkEmailExists(string $email)
    {
        $sql = $this->pdo->prepare("SELECT id FROM membros WHERE email = ?");
        $sql->execute(array($email));

        return ($sql->rowCount() > 0)?true:false;
    }

    //Checa se o id do membro informado existe no BD
    public function checkIdMember(int $id_member)
    {
        $sql = $this->pdo->prepare("SELECT * FROM membros WHERE id = ?");
        $sql->execute(array($id_member));

        return($sql->rowCount() > 0)?(true):(false);
    }

    //Checa se a tag respectiva ao UID informado existe
    public function checkTagUID(string $uid)
    {
        $sql = $this->pdo->prepare("SELECT id_membro FROM tags_cadastradas WHERE uid = ?");
        $sql->execute(array($uid));

        return ($sql->rowCount() > 0)?(true):(false);
    }

    //Retorna as informações do do membro do respectivo id
    public function getInfo(int $id_member)
    {
        $response = array();
        $sql = $this->pdo->prepare(
            "SELECT membros.id, membros.nome, membros.email, cargos.nome AS cargo, departamentos.nome AS departamento 
            FROM membros
            INNER JOIN cargos ON membros.id_cargo = cargos.id
            INNER JOIN departamentos ON membros.id_departamento = departamentos.id
            WHERE membros.id = ?");
        $sql->execute(array(
            $id_member
        ));

        if ($sql->rowCount() > 0) {
            $response = $sql->fetch(\PDO::FETCH_ASSOC);
        }
        return $response;
    }

    //Retorna as tags do respectivo membro
    public function getTagsByMember(int $id_member)
    {
        $response = array();

        $sql = $this->pdo->prepare(
            "SELECT uid, tipo FROM tags_cadastradas WHERE id_membro = ?"
        );
        $sql->execute(array(
            $id_member
        ));

        if ($sql->rowCount() > 0) {
            $response = $sql->fetchAll(\PDO::FETCH_ASSOC);
        }
        return $response;
    }

    // Pega todos os membros de acordo com os critérios desejados
    public function getMembers(array $descriptions = array())
    {
        $response = array();

        if (count($descriptions) > 0) {
            $fields = array_keys($descriptions);
            $values = array_values($descriptions);

            foreach ($fields as $key => $value)
                $fields[$key] = 'membros.'.$value .= ' = ?';

            $sql = (
                "SELECT membros.id, membros.nome, membros.email, cargos.nome AS cargo, departamentos.nome AS departamento
                FROM membros
                INNER JOIN cargos ON membros.id_cargo = cargos.id
                INNER JOIN departamentos ON membros.id_departamento = departamentos.id
                WHERE ".implode(', ',$fields)
            );

            $sql = $this->pdo->prepare($sql);
            $sql->execute($values);

        } else { //Seleciona todos sem critério
            $sql = (
                "SELECT membros.id, membros.nome, membros.email, cargos.nome AS cargo, departamentos.nome AS departamento 
                FROM membros
                INNER JOIN cargos ON membros.id_cargo = cargos.id
                INNER JOIN departamentos ON membros.id_departamento = departamentos.id
                WHERE 1=1"
            );

            $sql = $this->pdo->prepare($sql);
            $sql->execute();
            $response = $sql->fetchAll(\PDO::FETCH_ASSOC);
        }

        if ($sql->rowCount() > 0) {
            $response = $sql->fetchAll(\PDO::FETCH_ASSOC);
        }

        return $response;
    }

    //Edita as informações do usuário respectivo ao id informado
    public function editInfo(int $id_member, array $update_data = array())
    {
        if (!$this->checkIdMember($id_member))
            return 'Id do membro é inválido';

        $fields = array_keys($update_data);
        $values = array_values($update_data);

        foreach ($fields as $key => $field)
            $fields[$key] = $field .= ' = ?';

        $values[] = $id_member;
        $sql = $this->pdo->prepare(
            "UPDATE membros
            SET ".implode(', ', $fields)." WHERE id = ?"
        );

        $status_query = $sql->execute($values);

        return ($status_query)?(''):('Ocorreu um erro na query');
    }

    //Deleta o membro do respectivo ID
    public function delete(int $id_member)
    {
        $sql = $this->pdo->prepare("DELETE FROM membros WHERE id = ?");
        $status_query = $sql->execute(array($id_member));

        return ($status_query)?(''):('Ocorreu um erro na query');
    }

    //Registra um acesso do membro
    public function accessRegister(string $uid)
    {
        $sql = $this->pdo->prepare(
            "INSERT INTO acessos(uid, horario, id_status) VALUES(?, NOW(),  ?)"
        );

        $status_query = $sql->execute(array(
            $uid,
            1
        ));

        return ($status_query)?(''):('Ocorreu um erro na query');
    }
} 