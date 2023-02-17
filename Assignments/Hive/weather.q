CREATE EXTERNAL TABLE IF NOT EXISTS weather (WBANNO int, LST_DATE DATE, CRX_VN FLOAT, LONGITUDE FLOAT,LATITUDE FLOAT,T_DAILY_MAX FLOAT,T_DAILY_MIN FLOAT,
T_DAILY_MEAN FLOAT,T_DAILY_AVG FLOAT,P_DAILY_CALC FLOAT,SOLARAD_DAILY String,SUR_TEMP_DAILY_TYPE FLOAT, SUR_TEMP_DAILY_MAX FLOAT,
SUR_TEMP_DAILY_MIN FLOAT,SUR_TEMP_DAILY_AVG FLOAT,RH_DAILY_MAX FLOAT, RH_DAILY_MIN FLOAT,RH_DAILY_AVG FLOAT,SOIL_MOISTURE_5_DAILY FLOAT,
SOIL_MOISTURE_10_DAILY FLOAT, SOIL_MOISTURE_20_DAILY  FLOAT, SOIL_MOISTURE_50_DAILY FLOAT, SOIL_MOISTURE_100_DAILY FLOAT,
SOIL_TEMP_5_DAILY FLOAT, SOIL_TEMP_10_DAILY FLOAT, SOIL_TEMP_20_DAILY FLOAT, SOIL_TEMP_50_DAILY FLOAT, SOIL_TEMP_100_DAILY  FLOAT)
COMMENT 'Weather Details'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
STORED AS TEXTFILE;


--My Path
LOAD DATA LOCAL INPATH '/mnt/c/Users/Miles/Documents/GitHub/futurense_hadoop-pyspark/labs/dataset/weather/weather_data.txt' OVERWRITE INTO TABLE weather;

SELECT * FROM weather LIMIT 10;

SELECT MAX(t_daily_max), MIN(t_daily_min) FROM weather;

SELECT DATE_FORMAT(lst_date, '%M'),MAX(t_daily_max), MIN(t_daily_min) FROM weather GROUP BY DATE_FORMAT(lst_date, '%M');
