import mysql.connector as conn
import pandas as pd
import pymongo
import json
import os

#Creating connection with Mysql

mydb = conn.connect(host = 'Localhost', user = 'root', passwd = 'Rajadhi@15', use_pure= True)
print(mydb)

#Running SQL query

sql_q1 = pd.read_sql('select * from task. Atribute_dataset_R1', mydb)
sql_q2 = pd.read_sql('select * from task.dress_sales_d1',mydb)
#print(sql_q1)
#print(sql_q2)



#Converting SQL into Dataframe
Atribute_data = pd.DataFrame(sql_q1, columns =['Dress_ID', 'Style', 'Price', 'Rating', 'Size', 'Season', 'NeckLine',
       'SleeveLength', 'waiseline', 'Material', 'FabricType', 'Decoration',
       'Pattern Type', 'Recommendation'] )

dress_sales = pd.DataFrame(sql_q2, columns =['Dress_ID', '29-08-2013', '31-08-2013', '09-02-2013', '09-04-2013',
       '09-06-2013', '09-08-2013', '09-10-2013', '09-12-2013', '14-09-2013',
       '16-09-2013', '18-09-2013', '20-09-2013', '22-09-2013', '24-09-2013',
       '26-09-2013', '28-09-2013', '30-09-2013', '10-02-2013', '10-04-2013',
       '10-06-2013', '10-08-2010', '10-10-2013', '10-12-2013'] )

#print(attribute_data) #Coming Correctly
#print(dress_sales) #Coming Correctly

#Task 4
#Convert attribute dataset dataframe into json format
attribute_dataset_json = Atribute_data.to_json("D:\data_fsds\Attribute_Data123.json")
dress_sales_dataset_json = dress_sales.to_json("D:\data_fsds\dress_sales456.json")
#print(attribute_dataset_json)
print(dress_sales_dataset_json)

# Store this dataset into mongodbb

from pymongo import MongoClient

client = pymongo.MongoClient("mongodb+srv://rajesh1504:rajesh1504@atlascluster.zxudjtu.mongodb.net/?retryWrites=true&w=majority")
db = client.test

#Creating Database
db1 = client['Task']
#Creating Collection/Document inside Database (Same as creating Tables inside Database in SQL Systems)
collection = db1["Json"]
#Replacing single quotes with double quotes on attribute_data_json to make it valid json

print(attribute_dataset_json)

#Storing JSON Data into MongoDB
# Loading or Opening the json file
# with open(r'D:\data_fsds\Attribute_Data123.json') as file:
#     file_data = json.load(file)

# Inserting the loaded data in the Collection
# if JSON contains data more than one entry
# insert_many is used else insert_one is used


# if isinstance(file_data, list):
#     collection.insert_many(file_data)
# else:
#     collection.insert_one(file_data)

#Task 6 (Left Join)
#convert year variable in dress_sale to integer
dress_sales['Dress_ID']= dress_sales['Dress_ID'].astype(int)
left_join = pd.merge(Atribute_data, dress_sales, how = 'left', on = 'Dress_ID')
#print(left_join)

#Task 7
#Write the SQL query to find out how many unique dress that we have based on Dress_ID
cursor = mydb.cursor()
cursor.execute("select count(distinct(dress_id)) from task.dress_sales_d1")
for i in cursor.fetchall():
  print(i)

# Task 8
# Try to find out how many dress is having recommendation as 0
print((sql_q1.Recommendation == 0).sum())


