\c patentsdata

CREATE TABLE temp (
    patentnumber int,
    abstracttextsequencenumber int,
    langfilingcode VARCHAR(2),
    abstractlangcode VARCHAR(2),
    abstracttext TEXT
);

\COPY temp (patentnumber, abstracttextsequencenumber, langfilingcode, abstractlangcode, abstracttext) FROM 'C:/Users/Higuchid/Documents/PatentsData/PT_ABSTRACT/PT_abstract_1_to_2000000_2022-12-08.csv' WITH DELIMITER '|' NULL AS 'NULL' CSV HEADER;

\COPY temp (patentnumber, abstracttextsequencenumber, langfilingcode, abstractlangcode, abstracttext) FROM 'C:/Users/Higuchid/Documents/PatentsData/PT_ABSTRACT/PT_abstract_2000001_to_4000000_2022-12-08.csv' WITH DELIMITER '|' NULL AS 'NULL' CSV HEADER;

INSERT INTO pt_abstract (patentnumber, langfilingcode, abstractlangcode, abstracttext)
SELECT patentnumber, langfilingcode, abstractlangcode, abstracttext
FROM temp;

DROP TABLE temp;