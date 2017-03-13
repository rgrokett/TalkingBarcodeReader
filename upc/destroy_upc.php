<?php

$upc = intval($_REQUEST['upc']);

include 'conn.php';

$sql = "delete from upcdata where upc=$upc";
$result = $db->exec($sql);
if ($result){
	echo json_encode(array('success'=>true));
} else {
	echo json_encode(array('errorMsg'=>'Some errors occured.'));
}
?>
