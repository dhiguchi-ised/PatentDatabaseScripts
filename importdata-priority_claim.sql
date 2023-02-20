\c patentsdata

\COPY pt_priority_claim FROM 'C:/Users/Higuchid/Documents/PatentsData/PT_PRIORITY_CLAIM/PT_priority_claim_1_to_2000000_2022-12-08.csv' WITH DELIMITER '|' NULL AS 'NULL' CSV HEADER;

\COPY pt_priority_claim FROM 'C:/Users/Higuchid/Documents/PatentsData/PT_PRIORITY_CLAIM/PT_priority_claim_2000001_to_4000000_2022-12-08.csv' WITH DELIMITER '|' NULL AS 'NULL' CSV HEADER;