<?php

namespace Controllers;

use \Core\Controller;
use \Models\Members;

class MembersController extends Controller
{

    //ACTION: (GP) registra um novo membro
    public function create()
    {
        $response = array(
            'error' => ''
        );

        $method = $this->getMethod();
        $data = $this->getRequestData();

        if ($method == 'POST'){

            //Verificando se as informações foram enviadas
            if (
                !empty($data['nome']) &&
                !empty($data['id_cargo']) &&
                !empty($data['email']) &&
                !empty($data['id_departamento']) &&
                !empty($data['senha'])
            ) {

                $members = new Members();

                if ($members->checkEmailExists($data['email'])) {
                    $response['error'] = 'Email já cadastrado';
                } else {
                    $response['error'] = $members->add(
                        $data['nome'],
                        $data['email'],
                        password_hash($data['senha'], PASSWORD_BCRYPT),
                        $data['id_cargo'],
                        $data['id_departamento']
                    );
                }
            } else {
                $response['error'] = 'Os dados não foram enviados';
            }
        } else
            $response['error'] = 'Método '.$method.' é inválido para essa requisição';

        $this->returnJson($response);
    }

    //ACTION: logar um membro
    public function login()
    {
        $response = array(
            'error' => ''
        );

        $method = $this->getMethod();
        $data = $this->getRequestData();

        if ($method == 'POST') {
            //Verificando se as informações foram enviadas
            if (
                !empty($data['email']) &&
                !empty($data['senha'])
            ) {
                $members = new Members();

                if ($members->checkCredentials($data['email'], $data['senha'])) {
                    $response['error'] = 'login com sucesso';
                } else {
                    $response['error'] = 'Senha e/ou email incorretos';
                }
            } else {
                $response['error'] = 'Os dados não foram enviados';
            }
        } else
            $response['error'] = 'Método '.$method.' é inválido para essa requisição';

        $this->returnJson($response);
    }

    //ACTION: retorna uma lista com todos os membros e suas informações
    public function get_all()
    {
        $response = array(
            'error' => ''
        );

        $method = $this->getMethod();
        // $data = $this->getRequestData();

        if ($method == 'GET') {
            //Verificando se as informações foram enviadas

            $members = new Members();

            $response['membros'] = $members->getMembers();
        } else {
            $response['error'] = 'Método '.$method.' é inválido para essa requisição';
        }
        $this->returnJson($response);
    }

    /**
     * ACTION
     * - /members/{id}         (GET)       = informaçõoes do membro {id}
     * - /members/{id}         (PUT)       = (GP) editar membro {id}
     * - /members/{id}         (DELETE)    = (GP) deletar membro {id}
    */
    public function view(int $id_member)
    {
        $response = array(
            'error' => ''
        );

        $method = $this->getMethod();
        $data = $this->getRequestData();

        $id_member = intval($id_member);
        if (!empty($id_member)) {

            $members = new Members();

            switch($method){
                case 'GET':
                    // $response['data'] = $members->getMembers(
                    //     array(
                    //         'id' => $id_member 
                    //     )
                    // );
                    $response['data'] = $members->getInfo($id_member);
                    break;
                    
                case 'PUT':
                    if (count($data) > 0)
                        $response['error'] = $members->editInfo($id_member, $data);
                    else
                        $response['error'] = 'Nenhum dado foi enviado';
                    break;
    
                case 'DELETE':
                        $response['error'] = $members->delete($id_member);
                    break;
    
                default:
                    $response['error'] = 'Método '.$method.' é inválido para essa requisição';
                    break;
            }
        } else {
            $response['error'] = 'Os dados não foram enviados';
        }

        $this->returnJson($response);
    }
}