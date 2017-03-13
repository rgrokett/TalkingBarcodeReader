

sqlite3 '../db/UPCdata.db' "insert into upcdata (upc,desc) values (\"$1\",\"$2\");"

