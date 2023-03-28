\COPY patents_pt_main FROM 'C:/Users/Higuchid/Documents/PatentsData/PT_MAIN/PT_main_1_to_2000000_2022-12-08.csv' WITH DELIMITER '|' NULL AS 'NULL' CSV HEADER QUOTE '[';

\COPY patents_pt_main FROM 'C:/Users/Higuchid/Documents/PatentsData/PT_MAIN/PT_main_2000001_to_4000000_2022-12-08.csv' WITH DELIMITER '|' NULL AS 'NULL' CSV HEADER QUOTE '[';