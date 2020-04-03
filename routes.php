<?php
/**
 * ==========================================<ROTAS>===========================================
 * 1    - /members/login        (POST)      = logar membro
 * 2    - /members/new          (POST)      = (GP) registra um novo membro
 * 
 * 3    - /members/             (GET)       = (GP) retorna informações de todos os membros
 * 4    - /members/{id}         (GET)       = informaçõoes do membro {id}
 * 5    - /members/{id}         (PUT)       = (GP) editar membro {id}
 * 6    - /members/{id}         (DELETE)    = (GP) deletar membro {id}
 * 
 * 7    - /access/new           (POST)      = (NodeMCU) registra um novo acesso
 * 8    - /access/month/{id}    (GET)       = retorna todos os acessos do mês do membro {id}
 * 9    - /access/week/{id}     (GET)       = retorna todos os acessos da semana do membro {id}
 * 
 * ==========================================<ROTAS>===========================================
*/


global $routes;
$routes = array();

//Cofiguração das rotas
$routes['/members/new']     = '/members/create';        //OK
$routes['/members/login']   = '/members/login';         //OK
$routes['/members']         = '/members/get_all';       //OK
$routes['/members/{id}']    = '/members/view/:id';      //OK