<?php
require('fpdf.php');
$pdf = new FPDF();
$pdf->AddPage();
$pdf->SetFont('Arial','B',16);
include 'connection.php';
session_start();
$id = $_SESSION['id'];
$username = $_SESSION['name'];
// $dept_id = $_SESSION['dept_id'];
$emp_id = $_SESSION['emp_id'];


$result = mysqli_query($con,"SELECT * FROM ((((employees
INNER JOIN positions ON positions.pos_id = employees.pos_id)
INNER JOIN allowances ON allowances.emp_id = employees.emp_id)
INNER JOIN deductions ON deductions.emp_id = employees.emp_id)
INNER JOIN salaries ON salaries.pos_id = positions.pos_id)
WHERE employees.emp_id = $emp_id");
$today = date('Y-m-d');
$first = date('Y-m-00');
$attend = mysqli_query($con,"SELECT count(*) AS count FROM attendance WHERE attend_date > '$first' AND emp_id = $emp_id");
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
$absentCount = $workDays - $attendCount;

$percent = 100 * $attendCount / $workDays;

$i=1;




 $h=5;
 $pdf->SetFont('Times','B',20);
 $pdf->SetDrawColor(0,80,180);
 $pdf->SetFillColor(230,230,0);
 $pdf->SetTextColor(220,50,50);
 $pdf->Cell(180,$h,'USER PROFILE',0,1,'C');
 $pdf->Ln(10);
 $pdf->SetFont('Times','B',10);
 $pdf->Cell(10,$h,'Sr.No',1,0,'C');
 $pdf->Cell(10,$h,'id',1,0,'C');
 $pdf->Cell(15,$h,'Name',1,0,'C');
 $pdf->Cell(13,$h,'Gender',1,0,'C');
 $pdf->Cell(20,$h,'Position',1,0,'C');
 $pdf->Cell(15,$h,'Salary',1,0,'C');
 $pdf->Cell(15,$h,'city',1,0,'C');
 $pdf->Cell(15,$h,'Phone',1,0,'C');
 $pdf->Cell(20,$h,'Address',1,0,'C');
 $pdf->Cell(20,$h,'Allowance',1,0,'C');
 $pdf->Cell(22,$h,'Deduction',1,0,'C');
 $pdf->Cell(20,$h,'Net Salary',1,1,'C');

 
 

while($rows=mysqli_fetch_array($result)){
    $pdf->SetFont('Times','',8);
    $pdf->Cell(10,$h,$i,1,0,'C');
    $pdf->Cell(10,$h,$rows['emp_id'],1,0,'C');
    $pdf->Cell(15,$h,$rows['name'],1,0,'C');
    $pdf->Cell(13,$h,$rows['gender'],1,0,'C');
    $pdf->Cell(20,$h,$rows['pos_name'],1,0,'C');
    $pdf->Cell(15,$h,$rows['amount'],1,0,'C');
    $pdf->Cell(15,$h,$rows['city'],1,0,'C');
    $pdf->Cell(15,$h,$rows['phone'],1,0,'C');
    $pdf->Cell(20,$h,$rows['address'],1,0,'C');
    $ded = $rows['amount'] / 30 * $absentCount;
    $net_sal = $rows['amount'] + $rows['allowance'] - round($ded,2);
    $net_sal = $rows['amount'] + $rows['allowance'] - round($ded,2);
    $pdf->Cell(20,$h,$rows['allowance'],1,0,'C');
    $pdf->Cell(22,$h,$ded,1,0,'C');
    $pdf->Cell(20,$h,$net_sal,1,1,'C');


}
$pdf->Output();
?>