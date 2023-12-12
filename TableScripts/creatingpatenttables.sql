CREATE TABLE PT_ABSTRACT (
	patentnumber int,
	abstractsequencenumber int,
	abstractlangcode VARCHAR(2),
	abstractlang VARCHAR(25),
	abstracttext TEXT,
	id int,
	CONSTRAINT fk_abstract FOREIGN KEY(patentnumber) REFERENCES PT_MAIN(patentnumber)
);

CREATE TABLE PT_DISCLOSURE (
	patentnumber int,
	disclosuretextsequencenumber int,
	parentappnumber VARCHAR(7),
	pctarticle2239fulfilleddate DATE,
	pctappnumber VARCHAR(17),
	pctsect371date VARCHAR(10),
	pctpubcountrycode VARCHAR(2),
	pctpubnumber VARCHAR(13),
	pctpubdate VARCHAR(10),
	pubkindtype VARCHAR(2),
	printedasamendedcountrycode VARCHAR(2),
	disclosuretext TEXT,
	id int,
	CONSTRAINT fk_disclosure FOREIGN KEY(patentnumber) REFERENCES PT_MAIN(patentnumber)
);

CREATE TABLE PT_INTERESTED_PARTY (
	patentnumber int,
	interestedpartycount int,
	agenttypecode VARCHAR(20),
	appltypecode VARCHAR(20),
	interestedpartytypecode VARCHAR(4),
	partyname TEXT,
	partyaddressline1 VARCHAR(100),
	partyaddressline2 VARCHAR(100),
	partyaddressline3 VARCHAR(100),
	partyaddressline4 VARCHAR(100),
	partyaddressline5 VARCHAR(100),
	partycity VARCHAR(75),
	partypostalcode VARCHAR(10),
	partyprovincecode VARCHAR(2),
	partyprovince VARCHAR(25),
	id int,
	CONSTRAINT fk_interestedparty FOREIGN KEY(patentnumber) REFERENCES PT_MAIN(patentnumber)
);

CREATE TABLE PT_IPC_CLASSIFICATION (
	patentnumber int,
	ipcclasscount int,
	filingdate VARCHAR(10),
	pctfilingdate VARCHAR(10),
	classificationlevel VARCHAR(50),
	classificationstatuscode VARCHAR(1),
	classificationstatus VARCHAR(50),
	classofficecountrycode VARCHAR(2),
	generationofficecountry VARCHAR(70),
	classlevelcode VARCHAR(1),
	ipcsectioncode VARCHAR(1),
	ipcsection VARCHAR(100),
	ipcclasscode VARCHAR(2),
	ipcclass TEXT,
	ipcsubclasscode VARCHAR(1),
	ipcsubclass TEXT,
	ipcmaingroupcode int,
	ipcgroup TEXT,
	ipcsubgroupcode int,
	ipcsubgroup TEXT,
	id int,
	CONSTRAINT fk_ipcclassification FOREIGN KEY(patentnumber) REFERENCES PT_MAIN(patentnumber)
);

CREATE TABLE PT_CLAIM (
	patentnumber int,
	claimtextsequencenumber int,
	parentappnumber VARCHAR(7),
	pctarticle2239fulfilleddate DATE,
	pctappnumber VARCHAR(17),
	pctsect371date VARCHAR(10),
	pctpubcountrycode VARCHAR(2),
	pctpubnumber VARCHAR(13),
	pctpubdate VARCHAR(10),
	pubkindtype VARCHAR(2),
	printedasamendedcountrycode VARCHAR(2),
	claimstext TEXT,
	id int,
	CONSTRAINT fk_claim FOREIGN KEY(patentnumber) REFERENCES PT_MAIN(patentnumber)
);