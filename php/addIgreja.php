<?php
include "config.php";

$id = $_GET['id'];
$id = $id === 'undefined' ? '' : $id;
$nome = $_GET['nome'];
$descricao = $_GET['descricao'];
$endereco = $_GET['endereco'];
$cep = $_GET['cep'];
$bairro = $_GET['bairro'];
$cidade = $_GET['cidade'];
$uf = $_GET['uf'];
$telefone = $_GET['telefone'];
$email = $_GET['email'];
$responsavel = $_GET['responsavel'];
$idpagamento = $_GET['idpagamento'];

$validate = true;
$validationError = array();

if ($nome === '') {
    $validate = false;
    $validationError[] = array(
        'target' => 'nome_error', 
        'error'  => 'Informe o nome'
    );
}

if ($endereco === '') {
    $validate = false;
    $validationError[] = array(
        'target' => 'endereco_error', 
        'error'  => 'Informe o endereco'
    );
}

if ($bairro === '') {
    $validate = false;
    $validationError[] = array(
        'target' => 'bairro_error', 
        'error'  => 'Informe o bairro'
    );
}

if ($cidade === '') {
    $validate = false;
    $validationError[] = array(
        'target' => 'cidade_error', 
        'error'  => 'Informe a cidade'
    );
}

if ($uf === '') {
    $validate = false;
    $validationError[] = array(
        'target' => 'uf_error', 
        'error'  => 'Informe a UF'
    );
}

if ($email === '') {
    $validate = false;
    $validationError[] = array(
        'target' => 'email_error', 
        'error'  => 'informe o email'
    );
}

if ($telefone !== '' && !is_numeric($telefone)) {
    $validate = false;
    $validationError[] = array(
        'target' => 'telefone_error', 
        'error'  => 'Informe apenas numeros no telefone'
    );
}


if ($validate === true) {
	if (empty($id) && mysql_query(
		"INSERT INTO igreja ( nome, descricao, endereco, cep, bairro, cidade, uf, telefone, email, responsavel, idpagamento) 
		 VALUE('{$nome}', '{$descricao}', '{$endereco}', '{$cep}', '{$bairro}', '{$cidade}', '{$uf}', '{$telefone}', '{$email}', '{$responsavel}', '{$idpagamento}')"
	)) {
		exit(json_encode(array('success' => true, 'msg' => 'Gravado!')));
	} elseif ($id > 0  && mysql_query(
		"UPDATE igreja SET nome = '{$nome}', descricao = '{$descricao}', endereco = '{$endereco}', cep = '{$cep}', bairro = '{$bairro}', cidade = '{$cidade}', uf = '{$uf}', telefone = '{$telefone}', email = '{$email}', responsavel = '{$responsavel}', idpagamento = '{$idpagamento}'
		 WHERE id = '{$id}'"
	)) {
		exit(json_encode(array('success' => true, 'msg' => 'Alterado!')));
	}
}

echo json_encode(array(
    'success' => false, 
    'msg'     => 'Erro durante a manipulacao de dados', 
    'validationError' => $validationError
));
