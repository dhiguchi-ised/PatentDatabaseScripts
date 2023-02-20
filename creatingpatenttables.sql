CREATE TABLE PT_MAIN (
	patentnumber int PRIMARY KEY,
	filingdate DATE,
	granteddate DATE,
	appstatuscode VARCHAR(2),
	apptypecode VARCHAR(10),
	patapptitleenglish TEXT,
	patapptitlefrench TEXT,
	bibliographicfileextractdate DATE,
	countryofpublicationcode VARCHAR(2),
	documentkindtype VARCHAR(2),
	examinationrequestdate DATE,
	filingcountrycode VARCHAR(2),
	langfilingcode VARCHAR(2),
	licenseforsaleindicator BOOLEAN,
	pctappnumber VARCHAR(17),
	pctpubnumber VARCHAR(13),
	pctpubdate DATE,
	parentappnumber VARCHAR(7),
	pctarticle2239fulfilleddate DATE,
	pctsect371date DATE,
	pctpubcountrycode VARCHAR(2),
	pubkindtype VARCHAR(2),
	printedasamendedcountrycode VARCHAR(2)
);

CREATE TABLE PT_PRIORITY_CLAIM (
	patentnumber int,
	foreignapp_patnumber VARCHAR(50),
	priorityclaimkindcode VARCHAR(50),
	priorityclaimcountrycode VARCHAR(2),
	priorityclaimcountry VARCHAR(60),
	priorityclaimcalendardate DATE,
	CONSTRAINT fk_priorityclaim FOREIGN KEY(patentnumber) REFERENCES PT_MAIN(patentnumber)
);

CREATE TABLE PT_ABSTRACT (
	patentnumber int,
	langfilingcode VARCHAR(2),
	abstractlangcode VARCHAR(2),
	abstracttext TEXT
	CONSTRAINT fk_abstract FOREIGN KEY(patentnumber) REFERENCES PT_MAIN(patentnumber)
);

CREATE TABLE PT_DISCLOSURE (
	patentnumber int,
	disclosuretextsequencenumber int,
	langfilingcode VARCHAR(2),
	disclosuretext TEXT,
	CONSTRAINT fk_disclosure FOREIGN KEY(patentnumber) REFERENCES PT_MAIN(patentnumber)
);

CREATE TABLE PT_INTERESTED_PARTY (
	patentnumber int,
	agenttypecode VARCHAR(10),
	appltypecode VARCHAR(10),
	interestedpartytypecode VARCHAR(4),
	interestedpartytype VARCHAR(10),
	ownerenabledate DATE,
	ownerenddate DATE,
	partyname VARCHAR(50),
	partyaddressline1 VARCHAR(50),
	partyaddressline2 VARCHAR(50),
	partyaddressline3 VARCHAR(50),
	partyaddressline4 VARCHAR(50),
	partyaddressline5 VARCHAR(50),
	partycity VARCHAR(50),
	partyprovincecode VARCHAR(2),
	partyprovince VARCHAR(25),
	partypostalcode VARCHAR(10),
	partycountrycode VARCHAR(2),
	partycountry VARCHAR(60),
	CONSTRAINT fk_interestedparty FOREIGN KEY(patentnumber) REFERENCES PT_MAIN(patentnumber)
);

CREATE TABLE PT_IPC_CLASSIFICATION (
	patentnumber int,
	ipcclasssequencenumber int,
	ipcversiondate DATE,
	classificationlevel VARCHAR(1),
	classificationstatuscode VARCHAR(1),
	classificationstatus VARCHAR(50),
	ipcsectioncode VARCHAR(1),
	ipcsection VARCHAR(100),
	ipcclasscode VARCHAR(2),
	ipcclass VARCHAR(150),
	ipcsubclasscode VARCHAR(1),
	ipcsubclass TEXT,
	ipcmaingroupcode int,
	ipcgroup TEXT,
	ipcsubgroupcode int,
	ipcsubgroup TEXT,
	CONSTRAINT fk_ipcclassification FOREIGN KEY(patentnumber) REFERENCES PT_MAIN(patentnumber)
);

CREATE TABLE PT_CLAIM (
	patentnumber int,
	claimtextsequencenumber VARCHAR(4),
	langfilingcode VARCHAR(2),
	claimstext TEXT,
	CONSTRAINT fk_claim FOREIGN KEY(patentnumber) REFERENCES PT_MAIN(patentnumber)
);