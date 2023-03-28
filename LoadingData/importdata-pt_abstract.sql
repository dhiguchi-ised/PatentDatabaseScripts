CREATE TABLE temp (
    patentnumber_id int,
    abstracttextsequencenumber int,
    langfilingcode VARCHAR(2),
    abstractlangcode VARCHAR(2),
    abstracttext TEXT,
    id int
);

\COPY temp (patentnumber_id, abstracttextsequencenumber, langfilingcode, abstractlangcode, abstracttext, id) FROM 'C:/Users/Higuchid/Documents/PatentsData/PT_ABSTRACT/PT_abstract_1_to_2000000_2022-12-08_new.csv' WITH DELIMITER '|' NULL AS 'NULL' CSV HEADER QUOTE '[' encoding 'UTF8';

\COPY temp (patentnumber_id, abstracttextsequencenumber, langfilingcode, abstractlangcode, abstracttext, id) FROM 'C:/Users/Higuchid/Documents/PatentsData/PT_ABSTRACT/PT_abstract_2000001_to_4000000_2022-12-08_new.csv' WITH DELIMITER '|' NULL AS 'NULL' CSV HEADER QUOTE '[' encoding 'UTF8';

INSERT INTO patents_pt_abstract (patentnumber_id, langfilingcode, abstractlangcode, abstracttext, id)
SELECT patentnumber_id, langfilingcode, abstractlangcode, abstracttext, id
FROM temp;

DROP TABLE temp;