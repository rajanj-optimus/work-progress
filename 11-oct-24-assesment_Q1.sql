--create database dbb;
CREATE TABLE
t_product_master (Product_ID VARCHAR(5) PRIMARY KEY,Product_Name VARCHAR(25) NOT NULL,Cost_Per_Item Decimal NOT NULL);

INSERT INTO t_product_master (Product_ID,Product_Name,Cost_Per_Item)
VALUES 
('P1','Pen',10),
('P2','Scale',15),
('P3','Note Book',25);

select * from t_product_master;
--DROP TABLE t_product_master;

CREATE TABLE t_user_master (User_ID VARCHAR (5) PRIMARY KEY,User_Name VARCHAR(25) NOT NULL);
INSERT INTO t_user_master (User_ID,User_Name)
VALUES
('U1','Alfred Lawrence'),
('U2','William Paul'),
('U3','Edward Fillip')
select * from t_user_master;

CREATE TABLE 
transaction_table (User_Id varchar(5) FOREIGN KEY REFERENCES t_user_master ,Product_ID VARCHAR(5) FOREIGN KEY REFERENCES t_product_master,Transaction_Date DATE NOT NULL,Transaction_Type VARCHAR(10) NOT NULL ,Transaction_Amount DECIMAL,CONSTRAINT chk_transaction_type check (Transaction_Type in('Order','Payment')));
INSERT INTO transaction_table 
VALUES
('U1','P1','2010-10-25','Order',150),
('U1','P1','2010-11-20','Payment',750),
('U1','P1','2010-11-20','Order',200),
('U1','P3','2010-11-25','Order',50),
('U3','P2','2010-11-26','Order',100),
('U2','P1','2010-12-15','Order',75),
('U3','P2','2011-01-15','Payment',250)

select * from transaction_table;


go;


--QUERY
with Order_Detail as
(
		SELECT 
		 t1.User_Id,
		 t1.Product_ID,
		 sum(t1.transaction_amount)as Ordered_Quantity,
		 max(t1.transaction_Date)as Last_Order_Date 
		 from 
		 transaction_table AS t1 
		 where t1.Transaction_Type='Order'
		 GROUP BY t1.User_Id, t1.Product_ID 
 ),
 Payment_Detail as
 (
	    select
		t2.User_Id,
		t2.Product_ID,
		sum(t2.transaction_amount)as Amount_Paid,
		max(t2.transaction_Date)as Last_Payment_Date
		FROM transaction_table as t2
		where t2.Transaction_Type='Payment'
		Group by t2.User_Id , t2.Product_ID
)
--select * from Order_Detail;
--select * from Payment_Detail;

SELECT 
u1.User_Name,
p1.Product_Name,
Order_Detail.Ordered_Quantity ,
coalesce(Payment_Detail.Amount_Paid,0)as amount_paid,
case
	when Payment_Detail.Last_Payment_Date is NULL then Order_Detail.Last_Order_Date
	else iif(Order_Detail.Last_Order_Date>=Payment_Detail.Last_Payment_Date,Order_Detail.Last_Order_Date,Payment_Detail.Last_Payment_Date)
end as last_transaction_date,
(p1.Cost_Per_Item * Order_Detail.Ordered_Quantity- COALESCE(Payment_Detail.Amount_Paid,0)) as Balance
	 FROM 
	  Order_Detail
	 left join
	  Payment_Detail
	 on Order_Detail.User_Id=Payment_Detail.User_Id and Order_Detail.Product_ID=Payment_Detail.Product_ID
	 join 
	 t_product_master as p1
	 on p1.Product_ID=Order_Detail.Product_ID
	 join 
	 t_user_master as u1
	 on u1.User_ID=Order_Detail.User_Id




--with Order_Detail as



