import csv

# Open the input file and create a new output file
with open('Test/PT_IPC_classification_2000001_to_4000000_2022-12-08_new.csv', 'r') as infile, open('output.csv', 'w', newline='') as outfile:
    reader = csv.reader(infile)
    writer = csv.writer(outfile)
    
    # Loop through each row of the input file
    for row in reader:
        # Loop through each field in the row
        for i, field in enumerate(row):
            # Check if the field has an odd number of quotation marks
            if field.count('"') % 2 == 1:
                # Remove unenclosed quotation marks from the field
                row[i] = row[i].replace('"', '')
        # Write the updated row to the output file
        writer.writerow(row)
        