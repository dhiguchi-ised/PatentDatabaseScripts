
\COPY patents_pt_priority_claim (patentnumber_id, foreignapp_patnumber, priorityclaimkindcode, priorityclaimcountrycode, priorityclaimcountry, priorityclaimcalendardate, id) FROM 'C:/Users/Higuchid/Documents/PatentsData/PT_PRIORITY_CLAIM/PT_priority_claim_1_to_2000000_2022-12-08_new.csv' WITH DELIMITER '|' NULL AS 'NULL' CSV HEADER QUOTE '[';

\COPY patents_pt_priority_claim (patentnumber_id, foreignapp_patnumber, priorityclaimkindcode, priorityclaimcountrycode, priorityclaimcountry, priorityclaimcalendardate, id) FROM 'C:/Users/Higuchid/Documents/PatentsData/PT_PRIORITY_CLAIM/PT_priority_claim_2000001_to_4000000_2022-12-08_new.csv' WITH DELIMITER '|' NULL AS 'NULL' CSV HEADER QUOTE '[';