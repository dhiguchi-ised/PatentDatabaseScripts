\c patentsdata

\COPY pt_interested_party FROM 'C:/Users/Higuchid/Documents/PatentsData/PT_INTERESTED_PARTY/PT_interested_party_2000001_to_4000000_2022-12-08.csv' WITH DELIMITER '|' NULL AS 'NULL' CSV HEADER;

\COPY pt_interested_party FROM 'C:/Users/Higuchid/Documents/PatentsData/PT_INTERESTED_PARTY/PT_interested_party_1_to_2000000_2022-12-08.csv' WITH DELIMITER '|' NULL AS 'NULL' CSV HEADER;

UPDATE pt_interested_party
SET agenttypecode = NULL
WHERE agenttypecode = '-2';

UPDATE pt_interested_party
SET appltypecode = NULL
WHERE appltypecode = '-2';

UPDATE pt_interested_party
SET partyaddressline5 = NULL
WHERE partyaddressline5 = 'NA';

UPDATE pt_interested_party
SET partyprovincecode = NULL
WHERE partyprovincecode = '-1';

UPDATE pt_interested_party
SET partyprovincecode = NULL
WHERE partyprovincecode = 'XX';

UPDATE pt_interested_party
SET partyprovince = NULL
WHERE partyprovince = 'Unknown';

UPDATE pt_interested_party
SET partypostalcode = NULL
WHERE partypostalcode = '-1';

UPDATE pt_interested_party
SET partycountrycode = NULL
WHERE partycountrycode = '-1';

UPDATE pt_interested_party
SET partycountrycode = NULL
WHERE partycountrycode = 'XX';

UPDATE pt_interested_party
SET partycountry = NULL
WHERE partycountry = 'Country Unknown';

UPDATE pt_interested_party
SET partycountry = NULL
WHERE partycountry = 'Unknown';