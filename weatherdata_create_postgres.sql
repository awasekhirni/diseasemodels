/* ---------------------------------------------------------------------- */
/* Script generated with: DeZign for Databases V8.1.2                     */
/* Target DBMS:           PostgreSQL 9                                    */
/* Project file:          weatherdata.dez                                 */
/* Project name:                                                          */
/* Author:                                                                */
/* Script type:           Database creation script                        */
/* Created on:            2021-04-19 12:52                                */
/* ---------------------------------------------------------------------- */


/* ---------------------------------------------------------------------- */
/* Add tables                                                             */
/* ---------------------------------------------------------------------- */

/* ---------------------------------------------------------------------- */
/* Add table "users"                                                      */
/* ---------------------------------------------------------------------- */

CREATE TABLE users (
    userid CHARACTER(40)  NOT NULL,
    email CHARACTER(255),
    contactnumber CHARACTER(40),
    addressline1 CHARACTER(255),
    addressline2 CHARACTER(255),
    addressline3 CHARACTER(255),
    city CHARACTER(255),
    province CHARACTER(255),
    country CHARACTER(255),
    postcode CHARACTER(40),
    CONSTRAINT PK_users PRIMARY KEY (userid)
);

/* ---------------------------------------------------------------------- */
/* Add table "attribute"                                                  */
/* ---------------------------------------------------------------------- */

CREATE TABLE attribute (
    attributeid CHARACTER(40)  NOT NULL,
    attributename CHARACTER(255),
    CONSTRAINT PK_attribute PRIMARY KEY (attributeid)
);

/* ---------------------------------------------------------------------- */
/* Add table "measuringunits"                                             */
/* ---------------------------------------------------------------------- */

CREATE TABLE measuringunits (
    measurementid CHARACTER(40)  NOT NULL,
    measurementunitname CHARACTER(255),
    measurementunitdescription CHARACTER(255),
    attributeid CHARACTER(40),
    CONSTRAINT PK_measuringunits PRIMARY KEY (measurementid)
);

/* ---------------------------------------------------------------------- */
/* Add table "userpreferences"                                            */
/* ---------------------------------------------------------------------- */

CREATE TABLE userpreferences (
    userid CHARACTER(40)  NOT NULL,
    attributeid CHARACTER(40)  NOT NULL,
    measurementid CHARACTER(40),
    CONSTRAINT PK_userpreferences PRIMARY KEY (userid, attributeid)
);

/* ---------------------------------------------------------------------- */
/* Add table "country"                                                    */
/* ---------------------------------------------------------------------- */

CREATE TABLE country (
    countryid CHARACTER(40)  NOT NULL,
    countryname CHARACTER VARYING(255),
    CONSTRAINT PK_country PRIMARY KEY (countryid)
);

/* ---------------------------------------------------------------------- */
/* Add table "city"                                                       */
/* ---------------------------------------------------------------------- */

CREATE TABLE city (
    cityid CHARACTER(40)  NOT NULL,
    cityname CHARACTER(40),
    citylongitude CHARACTER(40),
    citylatitude CHARACTER(40),
    zip CHARACTER(40),
    countryid CHARACTER(40),
    CONSTRAINT PK_city PRIMARY KEY (cityid)
);

/* ---------------------------------------------------------------------- */
/* Add table "users_city"                                                 */
/* ---------------------------------------------------------------------- */

CREATE TABLE users_city (
    userid CHARACTER(40)  NOT NULL,
    cityid CHARACTER(40)  NOT NULL,
    CONSTRAINT PK_users_city PRIMARY KEY (userid, cityid)
);

/* ---------------------------------------------------------------------- */
/* Add table "weatherstatus"                                              */
/* ---------------------------------------------------------------------- */

CREATE TABLE weatherstatus (
    weatherstatusid CHARACTER(40)  NOT NULL,
    weatherstatus CHARACTER(100),
    CONSTRAINT PK_weatherstatus PRIMARY KEY (weatherstatusid)
);

/* ---------------------------------------------------------------------- */
/* Add table "weather_daily_forecast_log"                                 */
/* ---------------------------------------------------------------------- */

