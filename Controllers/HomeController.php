<?php
namespace Controllers;

use \Core\Controller;

class HomeController extends Controller{
    public function index() {
        
        $response['error'] = 'Aceso negado, nenhum dado enviado';

        $this->returnJson($response);
    }
}