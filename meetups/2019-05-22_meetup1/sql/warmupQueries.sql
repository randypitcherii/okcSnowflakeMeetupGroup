// ===========================================================================
// PART 1 - GETTING COMFORTABLE IN SNOWFLAKE
//
// get to know some basic parts of Snowflake and play with some demo data.
// ===========================================================================
// set context
USE ROLE OKC_MEETUP_ROLE;
USE WAREHOUSE OKC_MEETUP_WH;

// run a big, bulky query
SELECT
  l_returnflag,
  l_linestatus,
  SUM(l_quantity) AS sum_qty,
  SUM(l_extendedprice) AS sum_base_price,
  SUM(l_extendedprice * (1 - l_discount)) AS sum_disc_price,
  SUM(l_extendedprice * (1 - l_discount) * (1 + l_tax)) AS sum_charge,
  AVG(l_quantity) AS avg_qty,
  AVG(l_extendedprice) AS avg_price,
  AVG(l_discount) AS avg_disc,
  COUNT(*) AS count_order
FROM
    SNOWFLAKE_SAMPLE_DATA.TPCH_SF100.LINEITEM
WHERE
  l_receiptdate <= DATEADD(DAY, -90, TO_DATE('1998-12-01'))
GROUP BY
  l_returnflag,
  l_linestatus
ORDER BY
  l_returnflag,
  l_linestatus;




// Let's shift to some weather data.

// How many weather records are there?
SELECT COUNT(*) / 1000 / 1000 FROM SNOWFLAKE_SAMPLE_DATA.WEATHER.WEATHER_14_TOTAL;

// View the semi-strucutred data directly in the table
SELECT 
  *
FROM 
  SNOWFLAKE_SAMPLE_DATA.WEATHER.WEATHER_14_TOTAL
LIMIT 10;

// Select json elements directly from the json document in column V
SELECT 
  V:"time", 
  V:"city"."name", 
  V:"city"."country", 
  V:"main"."temp", 
  V:"weather"
FROM
  SNOWFLAKE_SAMPLE_DATA.WEATHER.WEATHER_14_TOTAL
LIMIT 10;

// View all weather records for the past 2 weeks
SELECT 
  *
FROM 
  SNOWFLAKE_SAMPLE_DATA.WEATHER.WEATHER_14_TOTAL 
WHERE 
    T >= DATEADD(DAY,-14,CURRENT_TIMESTAMP);

// ===========================================================================