<?php
	$host='localhost';
	$user='root';
	$password='';
	
	$connection = mysql_connect($host,$user,$password);
	
	$name = $_POST['name'];
	$email = $_POST['email'];
	$password = $_POST['password'];
	$department = $_POST['department'];
	$skills = $_POST['skills'];
	$function = $_POST['function'];
	$about = $_POST['about'];
	
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
			if(mysql_num_rows($select))
    		exit("This email is already being used");
			$query = "INSERT INTO `kms`.`user` (`email`, `password`, `name`, `department`, `skills`, `function`, `about`)
				VALUES ('$email','$password','$name','$department','$skills','$function','$about');";
			mysql_query($query, $connection) or die(mysql_error());
			
			echo 'Successfully added.';
			echo $query;
		}
	}
?>