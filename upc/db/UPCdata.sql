BEGIN;
CREATE TABLE upcdata (upc INT PRIMARY KEY, desc TEXT);
.separator ,
.import UPCdata.csv upcdata
COMMIT;

