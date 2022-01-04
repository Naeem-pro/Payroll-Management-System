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
$result = mysqli_query($con,"SELECT * FROM (((users
INNER JOIN employees ON employees.emp_id = users.emp_id)
INNER JOIN positions ON positions.pos_id = employees.pos_id)
INNER JOIN departments ON departments.dept_id = positions.dept_id)
WHERE departments.dept_id = $dept_id ORDER BY users.user_id");

$h=5;
 $pdf->SetFont('Times','B',20);
 $pdf->Cell(180,$h,'Users List',0,1,'C');
 $pdf->Ln(10);
 $pdf->SetFont('Times','B',12);
 $pdf->Cell(12,$h,'id',1,0,'C');
 $pdf->Cell(26,$h,'Username',1,0,'C');
 $pdf->Cell(20,$h,'Password',1,0,'C');
 $pdf->Cell(37,$h,'Name',1,0,'C');
 $pdf->Cell(20,$h,'Type',1,0,'C');
 $pdf->Cell(34,$h,'Position',1,0,'C');
 $pdf->Cell(40,$h,'Department',1,1,'C');
 
 

while($rows=mysqli_fetch_array($result)){
    $pdf->SetFont('Times','',12);
    $pdf->Cell(12,$h,$rows['user_id'],1,0,'L');
    $pdf->Cell(26,$h,$rows['username'],1,0,'L');
    $pdf->Cell(20,$h,$rows['password'],1,0,'C');
    $pdf->Cell(37,$h,$rows['name'],1,0,'C');
    $pdf->Cell(20,$h,$rows['type'],1,0,'C');
    $pdf->Cell(34,$h,$rows['pos_name'],1,0,'C');
    $pdf->Cell(40,$h,$rows['dept_name'],1,1,'L');
}
$pdf->Output();
?>