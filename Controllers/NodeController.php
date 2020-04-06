<?php

namespace Controllers;

use \Core\Controller;
use \Models\Members;

class NodeController extends Controller
{
    //ACTION: Usada apenas pelo Node, para registrar um acesso 
    public function new_access(string $uidTag = '')
    {
        $response = array(
            'error' => ''
        );

        $method = $this->getMethod();
        $data = $this->getRequestData(); //Só será necessário quando usar o POST

        if ($method=='GET' || $method=='POST') {
            if (!empty($uidTag) || !empty($data['uid'])) {
                $members = new Members();
    
                if ($members->checkTagUID($uidTag)) {
                    $response['error'] = $members->accessRegister($uidTag);
                } else {
                    $response['error'] = 'Membro não cadastrado';
                }
            } else {
                $response['error'] = 'Ocorreu um erro, a UID não foi enviada';
            }
        } else {
            $response['error'] = 'Método '.$method.' é inválido para essa requisição';
        }

        $this->returnJson($response);
    }
}