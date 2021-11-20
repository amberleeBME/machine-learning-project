-- DROP TABLE livingwage;

-- CREATE TABLE livingwage(
-- 	"Class" INTEGER
-- 	,"Level" VARCHAR
-- 	,_1A0C MONEY
-- 	,_1A1C MONEY
-- 	,_1A2C MONEY
-- 	,_1A3C MONEY
-- 	,_2A1W0C MONEY
-- 	,_2A1W1C MONEY
-- 	,_2A1W2C MONEY
-- 	,_2A1W3C MONEY
-- 	,_2A2W0C MONEY
-- 	,_2A2W1C MONEY
-- 	,_2A2W2C MONEY
-- 	,_2A2W3C MONEY
-- 	,"County" VARCHAR
-- 	,"State" VARCHAR
-- 	,"key" VARCHAR
-- 	);
SELECT *
FROM livingwage;

-- DROP TABLE livingwage2;
-- CREATE TABLE livingwage2 AS
-- (SELECT 
-- 	 livingwage."Class"
-- 	,livingwage."Level"
-- 	,_1A0C
-- 	,_1A1C
-- 	,_1A2C
-- 	,_1A3C
-- 	,_2A1W0C
-- 	,_2A1W1C
-- 	,_2A1W2C
-- 	,_2A1W3C
-- 	,_2A2W0C
-- 	,_2A2W1C
-- 	,_2A2W2C
-- 	,_2A2W3C
-- 	,TRIM(TRAILING 'County' FROM livingwage."County") as COUNTY
-- 	,"State"

-- FROM livingwage);

-- SELECT *
-- FROM livingwage2;

-- DROP TABLE fips;
-- CREATE TABLE fips(
-- 	"County" VARCHAR
-- 	,"State" VARCHAR
-- 	,"FIPS" VARCHAR
-- 	,"key" VARCHAR
-- );
SELECT *
FROM fips;

DROP TABLE main_living_wage;
CREATE TABLE main_living_wage AS
(SELECT 
 	a."Class"
	,a."Level"
	,_1A0C
	,_1A1C
	,_1A2C
	,_1A3C
	,_2A1W0C
	,_2A1W1C
	,_2A1W2C
	,_2A1W3C
	,_2A2W0C
	,_2A2W1C
	,_2A2W2C
	,_2A2W3C
	,a."County"
	,a."State"
 	,b."FIPS"

FROM livingwage a
INNER JOIN fips b
	ON a."key" = b."key"
	);

SELECT *
FROM main_living_wage;

DROP TABLE min_wage;
CREATE TABLE min_wage AS
(SELECT 

	_1A0C as "min 1a0c"
	,_1A1C as "min 1a1c"
	,_1A2C as "min 1a2c"
	,_1A3C as "min 1a3c"
	,_2A1W0C as "min 2a1w0c"
	,_2A1W1C as "min 2a1w1c"
	,_2A1W2C as "min 2a1w2c"
	,_2A1W3C as "min 2a1w3c"
	,_2A2W0C as "min 2a2w0c"
	,_2A2W1C as "min 2a2w1c"
	,_2A2W2C as "min 2a2w2c"
	,_2A2W3C as "min 2a2w3c"
	,"County"
	,"State"
 	,"FIPS"
FROM main_living_wage c
WHERE c."Level" = 'Minimum Wage');

DROP TABLE live_wage;
CREATE TABLE live_wage AS
(SELECT 
 	_1A0C as "live 1a0c"
	,_1A1C as "live 1a1c"
	,_1A2C as "live 1a2c"
	,_1A3C as "live 1a3c"
	,_2A1W0C as "live 2a1w0c"
	,_2A1W1C as "live 2a1w1c"
	,_2A1W2C as "live 2a1w2c"
	,_2A1W3C as "live 2a1w3c"
	,_2A2W0C as "live 2a2w0c"
	,_2A2W1C as "live 2a2w1c"
	,_2A2W2C as "live 2a2w2c"
	,_2A2W3C as "live 2a2w3c"
	,"County"
	,"State"
 	,"FIPS"
FROM main_living_wage c
WHERE c."Level" = 'Living Wage');

-- SELECT *
-- FROM live_wage;

