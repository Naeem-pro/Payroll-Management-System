<?php
require('fpdf.php');
$pdf = new FPDF();
$pdf->AddPage();
$pdf->SetFont('Arial','B',16);
include 'connection.php';
session_start();
$id = $_SESSION['id'];
$username = $_SESSION['name'];
$dept_id = $_SESSION['dept_id'];


$today = date('Y-m-d');
                    $first = date('Y-m-00');
                    $attend = mysqli_query($con,"SELECT count(*) AS count FROM attendance WHERE attend_date > '$first'");
                    $row = mysqli_fetch_array($attend);
                    $attendCount = $row['count'];

                    //   PHP to count absents in working days
                    $myTime = strtotime(date('Y-m-d'));
                    $workDays = 0;
                    $days = date('d');
                    while($days > 0)
                    {
                        $day = date("D", $myTime); // Sun - Sat
                        if($day != "Sun")
                            $workDays++;

                        $days--;
                        $myTime += 86400; // 86,400 seconds = 24 hrs.
                    }
                    $daysInMonth = cal_days_in_month(CAL_GREGORIAN, date('m'), date('Y'));
                    $workDaysMonth = 0;
                    // PHP to count total working days in a month
                    while($daysInMonth > 0)
                    {
                        $day = date("D", $myTime); // Sun - Sat
                        if($day != "Sun")
                            $workDaysMonth++;

                        $daysInMonth--;
                        $myTime += 86400; // 86,400 seconds = 24 hrs.
                    }
                    $absentCount = $workDays - $attendCount;

                    $percent = 100 * $attendCount / $workDays;

                    $result = mysqli_query($con,"SELECT * FROM departments
                    INNER JOIN positions ON positions.dept_id = departments.dept_id
                    INNER JOIN employees ON employees.pos_id = positions.pos_id
                    INNER JOIN salaries ON salaries.pos_id = positions.pos_id
                    INNER JOIN allowances ON allowances.emp_id = employees.emp_id
                    INNER JOIN deductions ON deductions.emp_id = employees.emp_id
                    WHERE departments.dept_id = $dept_id
                    ORDER BY employees.emp_id");
                    $row = mysqli_fetch_array($result);
                    $emp_id = $row['emp_id'];
                    $attend = mysqli_query($con,"SELECT count(*) AS count FROM attendance WHERE attend_date > '$first' AND emp_id = $emp_id");
                    $rows = mysqli_fetch_array($attend);
                    $attendCount = $rows['count'];
                    $myTime = strtotime(date('Y-m-d'));
                            $workDays = 0;
                            $days = date('d');
                            while($days > 0)
                            {
                                $day = date("D", $myTime); // Sun - Sat
                                if($day != "Sun")
                                    $workDays++;
        
                                $days--;
                                $myTime += 86400; // 86,400 seconds = 24 hrs.
                            }
                            $absentCount = $workDays - $attendCount;
                            $sal_per_day = $row['amount'] / $workDaysMonth;
                            $earned = $attendCount * $sal_per_day;




$h=5;
 $pdf->SetFont('Times','B',20);
 $pdf->Cell(180,$h,'Users List',0,1,'C');
 $pdf->Ln(10);
 $pdf->SetFont('Times','B',12);
 $pdf->Cell(12,$h,'id',1,0,'C');
 $pdf->Cell(36,$h,'Username',1,0,'C');
 $pdf->Cell(36,$h,'Department',1,0,'C');
 $pdf->Cell(37,$h,'Position',1,0,'C');
 $pdf->Cell(20,$h,'Presents',1,0,'C');
 $pdf->Cell(20,$h,'Absents',1,0,'C');
 $pdf->Cell(20,$h,'earned',1,1,'C');
 
 

while($rows=mysqli_fetch_array($result)){
    $pdf->SetFont('Times','',12);
    $pdf->Cell(12,$h,$rows['emp_id'],1,0,'L');
    $pdf->Cell(36,$h,$rows['name'],1,0,'L');
    $pdf->Cell(36,$h,$rows['dept_name'],1,0,'C');
    $pdf->Cell(37,$h,$rows['pos_name'],1,0,'C');
    $pdf->Cell(20,$h,$attendCount,1,0,'C');
    $pdf->Cell(20,$h,$absentCount,1,0,'C');
    $pdf->Cell(20,$h,$earned,1,1,'L');

}
$pdf->Output();
?>