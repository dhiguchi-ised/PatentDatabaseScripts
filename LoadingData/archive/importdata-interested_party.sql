\COPY patents_pt_interested_party (patentnumber_id, agenttypecode, appltypecode, interestedpartytypecode, interestedpartytype, ownerenabledate, ownerenddate, partyname, partyaddressline1, partyaddressline2, partyaddressline3, partyaddressline4, partyaddressline5, partycity, partyprovincecode, partyprovince, partypostalcode, partycountrycode, partycountry, id) FROM 'C:/Users/Higuchid/Documents/PatentsData/PT_INTERESTED_PARTY/PT_interested_party_2000001_to_4000000_2022-12-08_new.csv' WITH DELIMITER '|' NULL AS 'NULL' CSV HEADER QUOTE '[' encoding 'UTF8';

\COPY patents_pt_interested_party (patentnumber_id, agenttypecode, appltypecode, interestedpartytypecode, interestedpartytype, ownerenabledate, ownerenddate, partyname, partyaddressline1, partyaddressline2, partyaddressline3, partyaddressline4, partyaddressline5, partycity, partyprovincecode, partyprovince, partypostalcode, partycountrycode, partycountry, id) FROM 'C:/Users/Higuchid/Documents/PatentsData/PT_INTERESTED_PARTY/PT_interested_party_1_to_2000000_2022-12-08_new.csv' WITH DELIMITER '|' NULL AS 'NULL' CSV HEADER QUOTE '[' encoding 'UTF8';

UPDATE patents_pt_interested_party
SET agenttypecode = NULL
WHERE agenttypecode = '-2';

UPDATE patents_pt_interested_party
SET appltypecode = NULL
WHERE appltypecode = '-2';

UPDATE patents_pt_interested_party
SET partyaddressline5 = NULL
WHERE partyaddressline5 = 'NA';

UPDATE patents_pt_interested_party
SET partyprovincecode = NULL
WHERE partyprovincecode = '-1';

UPDATE patents_pt_interested_party
SET partyprovincecode = NULL
WHERE partyprovincecode = 'XX';

UPDATE patents_pt_interested_party
SET partyprovince = NULL
WHERE partyprovince = 'Unknown';

UPDATE patents_pt_interested_party
SET partypostalcode = NULL
WHERE partypostalcode = '-1';

UPDATE patents_pt_interested_party
SET partycountrycode = NULL
WHERE partycountrycode = '-1';

UPDATE patents_pt_interested_party
SET partycountrycode = NULL
WHERE partycountrycode = 'XX';

UPDATE patents_pt_interested_party
SET partycountry = NULL
WHERE partycountry = 'Country Unknown';

UPDATE patents_pt_interested_party
SET partycountry = NULL WHERE partycountry = 'Unknown';