import csv
import os
import psycopg2

csv.field_size_limit(10000000)
# must make sure that any of the csv's in this folder have not been loaded into the database, if there are, move them
PATH = 'C:/Users/HiguchiD/Documents/virtualenv/Data/Abstract'  

# Connect to your PostgreSQL database
conn = psycopg2.connect(
    database="your_database_name",
    user="your_user",
    password="your_password",
    host="your_host",
    port="your_port"
)

# Create a cursor
cur = conn.cursor()

# Execute a query to get the maximum value from a certain column (e.g., 'your_column_name')
cur.execute("SELECT MAX(id) FROM patents_pt_abstract") # will need separate script for each table
max_value = cur.fetchone()[0]

# Close the database connection
cur.close()
conn.close()

# Set the starting value of i
i = max_value + 1 if max_value is not None else 1

for file in os.listdir(PATH):
    filepath = os.path.join(PATH, file).replace('\\', '/')
    with open(filepath, 'r', encoding='utf-8') as file:
        reader = csv.reader(file, delimiter='|', quotechar='\b')

        headers = next(reader)
        headers.append('id')

        filename = filepath[:-4] + '_new.csv'

        with open(filename, 'w', newline='', encoding='utf-8') as new_file:
            writer = csv.writer(new_file, delimiter='|', quotechar='\b')
            writer.writerow(headers)

            for j, row in enumerate(reader, start=i):
                row.append(j)
                writer.writerow(row)
                i = j + 1