# Purpose of Scripts
These scripts were used in the process of creating a database for the patent data from the Patents Researcher Dataset.

# Altering Data
This folder has two scripts.

RemovingUnenclosedQuote.py is a script that goes through every field of every entry in a csv. It ensures each field only has an even number of quotation characters (whatever the quotation character is specified as), and if there is an odd number, it will remove all the quotations from that field. This script was created because many of the csv files for the patent data are poorly formatted and contain lots of unenclosed quotations that affect the scripts that import the data.

addingIDColumn.py is a script that adds a new column to a csv that will contain a sequence of numbers, intended to give every table a column that has unique numbers. This script was needed as the data did not have a unique column that could be used as a primary key.

# Loading Data
This folder has 8 scripts.

There is a script for individually loading data for each table, and one main script that will load data into all the tables in one execution. The main table must be loaded in first always.

Each script, as of right now, is hard coded to load each csv file into the specified tables, rather than being able to load all csvs in a specified directory.

# Table Scripts
In this folder there are currently two scripts.

creatingpatenttables.sql is a script to create tables for all the different types of data including, disclosure, claim, priority claim, interested party, ipc classification, abstract, and main data. The tables are related such that each table has a many-to-one relationship with the main table based on the patent number field. Since main is the only table that has its patentnumber field as unique, each table also has its own id field generated through the addingIDColumn.py script.

dropalltables.sql is a script to delete all the tables that are created by the creatingpatenttables.sql script.