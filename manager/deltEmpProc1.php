<?php
    include 'connection.php';
    extract($_GET);
    $query = "DELETE from employees where emp_id='$emp_id'";
    $result=mysqli_query($con,$query);
    if($result==true) {
        header("location: ../manager/delt_employee.php");
        echo "Employee has been deleted sucessfully";
    } 
    else{
        echo "NOT";
    }
?>