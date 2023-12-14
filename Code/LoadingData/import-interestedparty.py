import os
import psycopg2
from psycopg2 import Error

# Modify the following to specify directory with csv's to copy and table to copy into
directory = 'C:/Users/HiguchiD/Documents/virtualenv/Data/InterestedParty' 
table_name = 'patents_pt_interested_party'

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
                    cur.copy_expert("COPY %s (patentnumber_id, agenttypecode, appltypecode, interestedpartytypecode, interestedpartytype, ownerenabledate, ownerenddate, partyname, partyaddressline1, partyaddressline2, partyaddressline3, partyaddressline4, partyaddressline5, partycity, partyprovincecode, partyprovince, partypostalcode, partycountrycode, partycountry, id) FROM STDIN WITH QUOTE E'\b' DELIMITER E'|' CSV HEADER NULL AS 'NULL' encoding 'UTF8'" % table_name, csv_file)
                except Error as e:
                    print(f"Error copying data from {filename}: {e}")
                
    # Additional data cleaning and updates
    update_queries = [
        "UPDATE patents_pt_interested_party SET agenttypecode = NULL WHERE agenttypecode = '-2'",
        "UPDATE patents_pt_interested_party SET appltypecode = NULL WHERE appltypecode = '-2'",
        "UPDATE patents_pt_interested_party SET partyaddressline5 = NULL WHERE partyaddressline5 = 'NA'",
        "UPDATE patents_pt_interested_party SET partyprovincecode = NULL WHERE partyprovincecode = '-1'",
        "UPDATE patents_pt_interested_party SET partyprovincecode = NULL WHERE partyprovincecode = 'XX'",
        "UPDATE patents_pt_interested_party SET partyprovince = NULL WHERE partyprovince = 'Unknown'",
        "UPDATE patents_pt_interested_party SET partypostalcode = NULL WHERE partypostalcode = '-1'",
        "UPDATE patents_pt_interested_party SET partycountrycode = NULL WHERE partycountrycode = '-1'",
        "UPDATE patents_pt_interested_party SET partycountrycode = NULL WHERE partycountrycode = 'XX'",
        "UPDATE patents_pt_interested_party SET partycountry = NULL WHERE partycountry = 'Country Unknown'",
        "UPDATE patents_pt_interested_party SET partycountry = NULL WHERE partycountry = 'Unknown'"
        # Add more update queries as needed
    ]

    for update_query in update_queries:
        try:
            cur.execute(update_query)
        except Error as e:
            print(f"Error executing update query: {e}")

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