<?php
    include 'connection.php';
    //copying form data into variables
    session_start();
    $id = $_SESSION['id'];
    $emp_id = $_SESSION['emp_id'];
    $name = $_POST ['name'];
    $email = $_POST ['email'];
    $subject = $_POST ['subject'];
    $description = $_POST ['description'];
    $dt = date('Y-m-d');
    $tm = date('H:i:s');

    //inserting into employees table
    $stmt = $con->prepare("INSERT INTO `leftComp` (`spt_name`,`emp_id`, `spt_email`, `spt_subject`, `spt_description`, `spt_date`, `spt_time`) values (?,?,?,?,?,?,?)");
	$stmt->bind_param("sisssss", $name, $emp_id, $email, $subject, $description, $dt, $tm);
	$stmt->execute();

	echo "Your form is submitted successfully!";
    header("location: ../employee/left.php?status=2");
?>