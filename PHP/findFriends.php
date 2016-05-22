<?php
require("db/Conn.php");
require("db/MySQLDAO.php");

$returnValue = array();

if(empty($_POST["searchWord"]) || empty($_POST["userId"]))
{
    $returnValue["message"]="Missing required information";
    echo json_encode($returnValue);
    return;
}

$searchWord = htmlentities($_POST["searchWord"]);
$userId = htmlentities($_POST["userId"]);

$dao = new MySQLDAO(Conn::$dbhost, Conn::$dbuser, Conn::$dbpass, Conn::$dbname);
$dao->openConnection();

$friends = $dao->findFriends($searchWord,$userId);

$dao->closeConnection();

$returnValue["friends"]=$friends;

echo json_encode($returnValue);

?>
