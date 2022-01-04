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
$result = mysqli_query($con,"SELECT * FROM employees 
INNER JOIN positions ON positions.pos_id = employees.pos_id
INNER JOIN salaries ON salaries.pos_id = positions.pos_id
INNER JOIN departments ON departments.dept_id = positions.dept_id
WHERE departments.dept_id = $dept_id ORDER BY employees.emp_id");

$h=5;
 $pdf->SetFont('Times','B',20);
 $pdf->Cell(180,$h,'Employees List',0,1,'C');
 $pdf->Ln(10);
 $pdf->SetFont('Times','B',12);
 $pdf->Cell(20,$h,'id',1,0,'C');
 $pdf->Cell(40,$h,'Name',1,0,'C');
 $pdf->Cell(18,$h,'Gender',1,0,'C');
 $pdf->Cell(35,$h,'Position',1,0,'C');
 $pdf->Cell(18,$h,'Salary',1,0,'C');
 $pdf->Cell(30,$h,'city',1,0,'C');
 $pdf->Cell(27,$h,'Phone',1,1,'C');
 
 

while($rows=mysqli_fetch_array($result)){
    $pdf->SetFont('Times','',12);
    $pdf->Cell(20,$h,$rows['emp_id'],1,0,'L');
    $pdf->Cell(40,$h,$rows['name'],1,0,'L');
    $pdf->Cell(18,$h,$rows['gender'],1,0,'C');
    $pdf->Cell(35,$h,$rows['pos_name'],1,0,'C');
    $pdf->Cell(18,$h,$rows['amount'],1,0,'C');
    $pdf->Cell(30,$h,$rows['city'],1,0,'C');
    // $y=$pdf->GetY();
    $pdf->Cell(27,$h,$rows['phone'],1,1,'L');
    // $pdf->MultiCell(20,20,$h,$rows['phone'],0,'L');

}
$pdf->Output();
?>