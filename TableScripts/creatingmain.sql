CREATE TABLE PT_MAIN (
	patentnumber int PRIMARY KEY,
	filingdate VARCHAR(10),
	pctfilingdate VARCHAR(10),
	granteddate VARCHAR(11),
	apptypecode VARCHAR(10),
	appstatuscode VARCHAR(2),
	bibliographicfileextractdate VARCHAR(10),
	countryofpublicationcode VARCHAR(2),
	documentkindtype VARCHAR(2),
	examinationrequestdate VARCHAR(10),
	filingcountrycode VARCHAR(2),
	langfilingcode VARCHAR(2),
	licenseforsaleindicator BOOLEAN,
	pctappnumber VARCHAR(17),
	pctpubnumber VARCHAR(13),
	pctpubdate VARCHAR(10)
);