DROP TABLE pov_wage;
CREATE TABLE pov_wage AS
(SELECT 

	_1A0C as "pov 1a0c"
	,_1A1C as "pov 1a1c"
	,_1A2C as "pov 1a2c"
	,_1A3C as "pov 1a3c"
	,_2A1W0C as "pov 2a1w0c"
	,_2A1W1C as "pov 2a1w1c"
	,_2A1W2C as "pov 2a1w2c"
	,_2A1W3C as "pov 2a1w3c"
	,_2A2W0C as "pov 2a2w0c"
	,_2A2W1C as "pov 2a2w1c"
	,_2A2W2C as "pov 2a2w2c"
	,_2A2W3C as "pov 2a2w3c"
	,"County"
	,"State"
 	,"FIPS"
FROM main_living_wage c
WHERE c."Level" = 'Poverty Wage');

-- SELECT *
-- FROM pov_wage;

DROP TABLE main_wages1;
CREATE TABLE main_wages1 AS
(SELECT
	c."pov 1a0c"
	,c."pov 1a1c"
	,c."pov 1a2c"
	,c."pov 1a3c"
	,c."pov 2a1w0c"
	,c."pov 2a1w1c"
	,c."pov 2a1w2c"
	,c."pov 2a1w3c"
	,c."pov 2a2w0c"
	,c."pov 2a2w1c"
	,c."pov 2a2w2c"
	,c."pov 2a2w3c"
 	,b."live 1a0c"
	,b."live 1a1c"
	,b."live 1a2c"
	,b."live 1a3c"
	,b."live 2a1w0c"
	,b."live 2a1w1c"
	,b."live 2a1w2c"
	,b."live 2a1w3c"
	,b."live 2a2w0c"
	,b."live 2a2w1c"
	,b."live 2a2w2c"
	,b."live 2a2w3c"
 	,a."min 1a0c"
	,a."min 1a1c"
	,a."min 1a2c"
	,a."min 1a3c"
	,a."min 2a1w0c"
	,a."min 2a1w1c"
	,a."min 2a1w2c"
	,a."min 2a1w3c"
	,a."min 2a2w0c"
	,a."min 2a2w1c"
	,a."min 2a2w2c"
	,a."min 2a2w3c"
	,a."County"
	,a."State"
 	,a."FIPS"
FROM min_wage a
INNER JOIN live_wage b 
ON a."County" = b."County"
	AND a."FIPS" = b."FIPS"
 	AND a."State" = b."State"
INNER JOIN pov_wage c
ON a."County" = c."County"
	AND a."FIPS" = c."FIPS"
	AND a."State" = c."State");

-- SELECT*
-- FROM main_wages1;

-- CREATE TABLE education (
-- 	"FIPS" VARCHAR
-- 	,pct_less_hs DECIMAL
-- 	,pct_hs DECIMAL
-- 	,pct_some_college DECIMAL
-- 	,pct_college DECIMAL
-- );
-- SELECT COUNT (*)
-- FROM education;

DROP TABLE edu_wages;
CREATE TABLE edu_wages AS
(SELECT 
 	 a."County"
	,a."State"
 	,b."FIPS"
 	,a."pov 1a0c"
	,a."pov 1a1c"
	,a."pov 1a2c"
	,a."pov 1a3c"
	,a."pov 2a1w0c"
	,a."pov 2a1w1c"
	,a."pov 2a1w2c"
	,a."pov 2a1w3c"
	,a."pov 2a2w0c"
	,a."pov 2a2w1c"
	,a."pov 2a2w2c"
	,a."pov 2a2w3c"
 	,a."live 1a0c"
	,a."live 1a1c"
	,a."live 1a2c"
	,a."live 1a3c"
	,a."live 2a1w0c"
	,a."live 2a1w1c"
	,a."live 2a1w2c"
	,a."live 2a1w3c"
	,a."live 2a2w0c"
	,a."live 2a2w1c"
	,a."live 2a2w2c"
	,a."live 2a2w3c"
 	,a."min 1a0c"
	,a."min 1a1c"
	,a."min 1a2c"
	,a."min 1a3c"
	,a."min 2a1w0c"
	,a."min 2a1w1c"
	,a."min 2a1w2c"
	,a."min 2a1w3c"
	,a."min 2a2w0c"
	,a."min 2a2w1c"
	,a."min 2a2w2c"
	,a."min 2a2w3c"
 	,b.pct_less_hs
	,b.pct_hs 
	,b.pct_some_college 
	,b.pct_college  
FROM main_wages1 a
INNER JOIN education b
ON a."FIPS" = b."FIPS");

