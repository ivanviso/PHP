<?php
$conn = mysqli_connect("localhost","phpuser","abcABC123","viviroutrasvidas");
if (mysqli_connect_errno()) {
    $errores.="\nFailed to connect to MySQL: " . mysqli_connect_error();
  }
$conn->autocommit(TRUE);
?>