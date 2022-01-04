<?php
	include 'connection.php';
	// Initialize session
	session_start();
    $id = $_SESSION['id'];
    $username = $_SESSION['name'];
    $dept_id = $_SESSION['dept_id'];

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
    <title>Employees</title>
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
                    <span style="display: block;">Welcome <?php echo ucfirst($username) ?></span>
                    
                </div>
                <hr style="border-width:1px;width:95%;text-align:center">
                <a href="../manager/dashboard.php" style="margin-top:12px; font-size:25px; height: 22px; line-height:22px">Dashboard</a>
                <a href="../manager/employees.php" style="margin-top:12px; font-size:25px; height: 22px; line-height:22px">Employees</a>
                <a href="../manager/payrolls.php" style="margin-top:12px; font-size:25px; height: 22px; line-height:22px">Payrolls</a>
                <a href="../manager/positions.php" style="margin-top:12px; font-size:25px; height: 22px; line-height:22px">Positions</a>
                <a href="../manager/users.php" style="margin-top:12px; font-size:25px; height: 22px; line-height:22px">Users</a>
                <a href="../logout.php" style="margin-top:12px; font-size:25px; height: 22px; line-height:22px">Logout</a>
            </div>
        </div>
        <div class="task_area">
            <div class="bg_task_area">
                <div class="area1_emp_mng">
                    <a href="../manager/addEmp.php"><p>Add New Employee</p></a>
                    <a href="../manager/delt_employee.php"><p>Delete An Employee</p></a>
                    <a href="downloadResigners.php"><p>Generate PDF File</p></a>
                    <div style="clear: both;"></div>
                </div>  
                <hr style="border-width:1px;width:90%;text-align:center">
                <table>
                    <tr>
                        <th>Sr. No</th>
                        <th>Emp. ID</th>
                        <th>Name</th>
                        <th>Subject</th>
                        <th>Reason</th>
                    </tr>
                    <?php
                        $result = mysqli_query($con,"SELECT * FROM leftcomp");
                        $j = mysqli_num_rows($result);
                        if ($j = 0){
                            echo "No result found!";
                        }
                        else {
                            $i = 1;
                            while($row = mysqli_fetch_array($result)) {
                        ?>
                                <tr>
                                <td><?php echo $i ?></td>   <!-- Serial No Generate -->                                
                                <td><?php echo $row["emp_id"]; ?></td>
                                <td><?php echo $row["spt_name"]; ?></td>
                                <td><?php echo $row["spt_subject"]; ?></td>
                                <td><?php echo $row["spt_description"]; ?></td>
                                </tr>
                            <?php
                                $i++;
                            }
                            ?>
                        <?php
                        }
                    ?>
                </table>
            </div>
        </div>
    </div>
</body>
</html>