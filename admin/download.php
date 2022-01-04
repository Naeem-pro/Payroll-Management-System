<?php
require('fpdf.php');
$pdf = new FPDF();
$pdf->AddPage();
$pdf->SetFont('Arial','B',16);
include 'connection.php';
session_start();
$id = $_SESSION['id'];
//$username = $_SESSION['name'];
//$dept_id = $_SESSION['dept_id'];
if ($_SESSION['loggedin'] !== TRUE) {
    header('location: ../login.php');
    exit;
}
// $result = mysqli_query($con,"SELECT * FROM employees 
// INNER JOIN positions ON positions.pos_id = employees.pos_id
// INNER JOIN salaries ON salaries.pos_id = positions.pos_id
// INNER JOIN departments ON departments.dept_id = positions.dept_id
// WHERE departments.dept_id = $dept_id ORDER BY employees.emp_id");
$result = mysqli_query($con,"SELECT * FROM (((((departments
                        INNER JOIN positions ON positions.dept_id = departments.dept_id)
                        INNER JOIN employees ON employees.pos_id = positions.pos_id)
                        INNER JOIN allowances ON allowances.emp_id = employees.emp_id)
                        INNER JOIN deductions ON deductions.emp_id = employees.emp_id)
                        INNER JOIN salaries ON salaries.pos_id = positions.pos_id)
                        ORDER BY employees.emp_id
                        ");
$h=5;
 $pdf->SetFont('Times','B',8);
 $pdf->Cell(5,$h,'id',1,0,'C');
 $pdf->Cell(17,$h,'Name',1,0,'C');
 $pdf->Cell(11,$h,'Gender',1,0,'C');
 $pdf->Cell(22,$h,'Department',1,0,'C');
 $pdf->Cell(18,$h,'Position',1,0,'C');
 $pdf->Cell(11,$h,'Salary',1,0,'C');
 $pdf->Cell(15,$h,'Allowance',1,0,'C');
 $pdf->Cell(15,$h,'Deduction',1,0,'C');
 $pdf->Cell(15,$h,'DOJ',1,0,'C');
 $pdf->Cell(15,$h,'DOB',1,0,'C');
 $pdf->Cell(15,$h,'Phone',1,0,'C');
 $pdf->Cell(15,$h,'city',1,0,'C');
 $pdf->Cell(18,$h,'Address',1,1,'C');
while($rows=mysqli_fetch_array($result)){
    $pdf->SetFont('Times','',6);
    $pdf->Cell(5,$h,$rows['emp_id'],1,0,'L');
    $pdf->Cell(17,$h,$rows['name'],1,0,'L');
    $pdf->Cell(11,$h,$rows['gender'],1,0,'C');
    $pdf->Cell(22,$h,$rows['dept_name'],1,0,'C');
    $pdf->Cell(18,$h,$rows['pos_name'],1,0,'C');
    $pdf->Cell(11,$h,$rows['amount'],1,0,'C');
    $pdf->Cell(15,$h,$rows['allowance'],1,0,'C');
    $pdf->Cell(15,$h,$rows['deduction'],1,0,'C');
    $pdf->Cell(15,$h,$rows['doj'],1,0,'C');
    $pdf->Cell(15,$h,$rows['dob'],1,0,'C');
    $pdf->Cell(15,$h,$rows['phone'],1,0,'L');
    $pdf->Cell(15,$h,$rows['city'],1,0,'C');
    $pdf->Cell(18,$h,$rows['address'],1,1,'L');
    // $y=$pdf->GetY();
   
    // $pdf->MultiCell(20,20,$h,$rows['phone'],0,'L');

}
$pdf->Output();
?>