SELECT *
FROM edu_wages;

SELECT COUNT (*)
FROM edu_wages;

DROP TABLE all_crime;
CREATE TABLE all_crime(
	fips VARCHAR
	,"crime_per_10k" DECIMAL
);
SELECT COUNT (*)
FROM all_crime;

CREATE TABLE add_crime AS
(SELECT
 	 a."County"
	,a."State"
 	,a."FIPS"
 	,a."pov 1a0c"
	,a."pov 1a1c"
	,a."pov 1a2c"
	,a."pov 1a3c"
	,a."pov 2a1w0c"
	,a."pov 2a1w1c"
	,a."pov 2a1w2c"
	,a."pov 2a1w3c"
	,a."pov 2a2w0c"
	,a."pov 2a2w1c"
	,a."pov 2a2w2c"
	,a."pov 2a2w3c"
 	,a."live 1a0c"
	,a."live 1a1c"
	,a."live 1a2c"
	,a."live 1a3c"
	,a."live 2a1w0c"
	,a."live 2a1w1c"
	,a."live 2a1w2c"
	,a."live 2a1w3c"
	,a."live 2a2w0c"
	,a."live 2a2w1c"
	,a."live 2a2w2c"
	,a."live 2a2w3c"
 	,a."min 1a0c"
	,a."min 1a1c"
	,a."min 1a2c"
	,a."min 1a3c"
	,a."min 2a1w0c"
	,a."min 2a1w1c"
	,a."min 2a1w2c"
	,a."min 2a1w3c"
	,a."min 2a2w0c"
	,a."min 2a2w1c"
	,a."min 2a2w2c"
	,a."min 2a2w3c"
 	,a.pct_less_hs
	,a.pct_hs 
	,a.pct_some_college 
	,a.pct_college  
 	,b.crime_per_10k
FROM edu_wages a
INNER JOIN all_crime b
ON a."FIPS" = b.fips);

-- SELECT COUNT (*)
-- FROM add_crime;

CREATE TABLE unemp(
	fips VARCHAR
	,unemployment_rate_2019 DECIMAL
	,median_household_income_2019 DECIMAL
);
	
SELECT * 
FROM unemp;

DROP TABLE master_data;
CREATE TABLE master_data AS
(SELECT
	a."County"
	,a."State"
 	,a."FIPS"
 	,a."pov 1a0c"
	,a."pov 1a1c"
	,a."pov 1a2c"
	,a."pov 1a3c"
	,a."pov 2a1w0c"
	,a."pov 2a1w1c"
	,a."pov 2a1w2c"
	,a."pov 2a1w3c"
	,a."pov 2a2w0c"
	,a."pov 2a2w1c"
	,a."pov 2a2w2c"
	,a."pov 2a2w3c"
 	,a."live 1a0c"
	,a."live 1a1c"
	,a."live 1a2c"
	,a."live 1a3c"
	,a."live 2a1w0c"
	,a."live 2a1w1c"
	,a."live 2a1w2c"
	,a."live 2a1w3c"
	,a."live 2a2w0c"
	,a."live 2a2w1c"
	,a."live 2a2w2c"
	,a."live 2a2w3c"
 	,a."min 1a0c"
	,a."min 1a1c"
	,a."min 1a2c"
	,a."min 1a3c"
	,a."min 2a1w0c"
	,a."min 2a1w1c"
	,a."min 2a1w2c"
	,a."min 2a1w3c"
	,a."min 2a2w0c"
	,a."min 2a2w1c"
	,a."min 2a2w2c"
	,a."min 2a2w3c"
 	,a.pct_less_hs
	,a.pct_hs 
	,a.pct_some_college 
	,a.pct_college  
 	,a.crime_per_10k
 	,b.unemployment_rate_2019
 	,b.median_household_income_2019
FROM add_crime a
INNER JOIN unemp b
ON a."FIPS" = b.fips);

SELECT COUNT (*)
FROM master_data;