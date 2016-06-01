<?php
	$host='localhost';
	$user='root';
	$password='';
	
	$connection = mysql_connect($host,$user,$password);
	
	$searchWord = $_POST['searchWord'];
	
	if(!$connection){
		die('Connection Failed');
	}
	else{
		$dbconnect = @mysql_select_db('kms', $connection);
		
		if(!$dbconnect){
			die('Could not connect to Database');
		}
		else{
			$select = mysql_query("SELECT `postTitle` FROM `post` WHERE `postTitle` OR 'postDescription' = '".$_POST['searchWord']."'") or exit(mysql_error());
			
			echo 'Successfully added.';
			echo $select;
		}
	}
?>