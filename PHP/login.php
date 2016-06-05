<?php
	$host='localhost';
	$user='root';
	$password='';
	
	$connection = mysql_connect($host,$user,$password);
	
	$name = $_POST['email'];
	$email = $_POST['password'];
	
	if(!$connection){
		die('Connection Failed');
	}
	else{
		$dbconnect = @mysql_select_db('kms', $connection);
		
		if(!$dbconnect){
			die('Could not connect to Database');
		}
		else{
			if(!filter_var($_POST['email'], FILTER_VALIDATE_EMAIL))
    		exit("Invalid email address"); // Use your own error handling ;)
			$select = mysql_query("SELECT `email` FROM `user` WHERE `email` = '".$_POST['email']."'") or exit(mysql_error());
			if(mysql_num_rows($select) == 1)
			
			echo 'Successfully added.';
			//echo $select;
		}
	}
?>