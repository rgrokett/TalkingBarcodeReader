<?php
	$page = isset($_POST['page']) ? intval($_POST['page']) : 1;
	$rows = isset($_POST['rows']) ? intval($_POST['rows']) : 10;
        $upc = isset($_POST['upc']) ? htmlspecialchars($_REQUEST['upc']) : "";

	$offset = ($page-1)*$rows;
	$result = array();

	include 'conn.php';
	
	$rs ="select count(*) from upcdata";
	$res = $db->query($rs);
	$row = $res->fetchArray();
	$result["total"] = $row[0];

	$where = "";
	if ($upc) {
	  $where = "where upc = '$upc'";
	}
	$rs = "select * from upcdata " . $where . " limit $offset,$rows";
	$res = $db->query($rs);
	
	$items = array();
	while($row = $res->fetchArray()){
		array_push($items, $row);
	}
	$result["rows"] = $items;

	echo json_encode($result);

?>
