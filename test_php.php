<?php
if ($_GET) {
    $argument1 = $_GET['argument1'];
    $argument2 = $_GET['argument2'];
} else {
    $argument1 = $argv[1];
    $argument2 = $argv[2];
}
?>

<? php echo '<p>Hello World</p>'; ?>
