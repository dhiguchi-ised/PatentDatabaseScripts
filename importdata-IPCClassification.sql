\c patentsdata

\COPY pt_ipc_classification FROM 'C:/Users/Higuchid/Documents/PatentsData/PT_IPC_CLASSIFICATION/PT_IPC_classification_1_to_2000000_2022-12-08.csv' WITH DELIMITER '|' NULL AS 'NULL' CSV HEADER;

\COPY pt_ipc_classification FROM 'C:/Users/Higuchid/Documents/PatentsData/PT_IPC_CLASSIFICATION/PT_IPC_classification_2000001_to_4000000_2022-12-08.csv' WITH DELIMITER '|' NULL AS 'NULL' CSV HEADER;