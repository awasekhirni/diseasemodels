/* ---------------------------------------------------------------------- */
/* Script generated with: DeZign for Databases V8.1.2                     */
/* Target DBMS:           PostgreSQL 9                                    */
/* Project file:          weatherdata.dez                                 */
/* Project name:                                                          */
/* Author:                                                                */
/* Script type:           Database drop script                            */
/* Created on:            2021-04-19 12:52                                */
/* ---------------------------------------------------------------------- */


/* ---------------------------------------------------------------------- */
/* Drop foreign key constraints                                           */
/* ---------------------------------------------------------------------- */

ALTER TABLE measuringunits DROP CONSTRAINT attribute_measuringunits;

ALTER TABLE userpreferences DROP CONSTRAINT users_userpreferences;

ALTER TABLE userpreferences DROP CONSTRAINT attribute_userpreferences;

ALTER TABLE userpreferences DROP CONSTRAINT measuringunits_userpreferences;

ALTER TABLE city DROP CONSTRAINT country_city;

ALTER TABLE users_city DROP CONSTRAINT users_users_city;

ALTER TABLE users_city DROP CONSTRAINT city_users_city;

ALTER TABLE Weather_hourlyforecast_log DROP CONSTRAINT city_Weather_hourlyforecast_log;

ALTER TABLE Weather_hourlyforecast_log DROP CONSTRAINT weatherstatus_Weather_hourlyforecast_log;

ALTER TABLE weather_daily_forecast_log DROP CONSTRAINT city_weather_daily_forecast_log;

ALTER TABLE weather_daily_forecast_log DROP CONSTRAINT weatherstatus_weather_daily_forecast_log;

/* ---------------------------------------------------------------------- */
/* Drop table "Weather_hourlyforecast_log"                                */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE Weather_hourlyforecast_log DROP CONSTRAINT PK_Weather_hourlyforecast_log;

DROP TABLE Weather_hourlyforecast_log;

/* ---------------------------------------------------------------------- */
/* Drop table "weather_daily_forecast_log"                                */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE weather_daily_forecast_log DROP CONSTRAINT PK_weather_daily_forecast_log;

DROP TABLE weather_daily_forecast_log;

/* ---------------------------------------------------------------------- */
/* Drop table "weatherstatus"                                             */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE weatherstatus DROP CONSTRAINT PK_weatherstatus;

DROP TABLE weatherstatus;

/* ---------------------------------------------------------------------- */
/* Drop table "users_city"                                                */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE users_city DROP CONSTRAINT PK_users_city;

DROP TABLE users_city;

/* ---------------------------------------------------------------------- */
/* Drop table "city"                                                      */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE city DROP CONSTRAINT PK_city;

DROP TABLE city;

/* ---------------------------------------------------------------------- */
/* Drop table "country"                                                   */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE country DROP CONSTRAINT PK_country;

DROP TABLE country;

/* ---------------------------------------------------------------------- */
/* Drop table "userpreferences"                                           */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE userpreferences DROP CONSTRAINT PK_userpreferences;

DROP TABLE userpreferences;

/* ---------------------------------------------------------------------- */
/* Drop table "measuringunits"                                            */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE measuringunits DROP CONSTRAINT PK_measuringunits;

DROP TABLE measuringunits;

/* ---------------------------------------------------------------------- */
/* Drop table "attribute"                                                 */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE attribute DROP CONSTRAINT PK_attribute;

DROP TABLE attribute;

/* ---------------------------------------------------------------------- */
/* Drop table "users"                                                     */
/* ---------------------------------------------------------------------- */

/* Drop constraints */

ALTER TABLE users DROP CONSTRAINT PK_users;

DROP TABLE users;
