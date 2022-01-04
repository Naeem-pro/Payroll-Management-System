<?php
	include 'connection.php';
	// Initialize session
	session_start();
    $id = $_SESSION['id'];
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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">
    <script src="jquery-3.2.1.min.js"></script>
    <link rel="stylesheet" href="../styles.css">
    <title>Add New Employee</title>
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
                    <span style="display: block;">Welcome <?php echo ucfirst($_SESSION['name']) ?></span>
                    
                </div>
                <hr style="border-width:1px;width:95%;text-align:center">
                <a href="../manager/dashboard.php"  style="margin-top:12px; font-size:25px; height: 22px; line-height:22px">Dashboard</a>
                <a href="../manager/employees.php" style="margin-top:12px; font-size:25px; height: 22px; line-height:22px">Employees</a>
                <a href="../manager/payrolls.php" style="margin-top:12px; font-size:25px; height: 22px; line-height:22px">Payrolls</a>
                <a href="../manager/positions.php" style="margin-top:12px; font-size:25px; height: 22px; line-height:22px">Positions</a>
                <a href="../manager/users.php" style="margin-top:12px; font-size:25px; height: 22px; line-height:22px">Users</a>
                <a href="../logout.php" style="margin-top:12px; font-size:25px; height: 22px; line-height:22px">Logout</a>
            </div>
        </div>
        <div class="task_area">
            <div class="bg_task_area">
                <p style="margin-left: 5%;">Please, click Delete button to delete particular employee from database.</p>
                <hr style="border-width:1px;width:90%;text-align:center">
                <table>
                    <tr>
                        <th>Sr. No</th>
                        <th>Emp. ID</th>
                        <th>Name</th>
                        <th>Gender</th>
                        <th>Position</th>
                        <th>Department</th>
                        <th>Basic Salary</th>
                        <th>DOJ</th>
                        <th>DOB</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>City</th>
                        <th>Address</th>
                        <th>Delete</th>
                    </tr>
                    <?php
                        include 'connection.php';
                        $result = mysqli_query($con,"SELECT * FROM employees 
                        INNER JOIN positions ON positions.pos_id = employees.pos_id
                        INNER JOIN salaries ON salaries.pos_id = positions.pos_id
                        INNER JOIN departments ON departments.dept_id = positions.dept_id
                        WHERE departments.dept_id = $dept_id ORDER BY employees.emp_id");
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
                                <td><?php echo $row["name"]; ?></td>
                                <td><?php echo $row["gender"]; ?></td>
                                <td><?php echo $row["pos_name"]; ?></td>
                                <td><?php echo $row["dept_name"]; ?></td>
                                <td><?php echo $row["amount"] ?></td>
                                <td><?php echo $row["doj"]; ?></td>
                                <td><?php echo $row["dob"]; ?></td>
                                <td><?php echo $row["email"]; ?></td>
                                <td><?php echo $row["phone"]; ?></td>
                                <td><?php echo $row["city"]; ?></td>
                                <td><?php echo $row["address"]; ?></td>
                                <td><a href="deltEmpProc1.php?emp_id=<?php echo $row['emp_id'] ?>"><input type="button" class="primary"  value="Delete" style="background-color:red;color:white;cursor:pointer;height:35px;width:50px"></a></td>
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
    <div id="popup">
        Employee has been deleted succeesfully!
    </div>
    <div id="popup2">
        Employee ID not found!
    </div>
    <div id="popup3">
        Sorry! This Employee does not belong to your department!
    </div>

    <?php
    $recordAdded = false;

    if(isset($_GET['status']) && $_GET['status'] == 1){
       $recordAdded = true;
    }

    if($recordAdded)
    {
     echo '
       <script type="text/javascript">
         function hideMsg()
         {
            document.getElementById("popup").style.visibility = "hidden";
         }

         document.getElementById("popup").style.visibility = "visible";
         window.setTimeout("hideMsg()", 2500);
       </script>';
    }
?>

<?php
    $found = false;

    if(isset($_GET['status']) && $_GET['status'] == 2){
       $found = true;
    }

    if($found)
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
<?php
    $belong = false;

    if(isset($_GET['status']) && $_GET['status'] == 3){
       $belong = true;
    }

    if($belong)
    {
     echo '
       <script type="text/javascript">
         function hideMsg()
         {
            document.getElementById("popup3").style.visibility = "hidden";
         }

         document.getElementById("popup3").style.visibility = "visible";
         window.setTimeout("hideMsg()", 3500);
       </script>';
    }
?>
</body>
</html>