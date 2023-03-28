import csv
import os

csv.field_size_limit(10000000)
PATH = 'C:/Users/Higuchid/Documents/PatentsData/PT_CLAIM'
i=1

for file in os.listdir(PATH):
    filepath = os.path.join('PT_CLAIM', file).replace('\\', '/')
    with open(filepath, 'r', encoding='utf-8') as file:
        reader = csv.reader(file, delimiter='|', quotechar='[')
        
        headers = next(reader)
        headers.append('id')
        
        filename = filepath[:-4] + '_new.csv'
        
        with open(filename, 'w', newline='', encoding='utf-8') as new_file:
            writer = csv.writer(new_file, delimiter='|', quotechar='[')
            writer.writerow(headers)
            
            for j, row in enumerate(reader, start=1):
                row.append(i)
                writer.writerow(row)
                i = i + 1
