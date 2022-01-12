<?php
error_reporting(0); // AGAR ERROR MASALAH VERSI PHP TIDAK MUNCUL
$pdf = new FPDF('L', 'mm', 'Letter');
$pdf->AddPage();
$pdf->SetFont('Arial', 'B', 16);
$pdf->Cell(0, 7, 'DAFTAR PEMESAN', 0, 1, 'C');
$pdf->Cell(10, 7, '', 0, 1);
$pdf->SetFont('Arial', 'B', 10);
$pdf->Cell(90, 6, 'id_pelanggan', 1, 0, 'C');
$pdf->Cell(130, 6, $invoice->id, 1, 1, 'C');
$pdf->Cell(90, 6, 'Nama Pemesan', 1, 0, 'C');
$pdf->Cell(130, 6, $invoice->nama, 1, 1, 'C');



$pdf->Cell(90, 6, 'Nama pesanan', 1, 0, 'C');
$pdf->Cell(90, 6, 'Jumlah Pesanan', 1, 0, 'C');
$pdf->Cell(40, 6, 'harga', 1, 1, 'C');
foreach ($pesanan as $psn) {
    $subtotal = $psn->jumlah * $psn->harga;
    $total += $subtotal;
    $pdf->SetFont('Arial', 'i', 10);
    $pdf->Cell(90, 6, $psn->nama_brg, 1, 0, 'C');
    $pdf->Cell(90, 6, $psn->jumlah, 1, 0, 'C');
    $pdf->Cell(40, 6, $psn->harga, 1, 1, 'C');
}
$pdf->SetFont('Arial', 'B', 10);
$pdf->Cell(90, 6, 'Total', 1, 0, 'C');
foreach ($pesanan as $psn) {
    $subtotal = $psn->jumlah * $psn->harga;
    $bayar += $subtotal;
}
$total = $bayar;
$pdf->Cell(130, 6, $total, 1, 1, 'C');
// $pegawai = $this->db->get('pegawai')->result();
// $no = 0;
// foreach ($invoice as $data) {
//     $pdf->Cell(10, 6, $data->id, 1, 0, 'C');
//     $pdf->Cell(90, 6, $data->nama, 1, 0);
//     // $pdf->Cell(120, 6, $data->alamat, 1, 0);
//     // $pdf->Cell(40, 6, $data->telp, 1, 1);
// }



$pdf->Output();
