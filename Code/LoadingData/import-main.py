import os
import psycopg2
from psycopg2 import Error

# Modify the following to specify directory with csv's to copy and table to copy into
directory = 'C:/Users/HiguchiD/Documents/virtualenv/Data/Main' 
table_name = 'patents_pt_main'

try:

    # Establish a connection to the PostgreSQL database
    conn = psycopg2.connect(
        database='postgres',
        user='postgres',
        password='ised',
        host='localhost',
        port='5440'
    )

    # Create a cursor
    cur = conn.cursor()

    # List CSV files in the directory and copy them into table
    for filename in os.listdir(directory):
        if filename.endswith('.csv'):
            filepath = os.path.join(directory, filename)
            with open(filepath, 'r', encoding="utf-8") as csv_file:
                try:
                    cur.copy_expert("COPY %s (patentnumber, filingdate, grantdate, appstatuscode, apptypecode, patenttitleenglish, patenttitlefrench, bibliographicfileextractdate, countryofpublicationcode, documentkindtype, examinationrequestdate, filingcountrycode, langfilingcode, licenseforsaleindicator, pctappnumber, pctpubnumber, pctpubdate, parentappnumber, pctarticle2239fulfilleddate, pctsect371date, pctpubcountrycode, pubkindtype, printedasamendedcountrycode) FROM STDIN WITH QUOTE E'\b' DELIMITER E'|' CSV HEADER NULL AS 'NULL' encoding 'UTF8'" % table_name, csv_file)
                except Error as e:
                    print(f"Error copying data from {filename}: {e}")
                
    # Commit the changes and close the connection
    conn.commit()

except Error as e:
    print(f"Error connecting to the database: {e}")

finally:
    # Close the cursor and connection in the finally block
    if 'cur' in locals():
        cur.close()
    if 'conn' in locals():
        conn.close()