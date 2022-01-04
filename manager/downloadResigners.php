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
$result = mysqli_query($con,"SELECT * FROM leftcomp ");

$h=5;
 $pdf->SetFont('Times','B',20);
 $pdf->Cell(180,$h,'Resigners List',0,1,'C');
 $pdf->Ln(10);
 $pdf->SetFont('Times','B',13);
 $pdf->Cell(20,$h,'id',1,0,'C');
 $pdf->Cell(40,$h,'Name',1,0,'C');
 $pdf->Cell(50,$h,'Subject',1,0,'C');
 $pdf->Cell(75,$h,'Reason',1,1,'C');
 
 

while($rows=mysqli_fetch_array($result)){
    $pdf->SetFont('Times','',12);
    $pdf->Cell(20,$h,$rows['emp_id'],1,0,'L');
    $pdf->Cell(40,$h,$rows['spt_name'],1,0,'L');
    $pdf->Cell(50,$h,$rows['spt_subject'],1,0,'L');
    $pdf->Cell(75,$h,$rows['spt_description'],1,1,'L');
}
$pdf->Output();
?>