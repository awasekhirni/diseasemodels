/* ---------------------------------------------------------------------- */
/* Script generated with: DeZign for Databases V8.1.2                     */
/* Target DBMS:           PostgreSQL 9                                    */
/* Project file:          global_zipcode_database.dez                     */
/* Project name:                                                          */
/* Author:                                                                */
/* Script type:           Database creation script                        */
/* Created on:            2021-04-19 12:04                                */
/* ---------------------------------------------------------------------- */


/* ---------------------------------------------------------------------- */
/* Add tables                                                             */
/* ---------------------------------------------------------------------- */

/* ---------------------------------------------------------------------- */
/* Add table "Country"                                                    */
/* ---------------------------------------------------------------------- */

CREATE TABLE Country (
    countryId CHARACTER VARYING(40)  NOT NULL,
    countrycode CHARACTER(40),
    countryname CHARACTER VARYING(255),
    countrydetails CHARACTER(255),
    countrylang CHARACTER(100),
    countrygeojson CHARACTER VARYING(2000),
    countrymbr CHARACTER VARYING(2000),
    CONSTRAINT PK_Country PRIMARY KEY (countryId)
);

/* ---------------------------------------------------------------------- */
/* Add table "province"                                                   */
/* ---------------------------------------------------------------------- */

CREATE TABLE province (
    provinceid CHARACTER(40)  NOT NULL,
    provincecode CHARACTER(40),
    provincename CHARACTER(40),
    provincedetails CHARACTER(40),
    countryId CHARACTER VARYING(40),
    provincegeojson CHARACTER VARYING(2000),
    provincembr CHARACTER VARYING(2000),
    CONSTRAINT PK_province PRIMARY KEY (provinceid)
);

/* ---------------------------------------------------------------------- */
/* Add table "counties"                                                   */
/* ---------------------------------------------------------------------- */

CREATE TABLE counties (
    countyid CHARACTER(40)  NOT NULL,
    countyname CHARACTER VARYING(255),
    countycode CHARACTER(40),
    countydetails CHARACTER VARYING(255),
    provinceid CHARACTER(40),
    countiesgeojson CHARACTER VARYING(2000),
    countiesmbr CHARACTER VARYING(2000),
    CONSTRAINT PK_counties PRIMARY KEY (countyid)
);

/* ---------------------------------------------------------------------- */
/* Add table "cities"                                                     */
/* ---------------------------------------------------------------------- */

CREATE TABLE cities (
    cityid CHARACTER(40)  NOT NULL,
    citycode CHARACTER(40),
    cityname CHARACTER(255),
    citydetails CHARACTER(255),
    countyid CHARACTER(40),
    citygeojson CHARACTER VARYING(2000),
    citymbr CHARACTER VARYING(2000),
    CONSTRAINT PK_cities PRIMARY KEY (cityid)
);

/* ---------------------------------------------------------------------- */
/* Add table "zipcode"                                                    */
/* ---------------------------------------------------------------------- */

CREATE TABLE zipcode (
    zipcodeid CHARACTER(40)  NOT NULL,
    zipcodename CHARACTER(255),
    zipcodedetail CHARACTER VARYING(255),
    zipgeojson CHARACTER VARYING(2000),
    zipmbr CHARACTER VARYING(2000),
    cityid CHARACTER(40),
    CONSTRAINT PK_zipcode PRIMARY KEY (zipcodeid)
);

/* ---------------------------------------------------------------------- */
/* Add foreign key constraints                                            */
/* ---------------------------------------------------------------------- */

ALTER TABLE province ADD CONSTRAINT Country_province 
    FOREIGN KEY (countryId) REFERENCES Country (countryId);

ALTER TABLE counties ADD CONSTRAINT province_counties 
    FOREIGN KEY (provinceid) REFERENCES province (provinceid);

ALTER TABLE cities ADD CONSTRAINT counties_cities 
    FOREIGN KEY (countyid) REFERENCES counties (countyid);

ALTER TABLE zipcode ADD CONSTRAINT cities_zipcode 
    FOREIGN KEY (cityid) REFERENCES cities (cityid);
