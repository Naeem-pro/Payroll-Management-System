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
                <p style="margin-left: 5%;">Please, enter the following details for the new assistant.</p>
                <hr style="border-width:1px;width:90%;text-align:center">
                <form class="addEmpForm" action="addAssisPro.php" method="post">
                    <label for="name">Name</label>
                    <input type="text" name="name" id="naam" placeholder="Enter your name" required>

                    <label for="gender">Gender</label>
                    <select name="gender" id="">
                        <option value="Male">Male</option>
                        <option value="Female">Female</option>
                    </select>

                    <label for="doj">Date of Joining</label>
                    <input type="date" name="doj" required>

                    <label for="email">Email</label>
                    <input type="email" name="email" placeholder="abc@gmail.com" required>

                    <label for="number">Phone</label>
                    <input type="text" name="phone" palceholder="123456789" required>

                    <label for="city">City</label>
                    <input type="text" name="city" placeholder="Enter your city" required>

                    <label for="address">Address</label>
                    <textarea placeholder="Address..." name="address" id="" cols="10" rows="1" required></textarea>
                    <input type="submit" value="Add Assistant"  style="color: white" id="save">
                </form>
                <a href="https://mail.google.com/mail/u/0/#inbox?compose=new" id="mail" target="_blank" style="margin-left:410px; display:block;
                box-sizing:border-box;
                width:330px;
                height:30px;
                color:white;
                text-decoration:none;
                text-align:center;
                line-height:30px;
                border-radius:5px;
                opacity:1;
                background-color:rgb(69,59,207)">Compose Email</a>
            </div>
        </div>
    </div>
    <div id="popup">
        New employee has been added successfully!
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
        
            document.getElementById("popup").style.visibility = "hidden";
         }

         document.getElementById("popup").style.visibility = "visible";
         window.setTimeout("hideMsg()", 2500);
       </script>';
    }
    ?>
</body>
</html>