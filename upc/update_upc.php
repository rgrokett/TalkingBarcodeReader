<?php

$upc = htmlspecialchars($_REQUEST['upc']);
$desc = htmlspecialchars($_REQUEST['desc']);

include 'conn.php';

$sql = "update upcdata set upc='$upc',desc='$desc' where upc=$upc";
$result = $db->exec($sql);
if ($result){
	echo json_encode(array(
		'upc' => $upc,
		'desc' => $desc
	));
} else {
	echo json_encode(array('errorMsg'=>'Some errors occured.'));
}
?>
