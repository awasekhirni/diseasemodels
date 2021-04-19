/* ---------------------------------------------------------------------- */
/* Script generated with: DeZign for Databases V8.1.2                     */
/* Target DBMS:           PostgreSQL 9                                    */
/* Project file:          global_zipcode_database.dez                     */
/* Project name:                                                          */
/* Author:                                                                */
/* Script type:           Database drop script                            */
/* Created on:            2021-04-19 12:04                                */
/* ---------------------------------------------------------------------- */


/* ---------------------------------------------------------------------- */
/* Drop foreign key constraints                                           */
/* ---------------------------------------------------------------------- */

ALTER TABLE province DROP CONSTRAINT Country_province;

ALTER TABLE counties DROP CONSTRAINT province_counties;

ALTER TABLE cities DROP CONSTRAINT counties_cities;

ALTER TABLE zipcode DROP CONSTRAINT cities_zipcode;

/* ---------------------------------------------------------------------- */
/* Drop table "zipcode"                                                   */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE zipcode DROP CONSTRAINT PK_zipcode;

DROP TABLE zipcode;

/* ---------------------------------------------------------------------- */
/* Drop table "cities"                                                    */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE cities DROP CONSTRAINT PK_cities;

DROP TABLE cities;

/* ---------------------------------------------------------------------- */
/* Drop table "counties"                                                  */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE counties DROP CONSTRAINT PK_counties;

DROP TABLE counties;

/* ---------------------------------------------------------------------- */
/* Drop table "province"                                                  */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE province DROP CONSTRAINT PK_province;

DROP TABLE province;

/* ---------------------------------------------------------------------- */
/* Drop table "Country"                                                   */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE Country DROP CONSTRAINT PK_Country;

DROP TABLE Country;
