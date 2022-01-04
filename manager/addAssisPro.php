<?php
    include 'connection.php';
    //copying form data into variables
    $name = $_POST['name'];
    $gender = $_POST ['gender'];
    $doj = $_POST ['doj'];
    $email = $_POST ['email'];
    $phone = $_POST ['phone'];
    $city = $_POST ['city'];
    $address = $_POST ['address'];
    $stmt = $con->prepare("INSERT INTO `assistant` (`name`, `gender`, `doj`, `email`, `phone`, `city`, `address`) values (?,?,?,?,?,?,?)");
	$stmt->bind_param("sssssss", $name, $gender, $doj, $email, $phone, $city, $address);
	$stmt->execute();
	echo "Assistant is added successfully!";
    header("location: ../manager/assistant.php?status=1");
?>