CREATE TABLE weather_daily_forecast_log (
    id CHARACTER(40)  NOT NULL,
    calendar_date DATE,
    min_temperature DOUBLE PRECISION,
    max_temperature DOUBLE PRECISION,
    avg_humidity_in_percentage DOUBLE PRECISION,
    sunrise_time TIMESTAMP,
    sunset_time TIMESTAMP,
    last_updated_at TIMESTAMP,
    source_system CHARACTER(100),
    cityid CHARACTER(40),
    weatherstatusid CHARACTER(40),
    CONSTRAINT PK_weather_daily_forecast_log PRIMARY KEY (id)
);

/* ---------------------------------------------------------------------- */
/* Add table "Weather_hourlyforecast_log"                                 */
/* ---------------------------------------------------------------------- */

CREATE TABLE Weather_hourlyforecast_log (
    weatherid CHARACTER(40)  NOT NULL,
    start_timestamp TIMESTAMP,
    end_timestamp TIMESTAMP,
    temperature DOUBLE PRECISION,
    feel_like_temperature DOUBLE PRECISION,
    humidity_in_percentage DOUBLE PRECISION,
    windspeedinmph DOUBLE PRECISION,
    winddirection CHARACTER(40),
    pressureinmmhg DOUBLE PRECISION,
    visibilityinmph DOUBLE PRECISION,
    dewpoint DOUBLE PRECISION,
    rainfallincm DOUBLE PRECISION,
    snowdepthincm DOUBLE PRECISION,
    airquality_no2 DOUBLE PRECISION,
    airquality_so2 DOUBLE PRECISION,
    airquality_volatileorganiccompound DOUBLE PRECISION,
    airquality_03 DOUBLE PRECISION,
    airquality_pm2.5 DOUBLE PRECISION,
    airquality_pm2.5_24hr DOUBLE PRECISION,
    airquality_pm10 DOUBLE PRECISION,
    airquality_pm10_24hr DOUBLE PRECISION,
    airquality_03_8hr DOUBLE PRECISION,
    cityid CHARACTER(40),
    weatherstatusid CHARACTER(40),
    CONSTRAINT PK_Weather_hourlyforecast_log PRIMARY KEY (weatherid)
);

/* ---------------------------------------------------------------------- */
/* Add foreign key constraints                                            */
/* ---------------------------------------------------------------------- */

ALTER TABLE measuringunits ADD CONSTRAINT attribute_measuringunits 
    FOREIGN KEY (attributeid) REFERENCES attribute (attributeid);

ALTER TABLE userpreferences ADD CONSTRAINT users_userpreferences 
    FOREIGN KEY (userid) REFERENCES users (userid);

ALTER TABLE userpreferences ADD CONSTRAINT attribute_userpreferences 
    FOREIGN KEY (attributeid) REFERENCES attribute (attributeid);

ALTER TABLE userpreferences ADD CONSTRAINT measuringunits_userpreferences 
    FOREIGN KEY (measurementid) REFERENCES measuringunits (measurementid);

ALTER TABLE city ADD CONSTRAINT country_city 
    FOREIGN KEY (countryid) REFERENCES country (countryid);

ALTER TABLE users_city ADD CONSTRAINT users_users_city 
    FOREIGN KEY (userid) REFERENCES users (userid);

ALTER TABLE users_city ADD CONSTRAINT city_users_city 
    FOREIGN KEY (cityid) REFERENCES city (cityid);

ALTER TABLE Weather_hourlyforecast_log ADD CONSTRAINT city_Weather_hourlyforecast_log 
    FOREIGN KEY (cityid) REFERENCES city (cityid);

ALTER TABLE Weather_hourlyforecast_log ADD CONSTRAINT weatherstatus_Weather_hourlyforecast_log 
    FOREIGN KEY (weatherstatusid) REFERENCES weatherstatus (weatherstatusid);

ALTER TABLE weather_daily_forecast_log ADD CONSTRAINT city_weather_daily_forecast_log 
    FOREIGN KEY (cityid) REFERENCES city (cityid);

ALTER TABLE weather_daily_forecast_log ADD CONSTRAINT weatherstatus_weather_daily_forecast_log 
    FOREIGN KEY (weatherstatusid) REFERENCES weatherstatus (weatherstatusid);
