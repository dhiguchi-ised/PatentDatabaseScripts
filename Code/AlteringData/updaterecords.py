import psycopg2

def connect_to_database(host, database, user, password):
    # Connect to the PostgreSQL database
    conn = psycopg2.connect(host=host, database=database, user=user, password=password)
    return conn

def update_records(conn, table_name, records):
    # Create a cursor object
    cursor = conn.cursor()

    try:
        for record in records:
            # Extract values from the record dictionary
            update_values = ", ".join([f"{key}='{value}'" for key, value in record['update_values'].items()])
            conditions = record['conditions']

            # Construct the SQL query
            update_query = f"UPDATE {table_name} SET {update_values} WHERE {conditions}"

            # Execute the update query
            cursor.execute(update_query)

        # Commit the changes to the database
        conn.commit()

        print("Records updated successfully.")
    except Exception as e:
        print(f"Error: {e}")
    finally:
        # Close the cursor
        cursor.close()

def main():
    # Replace with your PostgreSQL database connection details
    db_params = {
        'host': 'localhost',
        'database': 'postgres',
        'user': 'postgres',
        'password': 'ised',
    }

    # Replace 'your_table' with the actual table name
    table_name = 'your_table'

    # Specify the records as a list of dictionaries
    records = [
        {'update_values': {'column1': 'new_value1', 'column2': 42}, 'conditions': "id=1"},
        {'update_values': {'column1': 'new_value2', 'column2': 43}, 'conditions': "id=2"},
        # Add more records as needed
    ]

    # Connect to the PostgreSQL database
    conn = connect_to_database(**db_params)

    # Update the records
    update_records(conn, table_name, records)

    # Close the database connection
    conn.close()

if __name__ == "__main__":
    main()