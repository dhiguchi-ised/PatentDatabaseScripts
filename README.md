# Purpose of Scripts
These scripts were used in the process of creating a database for the patent data from the Patents Researcher Dataset used by the Django API project.

# Altering Data
This folder has 10 scripts, 8 relating to adding the unique id columns to the tables and 1 for removing any unenclosed quotations in the data.

RemovingUnenclosedQuote.py is a script that goes through every field of every entry in a csv. It ensures each field only has an even number of quotation characters (whatever the quotation character is specified as), and if there is an odd number, it will remove all the quotations from that field. This script was created because many of the csv files for the patent data are poorly formatted and contain lots of unenclosed quotations that affect the scripts that import the data.

addingIDColumn.py is a script that adds a new column to a csv that will contain a sequence of numbers, intended to give every table a column that has unique numbers. This script was needed as the data did not have a unique column that could be used as a primary key. There is a version for each table (except main because it does not need an ID column), and a master script that will execute all of them.

updaterecords.py is a script that is designed to allow users to modify specific records in the specified database. To specify which records to update, in the main function, records is a list of dictionaries where the key 'update_values' will have a dictionary value for columns and what we want the value to be changed to, and the key 'conditions' has a value specifying which records will receive the updates. This will be used during the maintenance stage of the API.

# Loading Data
This folder has 10 scripts and an archive for out-of-date scripts used for loading data.

There is a python script for individually loading data for each table, and one main script that will load data into all the tables in one execution. The main table must have its data loaded into first before any of the other tables. The script importdata-master.bat will run all of the python scripts designed for each table in an appropriate order.

The script importdata.py is the template that all the other scripts were adjusted from, the only changes being to target the different tables in the database and where to load the data from.

XMLdataloader.py is a work-in-progress script to load the XML weekly patent researcher datasets into the PostgreSQL database so that our database can be updated weekly with the most recent data. Current challenges are drawing linkages between the tags in the XML file and which table and column name the data should be loaded into.

# Table Scripts
In this folder there are currently two scripts.

NOTE: creatingpatenttables.sql is an out of date script that is advised against using for creating the tables in the database. The models defined for the Django API will create the tables in the database when making your first migration. This is done by performing 'python manage.py makemigrations' followed by 'python manage.py migrate' in the API project folder. If a table happens to be deleted and needs to be recreated, you must delete the migrations folder for the Django API, and then running "DELETE FROM django_migrations WHERE app = 'app_name'" before performing the migrations again to create the tables.

creatingpatenttables.sql is a script to create tables for all the different types of data including, disclosure, claim, priority claim, interested party, ipc classification, abstract, and main data. The tables are related such that each table has a many-to-one relationship with the main table based on the patent number field. Since main is the only table that has its patentnumber field as unique, each table also has its own id field generated through the addingIDColumn.py script.

dropalltables.sql is a script to delete all the tables that are created by the creatingpatenttables.sql script.