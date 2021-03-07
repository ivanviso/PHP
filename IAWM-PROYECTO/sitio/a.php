<?php 
header("Cache-Control: no-store, no-cache");
header('Content-Disposition: attachment; filename="content.txt"');

$file = fopen('php://output','w');
fwrite($file, "miamimua");
?>