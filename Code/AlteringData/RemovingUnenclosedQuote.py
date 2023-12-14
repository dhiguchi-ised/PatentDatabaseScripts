import csv
import os

csv.field_size_limit(10000000)
PATH = 'C:/Users/HiguchiD/Documents/virtualenv/PatentDatabaseScripts/InputFiles'
i=1

for file in os.listdir(PATH):
    filepath = os.path.join(PATH, file).replace('\\', '/')
    # Open the input file and create a new output file
    with open(filepath, 'r', encoding='utf-8') as infile, open('RemovingUnenclosedQuote-SampleOutput.csv', 'w', newline='') as outfile:
        reader = csv.reader(infile, delimiter='|', quotechar='\b')
        writer = csv.writer(outfile, delimiter='|')
        
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

        