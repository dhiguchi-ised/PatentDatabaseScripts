import csv
import os

csv.field_size_limit(10000000)
PATH = 'C:/Users/HiguchiD/Documents/Data/test'
i=1

for file in os.listdir(PATH):
    filepath = os.path.join(PATH, file).replace('\\', '/')
    # Open the input file and create a new output file
    with open(filepath, 'r', encoding='utf-16') as infile, open('output.csv', 'w', newline='') as outfile:
        reader = csv.reader(infile, delimiter='\t', quotechar='\b')
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

# # Open the input file and create a new output file
# with open('Test/PT_IPC_classification_2000001_to_4000000_2022-12-08_new.csv', 'r') as infile, open('output.csv', 'w', newline='') as outfile:
#     reader = csv.reader(infile)
#     writer = csv.writer(outfile)
    
#     # Loop through each row of the input file
#     for row in reader:
#         # Loop through each field in the row
#         for i, field in enumerate(row):
#             # Check if the field has an odd number of quotation marks
#             if field.count('"') % 2 == 1:
#                 # Remove unenclosed quotation marks from the field
#                 row[i] = row[i].replace('"', '')
#         # Write the updated row to the output file
#         writer.writerow(row)


# with open(filepath, 'r', encoding='utf-16') as file:
#     reader = csv.reader(file, delimiter='\t', quotechar='[')
    
#     headers = next(reader)
#     headers.append('id')
    
#     filename = filepath[:-4] + '_new.csv'
    
#     with open(filename, 'w', newline='', encoding='utf-16') as new_file:
#         writer = csv.writer(new_file, delimiter='\t', quotechar='[')
#         writer.writerow(headers)
        
#         for j, row in enumerate(reader, start=1):
#             row.append(i)
#             writer.writerow(row)
#             i = i + 1
        