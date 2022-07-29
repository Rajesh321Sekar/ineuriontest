create database Task
use Task
show databases
show tables

#Creating table for Attribute Dataset
create table if not exists Atribute_dataset_R1
(Dress_ID int,
Style varchar(50),
Price varchar(50),
Rating decimal(2,1),
Size char(15),
Season varchar(50),
NeckLine varchar(50),
SleeveLength varchar(50),
waiseline varchar(50),
Material varchar(50),
FabricType varchar(50),
Decoration varchar(50),
PatternType varchar(50),
Recommendation int)

# inserting Attribute Dataset Records
LOAD DATA INFILE 'D:/data_fsds/Attribute_DataSet.csv' INTO TABLE Atribute_dataset_R1
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

### Fetching all the records from attribute_dataset_R1
select * from Atribute_dataset_R1

#Creating table for Dress Sales Dataset
create table if not exists dress_sales_d1
(
Dress_ID varchar(30),
`29/8/2013` varchar(30),
`31/8/2013` varchar(30),
`09/02/2013` varchar(30),
`09/04/2013` varchar(30),
`09/06/2013` varchar(30), 
`09/08/2013` varchar(30),
`09/10/2013` varchar(30),
`09/12/2013` varchar(30),	
`14/9/2013` varchar(30),
`16/9/2013` varchar(30),
`18/9/2013` varchar(30),
`20/9/2013` varchar(30),
`22/9/2013` varchar(30),
`24/9/2013` varchar(30),
`26/9/2013` varchar(30),	
`28/9/2013` varchar(30),
`30/9/2013` varchar(30),
`10/02/2013` varchar(30),
`10/04/2013` varchar(30),
`10/06/2013` varchar(30),
`10/08/2010` varchar(30),
`10/10/2013` varchar(30),
`10/12/2013` varchar(30)
);

 # Loading data from  Dress sales Dataset 
LOAD DATA INFILE 'D:/data_fsds/Dress_Sales.csv' INTO TABLE dress_sales_d1
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

#describing the dataset data type
describe dress_sales_d1

## Fetching all the records from dress_dataset
select * from  dress_sales_d1;

select Atribute_dataset_R1.Dress_ID , Atribute_dataset_R1.Style,Atribute_dataset_R1.Rating, dress_sales_d1.`29/8/2013` from Atribute_dataset_R1 left join dress_sales_d1 on Atribute_dataset_R1.Dress_ID = dress_sales_d1.Dress_ID

select Atribute_dataset_R1.Dress_ID , Atribute_dataset_R1.Style,Atribute_dataset_R1.Rating, dress_sales_d1.`29/8/2013` from Atribute_dataset_R1 inner join dress_sales_d1 on Atribute_dataset_R1.Dress_ID = dress_sales_d1.Dress_ID

#Task 7
#Write the SQL query to find out how many unique dress that we have based on Dress_ID

select count(distinct(Dress_ID)) from Atribute_dataset_R1

# Task 8
# Try to find out how many dress is having recommendation as 0
select count(dress_id) from Atribute_dataset_R1 where recommendation = 0;

#Task 9
#Sum of sales of each individual Dress_id

select dress_id,('29-08-2013'+'31-08-2013'+'09-02-2013'+'09-04-2013'+
       '09-06-2013'+'09-08-2013'+'09-10-2013'+'09-12-2013'+'14-09-2013' 
       '16-09-2013'+'18-09-2013'+'20-09-2013'+'22-09-2013'+'24-09-2013'+
       '26-09-2013'+'28-09-2013'+ '30-09-2013'+'10-02-2013'+'10-04-2013'+
       '10-06-2013'+'10-08-2010'+ '10-10-2013'+'10-12-2013')  as Total_sales from dress_sales_d1;
       
 ### Question - 10. Third highest most selling dress
SELECT dress_id,('29-08-2013'+'31-08-2013'+'09-02-2013'+'09-04-2013'+
       '09-06-2013'+'09-08-2013'+'09-10-2013'+'09-12-2013'+'14-09-2013' 
       '16-09-2013'+'18-09-2013'+'20-09-2013'+'22-09-2013'+'24-09-2013'+
       '26-09-2013'+'28-09-2013'+ '30-09-2013'+'10-02-2013'+'10-04-2013'+
       '10-06-2013'+'10-08-2010'+ '10-10-2013'+'10-12-2013') AS Total_sales FROM dress_sales_d1 order by Total_sales desc limit 1 offset 2;      
 