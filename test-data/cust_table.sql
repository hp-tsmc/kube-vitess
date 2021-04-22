CREATE TABLE TRX_CPO_CUST_ESCAL_MAST(
	`ESCAL_SEQ` int AUTO_INCREMENT NOT NULL,
	`ESCAL_NO` varchar(64) NOT NULL,
	`ESCAL_DATE` date NULL,
	`CUST` varchar(64) NULL,
	`CUST_REGION` varchar(32) NULL,
	`WHO` Longtext NOT NULL,
	`EXECUTIVE` Longtext NOT NULL,
	`STATUS` varchar(32) NULL,
	`TOPIC` Longtext NOT NULL,
	`REMARK` Longtext NOT NULL,
	`VALUE` int NOT NULL,
	`IS_READ` varchar(1) NULL,
	`IS_DELETE` varchar(1) NULL,
	`CREATE_USER` varchar(30) NULL,
	`CREATE_DT` datetime(3) NULL,
	`UPDATE_USER` varchar(30) NULL,
	`UPDATE_DT` datetime(3) NULL,
 CONSTRAINT `PK_TRX_CPO_CUST_ESCAL_MAST` PRIMARY KEY 
(
	`ESCAL_SEQ` ASC
) 
);
