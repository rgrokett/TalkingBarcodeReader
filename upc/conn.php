<?php

$db = new SQLite3('db/UPCdata.db');
if (!$db) {
	die('Could not connect: ' . $db);
}

?>
