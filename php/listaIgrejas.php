<?php
include "config.php";

$where_condition = ' AND (';
if (sizeof($_GET) > 0) {
    $nome = $_GET['nome'];
    $email = $_GET['email'];
    if ($nome) {
        $where_condition.= " nome LIKE '%{$nome}%' ";
    }

    if ($email) {
        $where_condition.= ( $where_condition === ' AND (' ? '' : ' OR ' ) . " email LIKE '%{$email}%' ";
    }
}
$where_condition.= ( $where_condition === ' AND (' ? '1)' : ')' ); 

$igrejas = array();
$result = mysql_query("SELECT id, nome, descricao, endereco, cep, bairro, cidade, uf, telefone, email, responsavel, idpagamento FROM igreja WHERE 1 {$where_condition} ORDER BY id DESC");
while ($row = mysql_fetch_array($result, MYSQL_ASSOC)) {
    $igrejas[]= array(
        'id' => $row['id'], 
        'nome' => $row['nome'],
		'descricao' => $row['descricao'],
        'endereco' => $row['endereco'], 
        'cep' => $row['cep'], 
        'bairro' => $row['bairro'], 
        'cidade' => $row['cidade'], 
        'uf' => $row['uf'], 
        'telefone' => $row['telefone'], 
        'email' => $row['email'], 
        'responsavel' => $row['responsavel'], 
        'idpagamento' => $row['idpagamento']
    );
}
echo json_encode($igrejas);
