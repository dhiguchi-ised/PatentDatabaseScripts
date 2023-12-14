import os
import csv
import psycopg2

# Modify the following to specify directory with csv's to copy and table to copy into
directory = 'C:/Users/HiguchiD/Documents/virtualenv/Data/InterestedParty' 
table_name = 'patents_pt_interested_party'

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
            cur.copy_expert("COPY %s (patentnumber_id, agenttypecode, appltypecode, interestedpartytypecode, interestedpartytype, ownerenabledate, ownerenddate, partyname, partyaddressline1, partyaddressline2, partyaddressline3, partyaddressline4, partyaddressline5, partycity, partyprovincecode, partyprovince, partypostalcode, partycountrycode, partycountry, id) FROM STDIN WITH QUOTE E'\b' DELIMITER E'|' CSV HEADER NULL AS 'NULL' encoding 'UTF8'" % table_name, csv_file)
            #cur.execute("CREATE TABLE temp (patentnumber_id int, abstractsequencenumber int, abstractlangcode VARCHAR(2), abstractlang VARCHAR(25), abstracttext TEXT, id int)")
            #cur.copy_expert("COPY temp (patentnumber_id, abstractsequencenumber, abstractlangcode, abstractlang, abstracttext, id) FROM STDIN WITH QUOTE E'\b' DELIMITER E'\t' CSV HEADER NULL AS '' encoding 'UTF8'", csv_file)
            #cur.execute("INSERT INTO patents_pt_abstract (patentnumber_id, abstractlangcode, abstractlang, abstracttext, id) SELECT patentnumber_id, abstractlangcode, abstractlang, abstracttext, id FROM temp")
            #cur.execute("DROP TABLE temp")
            #(patentnumber_id, disclosuretextsequencenumber, parentappnumber, pctarticle2239fulfilleddate, pctappnumber, pctsect371date, pctpubcountrycode, pctpubnumber, pctpubdate, pubkindtype, printedasamendedcountrycode, disclosuretext, id)

cur.execute("UPDATE patents_pt_interested_party SET agenttypecode = NULL WHERE agenttypecode = '-2'")
cur.execute("UPDATE patents_pt_interested_party SET appltypecode = NULL WHERE appltypecode = '-2'")
cur.execute("UPDATE patents_pt_interested_party SET partyaddressline5 = NULL WHERE partyaddressline5 = 'NA'")
cur.execute("UPDATE patents_pt_interested_party SET partyprovincecode = NULL WHERE partyprovincecode = '-1'")
cur.execute("UPDATE patents_pt_interested_party SET partyprovincecode = NULL WHERE partyprovincecode = 'XX'")
cur.execute("UPDATE patents_pt_interested_party SET partyprovince = NULL WHERE partyprovince = 'Unknown'")
cur.execute("UPDATE patents_pt_interested_party SET partypostalcode = NULL WHERE partypostalcode = '-1'")
cur.execute("UPDATE patents_pt_interested_party SET partycountrycode = NULL WHERE partycountrycode = '-1'")
cur.execute("UPDATE patents_pt_interested_party SET partycountrycode = NULL WHERE partycountrycode = 'XX'")
cur.execute("UPDATE patents_pt_interested_party SET partycountry = NULL WHERE partycountry = 'Country Unknown'")
cur.execute("UPDATE patents_pt_interested_party SET partycountry = NULL WHERE partycountry = 'Unknown'")
            

# Commit the changes and close the connection
conn.commit()

cur.close()
conn.close()