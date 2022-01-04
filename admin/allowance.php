<?php
	include 'connection.php';
	// Initialize session
	session_start();
    $id = $_SESSION['id'];

	if ($_SESSION['loggedin'] !== TRUE) {
		header('location: ../login.php');
		exit;
	}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../styles.css">
    <title>Department</title>
</head>
<body>
    <div style="overflow: hidden; height: 100vh;">
        <div class="header">
            <div class="logo">
                <img src="../images/pms_logo.jpeg" alt="pms_logo" width="85%">
            </div>
            <p>Payroll Management System</p>
            <a href="../home.html">Home</a>
            <a href="../support.php">Support</a>
            <a href="../announcement.php">Announcements</a>
            <a href="../faqs.html">FAQs</a>
        </div>
        <div class="sidebar">
            <div class="bg_sidebar">
                <div class="user">
                    

                <?php
                    $img = mysqli_query($con,"select picture from users where user_id = $id "); // fetch data from database
                    $row = mysqli_fetch_array($img);

                    if (
                        $row['picture'] == '' ||  $row['picture'] == null ||  empty($row['picture']) ||  !$row['picture'])
                        {
                          ?>
                          <img src="../images/user.png" alt="User Photo" width="45%"> <!-- This Dummy image will be displayed if user img not found in DB -->
                          <?php
                      }
                      else {
                        echo '<img src="data:image/jpeg;base64,'.base64_encode( $row['picture'] ).'" width="100" eight="100"/>';
                      }
                    ?>
                    <span style="display: block;">Welcome <?php echo $_SESSION['name'] ?></span>
                    
                </div>
                <hr style="border-width:1px;width:95%;text-align:center">
                <a href="../admin/dashboard.php"  style="margin-top:12px; font-size:25px; height: 22px; line-height:22px">Dashboard</a>
                <a href="../admin/employees.php" style="margin-top:12px; font-size:25px; height: 22px; line-height:22px">Employees</a>
                <a href="../admin/departments.php" style="margin-top:12px; font-size:25px; height: 22px; line-height:22px">Departments</a>
                <a href="../admin/payrolls.php" style="margin-top:12px; font-size:25px; height: 22px; line-height:22px">Payrolls</a>
                <a href="../admin/users.php" style="margin-top:12px; font-size:25px; height: 22px; line-height:22px">Users</a>            
                <a href="../logout.php" style="margin-top:12px; font-size:25px; height: 22px; line-height:22px">Logout</a>
            </div>
        </div>
        <div class="task_area">
            <div class="bg_task_area">
                <p style="margin-left: 50px">Enter the following details to add allowance.</p>
                <hr style="border-width:1px;width:90%;text-align:center">
                <form class="addEmpForm" action="allowanceProc.php" method="post">

                    <label for="emp_id">Employee ID</label>
                    <input type="text" name="emp_id">

                    <label for="dept_id">Allowance Amount (in PKR)</label>
                    <input type="text" name="allowance" style="margin-bottom: 20px">

                    <input type="submit" value="Add Allowance" style="color: white">
                </form>

            </div>
        </div>
    </div>  
    <div id="popup">
        Allowance for the employee is added successfully!
    </div>
    
    
    <div id="popup2">
        Employee ID does not exist. Please, Try again.
    </div>
    <?php
    $added = false;

    if(isset($_GET['status']) && $_GET['status'] == 1){
       $added = true;
    }

    if($added)
    {
     echo '
       <script type="text/javascript">
         function hideMsg()
         {
            document.getElementById("popup").style.visibility = "hidden";
         }

         document.getElementById("popup").style.visibility = "visible";
         window.setTimeout("hideMsg()", 3000);
       </script>';
    }
    ?> 


    <?php
    $added = false;

    if(isset($_GET['status']) && $_GET['status'] == 2){
       $added = true;
    }

    if($added)
    {
     echo '
       <script type="text/javascript">
         function hideMsg()
         {
            document.getElementById("popup2").style.visibility = "hidden";
         }

         document.getElementById("popup2").style.visibility = "visible";
         window.setTimeout("hideMsg()", 3000);
       </script>';
    }
    ?>      
</body>
</html>